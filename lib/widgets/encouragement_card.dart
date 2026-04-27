// ============================================================
// 【鼓励卡片组件】
// 作用：显示鼓励语，增强学习信心
// ============================================================

import 'package:flutter/material.dart';

class EncouragementCard extends StatelessWidget {
  // 鼓励语列表
  static const List<String> encouragements = [
    '太棒了！你真是个学习小能手！🌟',
    '坚持就是胜利，你已经比昨天的自己更强了！💪',
    '每天进步一点点，你会成为大神的！🚀',
    '学习编程最重要的就是动手做，你做到了！👏',
    '恭喜完成这节课！你离成功又近了一步！🎉',
    '写代码最好的方式就是多练习，你做得很好！📝',
    '保持这个节奏，成为程序员指日可待！🔥',
    '遇到问题很正常，解决问题的过程就是成长！💡',
    '代码跑通了！这种感觉超棒的，对吧？😄',
    '你比自己想象的更厉害！继续加油！⭐',
  ];

  // 获取随机鼓励语
  static String getRandom() {
    encouragements.shuffle();
    return encouragements.first;
  }

  // 显示鼓励弹窗
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 表情
            const Text(
              '🎊',
              style: TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 16),
            // 鼓励语
            Text(
              getRandom(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // 继续按钮
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('继续学习'),
            ),
          ],
        ),
      ),
    );
  }

  // 简单的卡片样式（用于列表中显示）
  final String message;

  const EncouragementCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green[400]!,
            Colors.teal[400]!,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Text(
            '🌟',
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 【提示卡片组件】
// 作用：显示提示信息
// ============================================================

class TipCard extends StatelessWidget {
  // 提示内容
  final String tip;

  // 构造函数
  const TipCard({
    super.key,
    required this.tip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline, size: 20, color: Colors.amber[700]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 13,
                color: Colors.amber[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
