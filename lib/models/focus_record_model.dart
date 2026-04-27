// ============================================================
// 【学习进度数据模型】
// 作用：记录小白的整体学习进度
// ============================================================

class LearningProgressModel {
  // 已完成的课程ID列表
  List<String> completedCourseIds;

  // 已完成的项目ID列表
  List<String> completedProjectIds;

  // 当前正在学习的阶段ID
  String currentStageId;

  // 总学习时长（分钟）
  int totalMinutes;

  // 打卡日期列表（用于统计连续学习天数）
  List<DateTime> checkInDates;

  // 专注模式总时长（分钟）
  int totalFocusMinutes;

  // 构造函数
  LearningProgressModel({
    List<String>? completedCourseIds,
    List<String>? completedProjectIds,
    this.currentStageId = 'stage1',
    this.totalMinutes = 0,
    List<DateTime>? checkInDates,
    this.totalFocusMinutes = 0,
  })  : completedCourseIds = completedCourseIds ?? [],
        completedProjectIds = completedProjectIds ?? [],
        checkInDates = checkInDates ?? [];

  // 从JSON创建
  factory LearningProgressModel.fromJson(Map<String, dynamic> json) {
    return LearningProgressModel(
      completedCourseIds:
          List<String>.from(json['completedCourseIds'] ?? []),
      completedProjectIds:
          List<String>.from(json['completedProjectIds'] ?? []),
      currentStageId: json['currentStageId'] ?? 'stage1',
      totalMinutes: json['totalMinutes'] ?? 0,
      checkInDates: (json['checkInDates'] as List<dynamic>?)
              ?.map((d) => DateTime.tryParse(d.toString()) ?? DateTime.now())
              .toList() ??
          [],
      totalFocusMinutes: json['totalFocusMinutes'] ?? 0,
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'completedCourseIds': completedCourseIds,
      'completedProjectIds': completedProjectIds,
      'currentStageId': currentStageId,
      'totalMinutes': totalMinutes,
      'checkInDates': checkInDates.map((d) => d.toIso8601String()).toList(),
      'totalFocusMinutes': totalFocusMinutes,
    };
  }

  // 是否已完成今天的打卡
  bool get hasCheckedInToday {
    final now = DateTime.now();
    return checkInDates.any((date) =>
        date.year == now.year &&
        date.month == now.month &&
        date.day == now.day);
  }

  // 连续学习天数
  int get continuousDays {
    if (checkInDates.isEmpty) return 0;

    // 按日期排序
    final sortedDates = checkInDates.toList()
      ..sort((a, b) => b.compareTo(a));

    int count = 1;
    DateTime current = DateTime(
      sortedDates[0].year,
      sortedDates[0].month,
      sortedDates[0].day,
    );

    for (int i = 1; i < sortedDates.length; i++) {
      DateTime next = DateTime(
        sortedDates[i].year,
        sortedDates[i].month,
        sortedDates[i].day,
      );
      final diff = current.difference(next).inDays;
      if (diff == 1) {
        count++;
        current = next;
      } else if (diff > 1) {
        break;
      }
    }
    return count;
  }

  // 总学习小时数
  double get totalHours => totalMinutes / 60;

  // 总专注小时数
  double get totalFocusHours => totalFocusMinutes / 60;
}

// ============================================================
// 【专注记录数据模型】
// 作用：记录每一次专注学习
// ============================================================

class FocusRecordModel {
  // 记录ID
  final String id;

  // 专注日期
  final DateTime date;

  // 专注时长（分钟）
  final int minutes;

  // 是否完成（没有被中途放弃）
  final bool completed;

  // 专注类型（学习/项目/其他）
  final String type;

  // 构造函数
  FocusRecordModel({
    required this.id,
    required this.date,
    required this.minutes,
    required this.completed,
    this.type = '学习',
  });

  // 从JSON创建
  factory FocusRecordModel.fromJson(Map<String, dynamic> json) {
    return FocusRecordModel(
      id: json['id'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      minutes: json['minutes'] ?? 0,
      completed: json['completed'] ?? false,
      type: json['type'] ?? '学习',
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'minutes': minutes,
      'completed': completed,
      'type': type,
    };
  }
}
