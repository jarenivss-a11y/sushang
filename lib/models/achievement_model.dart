// ============================================================
// 【成就徽章模型】
// 作用：定义成就徽章的数据结构
// ============================================================

class AchievementModel {
  // 徽章ID
  final String id;

  // 徽章名称
  final String name;

  // 徽章描述
  final String description;

  // 徽章图标（emoji）
  final String icon;

  // 是否已解锁
  bool isUnlocked;

  // 解锁时间
  DateTime? unlockedAt;

  // 解锁条件类型
  final String conditionType;

  // 解锁条件值
  final int conditionValue;

  AchievementModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.conditionType,
    required this.conditionValue,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  // 从JSON创建
  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '🏆',
      conditionType: json['conditionType'] ?? '',
      conditionValue: json['conditionValue'] ?? 0,
      isUnlocked: json['isUnlocked'] ?? false,
      unlockedAt: json['unlockedAt'] != null
          ? DateTime.parse(json['unlockedAt'])
          : null,
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'conditionType': conditionType,
      'conditionValue': conditionValue,
      'isUnlocked': isUnlocked,
      'unlockedAt': unlockedAt?.toIso8601String(),
    };
  }
}

// ============================================================
// 【内置成就列表】
// 作用：定义所有可获得的成就
// ============================================================

class AchievementData {
  static List<AchievementModel> getAllAchievements() {
    return [
      // 入门类
      AchievementModel(
        id: 'first_course',
        name: '入门新手',
        description: '完成第一节课',
        icon: '🌱',
        conditionType: 'course_count',
        conditionValue: 1,
      ),
      AchievementModel(
        id: 'first_project',
        name: '初试牛刀',
        description: '完成第一个实战项目',
        icon: '🛠️',
        conditionType: 'project_count',
        conditionValue: 1,
      ),

      // 阶段类
      AchievementModel(
        id: 'stage1_complete',
        name: '好学之人',
        description: '完成阶段一的学习',
        icon: '📚',
        conditionType: 'stage_complete',
        conditionValue: 1,
      ),
      AchievementModel(
        id: 'stage2_complete',
        name: '代码新手',
        description: '完成阶段二的学习',
        icon: '💻',
        conditionType: 'stage_complete',
        conditionValue: 2,
      ),
      AchievementModel(
        id: 'stage3_complete',
        name: '创作者',
        description: '完成阶段三的学习',
        icon: '🎨',
        conditionType: 'stage_complete',
        conditionValue: 3,
      ),
      AchievementModel(
        id: 'stage4_complete',
        name: 'AI大师',
        description: '完成阶段四的学习',
        icon: '🤖',
        conditionType: 'stage_complete',
        conditionValue: 4,
      ),

      // 学习时长类
      AchievementModel(
        id: 'study_1h',
        name: '初学者',
        description: '累计学习1小时',
        icon: '⏰',
        conditionType: 'study_minutes',
        conditionValue: 60,
      ),
      AchievementModel(
        id: 'study_10h',
        name: '学习达人',
        description: '累计学习10小时',
        icon: '📈',
        conditionType: 'study_minutes',
        conditionValue: 600,
      ),

      // 连续学习类
      AchievementModel(
        id: 'continuous_3',
        name: '坚持不懈',
        description: '连续学习3天',
        icon: '🔥',
        conditionType: 'continuous_days',
        conditionValue: 3,
      ),
      AchievementModel(
        id: 'continuous_7',
        name: '一周勇士',
        description: '连续学习7天',
        icon: '🗓️',
        conditionType: 'continuous_days',
        conditionValue: 7,
      ),

      // 打卡类
      AchievementModel(
        id: 'checkin_7',
        name: '打卡新星',
        description: '累计打卡7天',
        icon: '⭐',
        conditionType: 'checkin_days',
        conditionValue: 7,
      ),
      AchievementModel(
        id: 'checkin_30',
        name: '坚持30天',
        description: '累计打卡30天',
        icon: '🌟',
        conditionType: 'checkin_days',
        conditionValue: 30,
      ),
    ];
  }
}
