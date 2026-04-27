// ============================================================
// 【学习进度管理器】
// 作用：管理课程完成进度、打卡记录、学习时长、成就
// ============================================================

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/course_model.dart';
import '../models/focus_record_model.dart';
import '../models/achievement_model.dart';

// 学习进度管理器
class LearningProgressProvider extends ChangeNotifier {
  // 学习进度数据
  LearningProgressModel _progress = LearningProgressModel();

  // 专注记录列表
  List<FocusRecordModel> _focusRecords = [];

  // 成就列表
  List<AchievementModel> _achievements = [];

  // 获取进度
  LearningProgressModel get progress => _progress;

  // 获取专注记录
  List<FocusRecordModel> get focusRecords => _focusRecords;

  // 获取成就列表
  List<AchievementModel> get achievements => _achievements;

  // 获取已解锁的成就数
  int get unlockedAchievementCount =>
      _achievements.where((a) => a.isUnlocked).length;

  // 初始化，加载保存的数据
  Future<void> init() async {
    var prefs = await SharedPreferences.getInstance();

    // 加载学习进度
    var progressJson = prefs.getString('learningProgress');
    if (progressJson != null) {
      _progress = LearningProgressModel.fromJson(jsonDecode(progressJson));
    }

    // 加载专注记录
    var focusJson = prefs.getString('focusRecords');
    if (focusJson != null) {
      var list = jsonDecode(focusJson) as List;
      _focusRecords = list.map((r) => FocusRecordModel.fromJson(r)).toList();
    }

    // 加载成就
    var achievementJson = prefs.getString('achievements');
    if (achievementJson != null) {
      var list = jsonDecode(achievementJson) as List;
      _achievements = list.map((a) => AchievementModel.fromJson(a)).toList();
    } else {
      // 初始化成就列表
      _achievements = AchievementData.getAllAchievements();
    }

    notifyListeners();
  }

