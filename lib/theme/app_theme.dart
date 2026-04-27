import 'package:flutter/material.dart';

// ============================================================
// 【主题配置文件】
// 作用：定义App的浅色和深色主题样式
// 修改这里可以改变App的整体外观，包括颜色、字体、按钮样式等
// ============================================================

// 浅色主题 - 默认使用这个
// 颜色说明：
//   primary: 主色调（蓝色按钮、强调色）
//   background: 页面背景色
//   card: 卡片背景色
//   text: 文字颜色
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: const Color(0xFF4A90E2),  // 友好的蓝色
  scaffoldBackgroundColor: const Color(0xFFF8F9FA),  // 浅灰白背景
  cardColor: Colors.white,  // 白色卡片
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF333333),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Color(0xFF333333),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  // 底部导航栏样式
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFF4A90E2),
    unselectedItemColor: Color(0xFF999999),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
  // 文字样式
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color(0xFF333333),
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF333333),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF333333),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFF666666),
    ),
  ),
  // 卡片样式
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),  // 圆角卡片
    ),
  ),
  // 按钮样式
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4A90E2),
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 48),  // 大按钮方便点击
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  // 文字按钮样式
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF4A90E2),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  // 输入框样式
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF5F5F5),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  ),
);

// 深色主题 - 切换后可使用
// 颜色说明：背景变深色，文字变浅色，减少眼睛疲劳
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF4A90E2),
  scaffoldBackgroundColor: const Color(0xFF1A1A1A),
  cardColor: const Color(0xFF2D2D2D),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2D2D2D),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF2D2D2D),
    selectedItemColor: Color(0xFF4A90E2),
    unselectedItemColor: Color(0xFF888888),
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFFAAAAAA),
    ),
  ),
  cardTheme: CardThemeData(
    color: const Color(0xFF2D2D2D),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4A90E2),
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF4A90E2),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF3A3A3A),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  ),
);
