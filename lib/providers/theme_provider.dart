// ============================================================
// 【主题状态管理器】
// 作用：管理App的深色/浅色模式切换
// ============================================================

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ThemeProvider类继承ChangeNotifier
// 当主题变化时，通知所有使用这个类的组件重新构建
class ThemeProvider extends ChangeNotifier {
  // 是否使用深色模式，默认为false（浅色模式）
  bool _isDarkMode = false;

  // 获取当前是否是深色模式
  bool get isDarkMode => _isDarkMode;

  // 获取当前主题
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // 初始化，从本地存储读取设置
  Future<void> init() async {
    var prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();  // 通知界面更新
  }

  // 切换主题
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();  // 通知界面更新

    // 保存到本地存储
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  // 设置特定主题
  Future<void> setDarkMode(bool value) async {
    if (_isDarkMode != value) {
      _isDarkMode = value;
      notifyListeners();

      var prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', _isDarkMode);
    }
  }
}
