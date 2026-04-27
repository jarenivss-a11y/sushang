// ============================================================
// 【个人中心页面】
// 作用：显示学习统计数据、错题本入口、提示词库入口等
// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/learning_progress_provider.dart';
import '../../utils/constants.dart';
import 'achievement_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息卡片
            _buildUserCard(context),
            const SizedBox(height: 20),

            // 学习数据统计
            _buildStatsSection(context),
            const SizedBox(height: 20),

            // 功能入口
            _buildFunctionSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.purple[400]!],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // 头像
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('😊', style: TextStyle(fontSize: 36)),
            ),
          ),
          const SizedBox(width: 16),
          // 用户信息
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '编程小白',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '正在学习Flutter开发',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '学习中',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    // 获取学习进度
    final progressProvider = context.watch<LearningProgressProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📊 学习数据',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.access_time,
                value: progressProvider.totalHours.toStringAsFixed(1),
                label: '学习时长',
                unit: '小时',
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle,
                value: '${progressProvider.completedCourseCount}',
                label: '完成课程',
                unit: '节',
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.code,
                value: '${progressProvider.progress.completedProjectIds.length}',
                label: '完成项目',
                unit: '个',
                color: Colors.purple,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _StatCard(
                icon: Icons.emoji_events,
                value: '${progressProvider.unlockedAchievementCount}',
                label: '解锁成就',
                unit: '个',
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFunctionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📁 常用功能',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        // 成就入口
        _FunctionTile(
          icon: Icons.emoji_events,
          iconColor: Colors.amber,
          title: '我的成就',
          subtitle: '查看已解锁的徽章',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AchievementScreen()),
            );
          },
        ),
        // 功能列表
        _FunctionTile(
          icon: Icons.edit_note,
          iconColor: Colors.red,
          title: '错题本',
          subtitle: '记录学习中的报错和解决方法',
          onTap: () {
            Navigator.pushNamed(context, '/error-notebook');
          },
        ),
        _FunctionTile(
          icon: Icons.lightbulb_outline,
          iconColor: Colors.amber,
          title: '提示词库',
          subtitle: 'Claude Code提示词模板',
          onTap: () {
            Navigator.pushNamed(context, '/prompt-library');
          },
        ),
        _FunctionTile(
          icon: Icons.timer,
          iconColor: Colors.blue,
          title: '专注模式',
          subtitle: '番茄工作法，专注学习',
          onTap: () {
            Navigator.pushNamed(context, '/focus-mode');
          },
        ),
        _FunctionTile(
          icon: Icons.help_outline,
          iconColor: Colors.green,
          title: '新手问答',
          subtitle: '常见问题解答',
          onTap: () {
            Navigator.pushNamed(context, '/qa');
          },
        ),
        _FunctionTile(
          icon: Icons.settings,
          iconColor: Colors.grey,
          title: '设置',
          subtitle: '深色模式、清除缓存等',
          onTap: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    );
  }
}

// 统计数据卡片
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String unit;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(width: 2),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  unit,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// 功能入口列表项
class _FunctionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _FunctionTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
