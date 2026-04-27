// ============================================================
// 【学习路线页面】
// 作用：显示4个学习阶段的概览和进度
// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app.dart';
import '../../data/courses_data.dart';
import '../../models/course_model.dart';
import '../../providers/learning_progress_provider.dart';
import '../../widgets/encouragement_card.dart';

class LearningRouteScreen extends StatelessWidget {
  const LearningRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习路线'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 学习路线简介
          _buildIntroCard(context),
          const SizedBox(height: 20),

          // 四个阶段
          ...AllCourses.allStages.map((stage) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _StageCard(stage: stage),
              )),
        ],
      ),
    );
  }

  Widget _buildIntroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400]!, Colors.purple[400]!],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('🗺️', style: TextStyle(fontSize: 24)),
              SizedBox(width: 8),
              Text(
                '学习路线图',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '从零开始，跟着这个路线一步步学习，你一定能学会编程！\n每个阶段完成后再进入下一个，不要急。',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// 阶段卡片
class _StageCard extends StatelessWidget {
  final StageModel stage;

  const _StageCard({required this.stage});

  @override
  Widget build(BuildContext context) {
    // 获取学习进度Provider
    final progressProvider = context.watch<LearningProgressProvider>();

    // 阶段图标
    final stageIcons = ['📚', '💻', '📱', '🤖'];
    final stageColors = [Colors.blue, Colors.green, Colors.purple, Colors.orange];
    final stageIndex = AllCourses.allStages.indexOf(stage);
    final icon = stageIcons[stageIndex];
    final color = stageColors[stageIndex];

    // 检查阶段是否解锁
    final isUnlocked = progressProvider.isStageUnlocked(stage.id);

    // 计算完成进度
    int completedCount = 0;
    for (var course in stage.courses) {
      if (progressProvider.isCourseCompleted(course.id)) {
        completedCount++;
      }
    }
    final progress = stage.courses.isNotEmpty
        ? completedCount / stage.courses.length
        : 0.0;

    return Card(
      child: InkWell(
        onTap: isUnlocked
            ? () {
                // 跳转到阶段详情
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _StageDetailPage(stage: stage),
                  ),
                );
              }
            : () {
                // 提示未解锁
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('请先完成前一阶段的所有课程来解锁'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
        borderRadius: BorderRadius.circular(12),
        child: Opacity(
          opacity: isUnlocked ? 1.0 : 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // 阶段图标
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: color.withAlpha(25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(icon, style: const TextStyle(fontSize: 24)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // 阶段信息
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                stage.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (!isUnlocked) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    '🔒',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${stage.courses.length}节课 · $completedCount/${stage.courses.length}完成',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 箭头
                    if (isUnlocked)
                      const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
                const SizedBox(height: 12),
                // 进度条
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(height: 8),
                // 课程列表预览
                ...stage.courses.take(3).map((course) {
                  final isCompleted =
                      progressProvider.isCourseCompleted(course.id);
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        Icon(
                          isCompleted
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          size: 14,
                          color: isCompleted ? Colors.green : Colors.grey[400],
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            course.title,
                            style: TextStyle(
                              fontSize: 12,
                              color: isCompleted
                                  ? Colors.green[700]
                                  : Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                if (stage.courses.length > 3)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '...还有${stage.courses.length - 3}节课',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 阶段详情页面
class _StageDetailPage extends StatelessWidget {
  final StageModel stage;

  const _StageDetailPage({required this.stage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stage.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 阶段简介
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '📖 学习目标',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  stage.description,
                  style: const TextStyle(height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 课程列表
          const Text(
            '课程列表',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...stage.courses.asMap().entries.map((entry) {
            final index = entry.key;
            final course = entry.value;
            return _CourseListItem(
              index: index + 1,
              course: course,
            );
          }),
        ],
      ),
    );
  }
}

// 课程列表项
class _CourseListItem extends StatelessWidget {
  final int index;
  final dynamic course;

  const _CourseListItem({
    required this.index,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    // 获取学习进度
    final progressProvider = context.watch<LearningProgressProvider>();
    final isCompleted = progressProvider.isCourseCompleted(course.id);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isCompleted
                ? Colors.green.withAlpha(25)
                : Theme.of(context).primaryColor.withAlpha(25),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.green, size: 20)
                : Text(
                    '$index',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
          ),
        ),
        title: Text(
          course.title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Text(
          course.subtitle,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: Icon(
          isCompleted ? Icons.check_circle : Icons.arrow_forward_ios,
          size: 16,
          color: isCompleted ? Colors.green : null,
        ),
        onTap: () {
          // 跳转到课程详情
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _CourseDetailPage(course: course),
            ),
          );
        },
      ),
    );
  }
}

// 课程详情页面
class _CourseDetailPage extends StatelessWidget {
  final dynamic course;

  const _CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    // 需要包裹Consumer来获取学习进度
    return Consumer<LearningProgressProvider>(
      builder: (context, progressProvider, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 课程标题和难度
            Row(
              children: [
                Expanded(
                  child: Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // 难度星级
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      i < course.difficulty ? Icons.star : Icons.star_border,
                      size: 16,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              course.subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),

            // 课程内容
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                course.content,
                style: const TextStyle(height: 1.8, fontSize: 15),
              ),
            ),

            // 如果有代码示例
            if (course.codeExample != null) ...[
              const SizedBox(height: 20),
              const Text(
                '💻 示例代码',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    course.codeExample!,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],

            // 如果有代码解释
            if (course.codeExplanation != null) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline,
                            size: 18, color: Colors.blue[700]),
                        const SizedBox(width: 8),
                        Text(
                          '代码解释',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      course.codeExplanation!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[900],
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 30),

            // 完成学习按钮
            Consumer<LearningProgressProvider>(
              builder: (context, provider, _) {
                final isCompleted = provider.isCourseCompleted(course.id);

                return ElevatedButton.icon(
                  onPressed: isCompleted
                      ? null
                      : () async {
                          // 完成课程
                          await provider.completeCourse(course.id);

                          // 先返回上一页（阶段详情页）
                          if (context.mounted) {
                            Navigator.pop(context);
                          }

                          // 显示鼓励（延迟一下，等返回完成）
                          Future.delayed(const Duration(milliseconds: 200), () {
                            // 使用根context显示弹窗
                            final rootContext = navigatorKey.currentContext;
                            if (rootContext != null) {
                              EncouragementCard.show(rootContext);
                            }
                          });
                        },
                  icon: Text(isCompleted ? '✓' : '✅'),
                  label: Text(isCompleted ? '已完成' : '完成学习'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: isCompleted ? Colors.green : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
      },
    );
  }

  // 显示成就解锁弹窗
  void _showAchievementDialog(BuildContext context, achievement) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Text('🎉 '),
            Text('成就解锁！'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              achievement.icon,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 12),
            Text(
              achievement.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              achievement.description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('太棒了！'),
          ),
        ],
      ),
    );
  }
}
