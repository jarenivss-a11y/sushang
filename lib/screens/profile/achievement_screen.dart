// ============================================================
// 【成就页面】
// 作用：显示已解锁和未解锁的成就徽章
// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/learning_progress_provider.dart';
import '../../models/achievement_model.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressProvider = context.watch<LearningProgressProvider>();
    final achievements = progressProvider.achievements;
    final unlockedCount =
        achievements.where((a) => a.isUnlocked).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('成就徽章'),
      ),
      body: Column(
        children: [
          // 统计卡片
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber[400]!, Colors.orange[400]!],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text(
                  '🏆',
                  style: TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 12),
                Text(
                  '$unlockedCount / ${achievements.length}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '已解锁成就',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // 成就列表
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                final achievement = achievements[index];
                return _AchievementCard(achievement: achievement);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 成就卡片组件
class _AchievementCard extends StatelessWidget {
  final AchievementModel achievement;

  const _AchievementCard({required this.achievement});

  @override
  Widget build(BuildContext context) {
    final isUnlocked = achievement.isUnlocked;

    return Container(
      decoration: BoxDecoration(
        color: isUnlocked ? Colors.white : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        boxShadow: isUnlocked
            ? [
                BoxShadow(
                  color: Colors.amber.withAlpha(50),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 徽章图标
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? Colors.amber.withAlpha(25)
                  : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                isUnlocked ? achievement.icon : '🔒',
                style: TextStyle(
                  fontSize: 28,
                  color: isUnlocked ? null : Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // 徽章名称
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              achievement.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isUnlocked ? Colors.black87 : Colors.grey,
              ),
            ),
          ),

          const SizedBox(height: 4),

          // 解锁日期或条件
          if (isUnlocked && achievement.unlockedAt != null)
            Text(
              _formatDate(achievement.unlockedAt!),
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[500],
              ),
            )
          else
            Text(
              _getConditionText(achievement),
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[400],
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}';
  }

  String _getConditionText(AchievementModel achievement) {
    switch (achievement.conditionType) {
      case 'course_count':
        return '完成${achievement.conditionValue}节课';
      case 'project_count':
        return '完成${achievement.conditionValue}个项目';
      case 'stage_complete':
        return '完成阶段${achievement.conditionValue}';
      case 'study_minutes':
        return '学习${achievement.conditionValue}分钟';
      case 'continuous_days':
        return '连续${achievement.conditionValue}天';
      case 'checkin_days':
        return '打卡${achievement.conditionValue}天';
      default:
        return '';
    }
  }
}
