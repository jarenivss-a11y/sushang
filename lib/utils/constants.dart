// ============================================================
// 【常量定义文件】
// 作用：存储全局常量，如App名称、颜色值等
// ============================================================

import 'package:flutter/material.dart';

// App信息
class AppConstants {
  // App名称
  static const String appName = '小白编程入门助手';

  // App版本
  static const String appVersion = '1.0.0';

  // App简介
  static const String appDescription = '帮助零基础小白从零开始学习软件开发';

  // 版权信息
  static const String copyright = '© 2024 CodeMaster';
}

// App主题色
class AppColors {
  // 主色
  static const Color primary = Color(0xFF4A90E2);

  // 浅色背景
  static const Color lightBackground = Color(0xFFF8F9FA);

  // 深色背景
  static const Color darkBackground = Color(0xFF1A1A1A);

  // 成功色
  static const Color success = Color(0xFF52C41A);

  // 警告色
  static const Color warning = Color(0xFFFAAD14);

  // 错误色
  static const Color error = Color(0xFFF5222D);

  // 文字颜色
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFFAAAAAA);
}

// 学习阶段定义
class StageConstants {
  static const String stage1 = 'stage1';
  static const String stage2 = 'stage2';
  static const String stage3 = 'stage3';
  static const String stage4 = 'stage4';

  static const Map<String, String> stageNames = {
    stage1: '阶段一：编程入门',
    stage2: '阶段二：基础代码练习',
    stage3: '阶段三：简单工具开发',
    stage4: '阶段四：Claude Code使用',
  };

  static const Map<String, int> stageEmojis = {
    stage1: 0x1F4DA,  // 📚
    stage2: 0x1F4BB,  // 💻
    stage3: 0x1F3AF,  // 📯
    stage4: 0x1F916,  // 🤖
  };
}

// 底部Tab定义
class TabConstants {
  static const int home = 0;
  static const int learning = 1;
  static const int projects = 2;
  static const int profile = 3;

  static const List<String> titles = ['首页', '学习路线', '项目实战', '我的'];
}

// 专注时长选项
class FocusConstants {
  static const List<int> focusDurations = [5, 15, 20, 25, 30, 45, 60];
  static const List<int> restDurations = [5, 10, 15, 20];

  static const int defaultFocus = 20;
  static const int defaultRest = 10;
}
