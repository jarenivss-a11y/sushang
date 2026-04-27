// ============================================================
// 【新手测试页面】
// 作用：帮助小白了解自己的基础，推荐学习内容
// ============================================================

import 'package:flutter/material.dart';

class NewUserTestScreen extends StatefulWidget {
  const NewUserTestScreen({super.key});

  @override
  State<NewUserTestScreen> createState() => _NewUserTestScreenState();
}

class _NewUserTestScreenState extends State<NewUserTestScreen> {
  // 当前题目索引
  int _currentQuestion = 0;

  // 用户选择的答案
  final Map<int, int> _answers = {};

  // 测试结果
  String? _result;
  String? _recommendation;

  // 5道测试题
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '你之前接触过编程吗？',
      'options': [
        '完全没接触过，就是小白',
        '用过Scratch或类似拖拽编程',
        '学过一点HTML或CSS',
        '写过一些代码（任何语言）',
      ],
      'score': [0, 1, 2, 3],
    },
    {
      'question': '你学习编程的目的是？',
      'options': [
        '好奇心，想了解编程是什么',
        '想自己做个小App或网站',
        '想转行当程序员',
        '工作需要用到',
      ],
      'score': [0, 2, 3, 1],
    },
    {
      'question': '你每天能投入多少时间学习？',
      'options': [
        '不到30分钟',
        '30分钟到1小时',
        '1-2小时',
        '2小时以上',
      ],
      'score': [1, 2, 3, 4],
    },
    {
      'question': '遇到问题时，你的态度是？',
      'options': [
        '完全不知道怎么办，想放弃',
        '愿意尝试，但容易卡住',
        '会先自己思考，再问人',
        '会自己查资料解决',
      ],
      'score': [0, 1, 2, 3],
    },
    {
      'question': '你觉得自己学编程最大的挑战是？',
      'options': [
        '看不懂专业术语',
        '不知道从哪里开始',
        '代码太难，理解不了',
        '坚持不下去',
      ],
      'score': [1, 2, 1, 0],
    },
  ];

  // 计算总分
  int _calculateScore() {
    int total = 0;
    for (var entry in _answers.entries) {
      int questionIndex = entry.key;
      int answerIndex = entry.value;
      total += _questions[questionIndex]['score'][answerIndex] as int;
    }
    return total;
  }

  // 分析结果
  void _analyzeResult() {
    int score = _calculateScore();

    if (score <= 5) {
      _result = '🌱 编程小白';
      _recommendation = '建议从阶段一开始，先学习最基础的编程概念。我们会使用最通俗易懂的语言带你入门！';
    } else if (score <= 10) {
      _result = '📖 编程初学者';
      _recommendation = '有一些基础认知，建议从阶段一后半部分开始，直接动手做项目会进步更快！';
    } else {
      _result = '💪 有基础的学习者';
      _recommendation = '你的基础不错！可以直接从阶段二开始，边做项目边学习，有问题随时问！';
    }
  }

  // 选择答案 - 选择后自动跳转到下一题
  void _selectAnswer(int answerIndex) {
    setState(() {
      _answers[_currentQuestion] = answerIndex;
    });

    // 延迟一点跳转，让用户看到选中的效果
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _nextQuestion();
      }
    });
  }

  // 下一题
  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    } else {
      // 完成测试
      _analyzeResult();
      setState(() {});
    }
  }

  // 上一题
  void _previousQuestion() {
    if (_currentQuestion > 0) {
      setState(() {
        _currentQuestion--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 显示结果页面
    if (_result != null) {
      return _buildResultPage();
    }

    // 测试题目页面
    return _buildQuestionPage();
  }

  // 题目页面
  Widget _buildQuestionPage() {
    Map<String, dynamic> question = _questions[_currentQuestion];
    int? selectedAnswer = _answers[_currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text('新手测试'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 进度指示器
            Text(
              '第 ${_currentQuestion + 1} / ${_questions.length} 题',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: (_currentQuestion + 1) / _questions.length,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
            ),

            const SizedBox(height: 30),

            // 题目
            Text(
              question['question'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 选项
            ...List.generate(
              (question['options'] as List).length,
              (index) => _buildOptionCard(
                index,
                question['options'][index],
                selectedAnswer == index,
              ),
            ),

            const Spacer(),

            // 按钮行
            Row(
              children: [
                if (_currentQuestion > 0)
                  TextButton(
                    onPressed: _previousQuestion,
                    child: const Text('上一题'),
                  ),
                const Spacer(),
                ElevatedButton(
                  onPressed: selectedAnswer != null ? _nextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    _currentQuestion < _questions.length - 1 ? '下一题' : '查看结果',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 选项卡片
  Widget _buildOptionCard(int index, String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _selectAnswer(index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange.withValues(alpha: 0.1) : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.orange : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? Colors.orange : Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index), // A, B, C, D
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.orange[800] : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 结果页面
  Widget _buildResultPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试结果'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            // 结果图标
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.emoji_events,
                size: 60,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 30),

            // 结果标题
            Text(
              _result!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // 推荐内容
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    '📋 学习建议',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _recommendation!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 分数
            Text(
              '测试得分：$_calculateScore() 分',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const Spacer(),

            // 开始学习按钮
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // 可以在这里导航到对应的学习阶段
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '开始学习 →',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 重新测试按钮
            TextButton(
              onPressed: () {
                setState(() {
                  _currentQuestion = 0;
                  _answers.clear();
                  _result = null;
                  _recommendation = null;
                });
              },
              child: const Text('重新测试'),
            ),
          ],
        ),
      ),
    );
  }
}