  // 保存学习进度
  Future<void> _saveProgress() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('learningProgress', jsonEncode(_progress.toJson()));
  }

  // 保存专注记录
  Future<void> _saveFocusRecords() async {
    var prefs = await SharedPreferences.getInstance();
    var data = _focusRecords.map((r) => r.toJson()).toList();
    await prefs.setString('focusRecords', jsonEncode(data));
  }

  // 完成课程
  Future<void> completeCourse(String courseId) async {
    if (!_progress.completedCourseIds.contains(courseId)) {
      _progress.completedCourseIds.add(courseId);

      // 增加学习时长（每节课约10分钟）
      _progress.totalMinutes += 10;

      // 打卡
      _addCheckIn();

      // 检查成就
      _checkAchievements();

      await _saveProgress();
      await _saveAchievements();
      notifyListeners();
    }
  }

  // 完成项目
  Future<void> completeProject(String projectId) async {
    if (!_progress.completedProjectIds.contains(projectId)) {
      _progress.completedProjectIds.add(projectId);

      // 检查成就
      _checkAchievements();

      await _saveProgress();
      await _saveAchievements();
      notifyListeners();
    }
  }

  // 检查课程是否已完成
  bool isCourseCompleted(String courseId) {
    return _progress.completedCourseIds.contains(courseId);
  }

  // 更新当前阶段
  Future<void> setCurrentStage(String stageId) async {
    _progress.currentStageId = stageId;
    await _saveProgress();
    notifyListeners();
  }

  // 添加打卡
  void _addCheckIn() {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);

    // 检查今天是否已经打卡
    bool hasCheckedIn = _progress.checkInDates.any((date) =>
        date.year == today.year &&
        date.month == today.month &&
        date.day == today.day);

    if (!hasCheckedIn) {
      _progress.checkInDates.add(today);
    }
  }

  // 添加专注记录
  Future<void> addFocusRecord(FocusRecordModel record) async {
    _focusRecords.add(record);
    _progress.totalFocusMinutes += record.minutes;
    await _saveFocusRecords();
    await _saveProgress();
    notifyListeners();
  }

  // 获取今日专注时长
  int get todayFocusMinutes {
    var now = DateTime.now();
    return _focusRecords
        .where((r) =>
            r.date.year == now.year &&
            r.date.month == now.month &&
            r.date.day == now.day)
        .fold(0, (sum, r) => sum + r.minutes);
  }

  // 获取本周专注时长
  int get weekFocusMinutes {
    var now = DateTime.now();
    var weekStart = now.subtract(Duration(days: now.weekday - 1));
    var startOfWeek = DateTime(weekStart.year, weekStart.month, weekStart.day);

    return _focusRecords
        .where((r) => r.date.isAfter(startOfWeek) || r.date.isAtSameMomentAs(startOfWeek))
        .fold(0, (sum, r) => sum + r.minutes);
  }

  // 获取已完成课程数
  int get completedCourseCount => _progress.completedCourseIds.length;

  // 获取总学习小时数
  double get totalHours => _progress.totalHours;

  // 获取总专注小时数
  double get totalFocusHours => _progress.totalFocusHours;

  // 获取连续学习天数
  int get continuousDays => _progress.continuousDays;

  // 是否已打卡
  bool get hasCheckedInToday => _progress.hasCheckedInToday;

  // 获取本周每天的专注时长（用于图表）
  List<int> get weeklyFocusData {
    var now = DateTime.now();
    var result = <int>[];

    for (int i = 0; i < 7; i++) {
      var day = now.subtract(Duration(days: 6 - i));
      var dayStart = DateTime(day.year, day.month, day.day);
      var dayEnd = dayStart.add(const Duration(days: 1));

      var minutes = _focusRecords
          .where((r) => r.date.isAfter(dayStart) && r.date.isBefore(dayEnd))
          .fold(0, (sum, r) => sum + r.minutes);

      result.add(minutes);
    }

    return result;
  }

  // 保存成就
  Future<void> _saveAchievements() async {
    var prefs = await SharedPreferences.getInstance();
    var data = _achievements.map((a) => a.toJson()).toList();
    await prefs.setString('achievements', jsonEncode(data));
  }

  // 检查并解锁成就
  void _checkAchievements() {
    for (var achievement in _achievements) {
      if (achievement.isUnlocked) continue;

      bool shouldUnlock = false;

      switch (achievement.conditionType) {
        case 'course_count':
          shouldUnlock = _progress.completedCourseIds.length >= achievement.conditionValue;
          break;
        case 'project_count':
          shouldUnlock = _progress.completedProjectIds.length >= achievement.conditionValue;
          break;
        case 'stage_complete':
          shouldUnlock = _getCompletedStageCount() >= achievement.conditionValue;
          break;
        case 'study_minutes':
          shouldUnlock = _progress.totalMinutes >= achievement.conditionValue;
          break;
        case 'continuous_days':
          shouldUnlock = _progress.continuousDays >= achievement.conditionValue;
          break;
        case 'checkin_days':
          shouldUnlock = _progress.checkInDates.length >= achievement.conditionValue;
          break;
      }

      if (shouldUnlock) {
        achievement.isUnlocked = true;
        achievement.unlockedAt = DateTime.now();
      }
    }
  }

  // 获取已完成的阶段数量
  int _getCompletedStageCount() {
    // 阶段1: stage1 有5节课
    // 阶段2: stage2 有4节课
    // 阶段3: stage3 有3节课
    // 阶段4: stage4 有4节课

    int count = 0;

    // 检查阶段1是否完成 (课程ID: s1c1-s1c5)
    int stage1Complete = 0;
    for (int i = 1; i <= 5; i++) {
      if (_progress.completedCourseIds.contains('s1c$i')) stage1Complete++;
    }
    if (stage1Complete >= 5) count++;

    // 检查阶段2是否完成 (课程ID: s2c1-s2c4)
    int stage2Complete = 0;
    for (int i = 1; i <= 4; i++) {
      if (_progress.completedCourseIds.contains('s2c$i')) stage2Complete++;
    }
    if (stage2Complete >= 4) count++;

    // 检查阶段3是否完成 (课程ID: s3c1-s3c3)
    int stage3Complete = 0;
    for (int i = 1; i <= 3; i++) {
      if (_progress.completedCourseIds.contains('s3c$i')) stage3Complete++;
    }
    if (stage3Complete >= 3) count++;

    // 检查阶段4是否完成 (课程ID: s4c1-s4c4)
    int stage4Complete = 0;
    for (int i = 1; i <= 4; i++) {
      if (_progress.completedCourseIds.contains('s4c$i')) stage4Complete++;
    }
    if (stage4Complete >= 4) count++;

    return count;
  }

  // 检查阶段是否解锁
  bool isStageUnlocked(String stageId) {
    switch (stageId) {
      case 'stage1':
        return true; // 第一阶段始终解锁
      case 'stage2':
        // 需要完成阶段1全部课程
        int s1Complete = 0;
        for (int i = 1; i <= 5; i++) {
          if (_progress.completedCourseIds.contains('s1c$i')) s1Complete++;
        }
        return s1Complete >= 5;
      case 'stage3':
        // 需要完成阶段2全部课程
        int s2Complete = 0;
        for (int i = 1; i <= 4; i++) {
          if (_progress.completedCourseIds.contains('s2c$i')) s2Complete++;
        }
        return s2Complete >= 4;
      case 'stage4':
        // 需要完成阶段3全部课程
        int s3Complete = 0;
        for (int i = 1; i <= 3; i++) {
          if (_progress.completedCourseIds.contains('s3c$i')) s3Complete++;
        }
        return s3Complete >= 3;
      default:
        return true;
    }
  }

  // 获取某个阶段的完成进度
  double getStageProgress(String stageId) {
    int total;
    switch (stageId) {
      case 'stage1':
        total = 5;
        break;
      case 'stage2':
        total = 4;
        break;
      case 'stage3':
        total = 3;
        break;
      case 'stage4':
        total = 4;
        break;
      default:
        return 0;
    }

    int completed = 0;
    for (int i = 1; i <= total; i++) {
      if (_progress.completedCourseIds.contains('${stageId.substring(5)}c$i')) {
        // stage1 -> s1c, stage2 -> s2c, etc.
        String prefix = stageId.replaceFirst('stage', 's');
        if (_progress.completedCourseIds.contains('$prefix$i')) {
          completed++;
        }
      }
    }

    return total > 0 ? completed / total : 0;
  }

  // 获取新解锁的成就（用于弹窗提示）
  AchievementModel? getNewlyUnlockedAchievement() {
    for (var achievement in _achievements) {
      if (achievement.isUnlocked && achievement.unlockedAt != null) {
        // 检查是否是新解锁的（30分钟内）
        var diff = DateTime.now().difference(achievement.unlockedAt!);
        if (diff.inMinutes < 1) {
          return achievement;
        }
      }
    }
    return null;
  }
}
