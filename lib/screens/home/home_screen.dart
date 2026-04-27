// ============================================================
// 【首页】
// 作用：零基础入门引导首页，显示欢迎语、指南入口、新手测试
// ============================================================

import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'new_user_test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 欢迎横幅
            _buildWelcomeBanner(context),
            const SizedBox(height: 20),

            // 零基础入门指南
            _buildGuideSection(context),
            const SizedBox(height: 20),

            // 新手测试入口
            _buildNewUserTest(context),
            const SizedBox(height: 20),

            // 快速开始
            _buildQuickStart(context),
          ],
        ),
      ),
    );
  }

  // 欢迎横幅
  Widget _buildWelcomeBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '👋',
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '欢迎来到编程世界！',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '不管你之前完全没接触过编程，还是对代码一窍不通，都没关系的！跟着这个App一步步学习，你一定能学会写代码、做App。',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              '零基础也能学会编程！',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 零基础入门指南
  Widget _buildGuideSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📖 零基础入门指南',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        // 指南卡片列表
        _GuideCard(
          icon: '🤔',
          title: '什么是编程？',
          description: '用买奶茶的例子，告诉你代码到底是什么',
          onTap: () => _showGuideDialog(context, 0),
        ),
        _GuideCard(
          icon: '📱',
          title: '什么是App开发？',
          description: '用盖房子的比喻，解释开发App是怎么回事',
          onTap: () => _showGuideDialog(context, 1),
        ),
        _GuideCard(
          icon: '📚',
          title: '如何用本App学习？',
          description: '告诉你学习步骤，按顺序学下去就能学会',
          onTap: () => _showGuideDialog(context, 2),
        ),
        _GuideCard(
          icon: '🤖',
          title: '如何用Claude Code？',
          description: '教你用AI助手帮你写代码、解决问题',
          onTap: () => _showGuideDialog(context, 3),
        ),
      ],
    );
  }

  // 新手测试入口
  Widget _buildNewUserTest(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '📝',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '新手入门测试',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '用5道题测试一下你的基础，推荐最适合你的学习内容',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NewUserTestScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('开始测试'),
            ),
          ),
        ],
      ),
    );
  }

  // 快速开始
  Widget _buildQuickStart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🚀 快速开始',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        // 四个阶段预览
        Row(
          children: [
            Expanded(
              child: _QuickStartCard(
                emoji: '📚',
                title: '阶段一',
                subtitle: '编程入门',
                color: Colors.blue,
                onTap: () {
                  Navigator.pushNamed(context, '/learning', arguments: 'stage1');
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _QuickStartCard(
                emoji: '💻',
                title: '阶段二',
                subtitle: '代码练习',
                color: Colors.green,
                onTap: () {
                  Navigator.pushNamed(context, '/learning', arguments: 'stage2');
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _QuickStartCard(
                emoji: '📱',
                title: '阶段三',
                subtitle: '工具开发',
                color: Colors.purple,
                onTap: () {
                  Navigator.pushNamed(context, '/learning', arguments: 'stage3');
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _QuickStartCard(
                emoji: '🤖',
                title: '阶段四',
                subtitle: 'AI助手',
                color: Colors.orange,
                onTap: () {
                  Navigator.pushNamed(context, '/learning', arguments: 'stage4');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 显示指南弹窗
  void _showGuideDialog(BuildContext context, int index) {
    final guides = [
      {
        'title': '什么是编程？',
        'content': '''
想象你去奶茶店点奶茶。

你告诉店员："我要一杯珍珠奶茶，少冰少糖。"

店员听到你的话，然后去做奶茶，最后把做好的奶茶递给你。

代码就像这个例子：
- 你说的话 = 代码（告诉电脑要做什么）
- 店员 = 电脑（听懂你的话并执行）
- 做好的奶茶 = 结果（电脑执行完给你的东西）

代码就是"和电脑说话的语言"！

就像你告诉店员要做什么奶茶一样，只是换成了电脑能听懂的话。

代码看起来像这样：
print("Hello World")

这句话的意思是：请在屏幕上显示"Hello World"这段文字。
''',
      },
      {
        'title': '什么是App开发？',
        'content': '''
App就是手机上的应用程序，比如微信、抖音、淘宝都是App。

开发App就是制作这些程序的过程。

打个比方：
盖房子需要：
1. 设计图纸（界面设计）
2. 打地基、砌墙（基础框架）
3. 安装水电（功能实现）
4. 装修美化（界面优化）

开发App也一样：
1. 设计界面（App长什么样）
2. 做基础框架（用什么技术）
3. 实现功能（按钮干什么、页面怎么跳转）
4. 测试优化（检查问题、让体验更好）

学会开发App，你就能做自己的App了！
''',
      },
      {
        'title': '如何用本App学习？',
        'content': '''
用这个App学习很简单，按顺序来就行：

第一步：看首页的入门指南
先了解什么是编程、什么是App开发

第二步：开始阶段一的学习
从最简单的开始，跟着课程一步步做

第三步：做练习和实战项目
学了知识就要用，做几个小项目练练手

第四步：学会用AI助手
用Claude Code帮你写代码、解决问题

记住：
- 不要急，慢慢来
- 看不懂就多看几遍
- 动手跟着做，不要只看
- 遇到问题很正常，解决问题就是学习
''',
      },
      {
        'title': '如何用Claude Code？',
        'content': '''
Claude Code是一个AI编程助手，可以帮你写代码。

使用方法很简单：

1. 告诉它你要做什么
比如："帮我写一个计算器App"

2. 它会给你代码
把代码复制到你的项目里

3. 运行看看效果
不对的话让它修改

4. 遇到问题问它
把错误信息发给它，它会帮你解决

写提示词的技巧：
- 说清楚你要什么
- 说明用什么技术（Flutter/Dart）
- 说具体要求
- 说你是零基础，让它解释清楚

越清楚的要求，越能得到好结果！
''',
      },
    ];

    final guide = guides[index];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Text(guides[index]['emoji'] ?? '📖'),
            const SizedBox(width: 8),
            Expanded(child: Text(guide['title'] ?? '')),
          ],
        ),
        content: SingleChildScrollView(
          child: Text(
            guide['content'] ?? '',
            style: const TextStyle(height: 1.6),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('知道了'),
          ),
        ],
      ),
    );
  }
}

// 指南卡片组件
class _GuideCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _GuideCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// 快速开始卡片
class _QuickStartCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickStartCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: color.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
