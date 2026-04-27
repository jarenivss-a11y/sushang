// ============================================================
// 【App根组件】
// 作用：配置主题、路由、全局状态
// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/theme_provider.dart';
import 'providers/learning_progress_provider.dart';
import 'providers/focus_mode_provider.dart';
import 'providers/data_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/learning/learning_route_screen.dart';
import 'screens/projects/project_list_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/profile/error_notebook_screen.dart';
import 'screens/profile/prompt_library_screen.dart';
import 'screens/profile/focus_mode_screen.dart';
import 'screens/profile/qa_screen.dart';
import 'screens/profile/settings_screen.dart';
import 'widgets/bottom_nav_bar.dart';

// 全局导航key，用于从任何地方获取context
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class CodeMasterApp extends StatelessWidget {
  const CodeMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()..init()),
        ChangeNotifierProvider(create: (_) => LearningProgressProvider()..init()),
        ChangeNotifierProvider(create: (_) => FocusModeProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()..init()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: '小白编程入门助手',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            home: const MainScreen(),
            routes: {
              '/error-notebook': (context) => const ErrorNotebookScreen(),
              '/prompt-library': (context) => const PromptLibraryScreen(),
              '/focus-mode': (context) => const FocusModeScreen(),
              '/qa': (context) => const QAScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/learning': (context) => const LearningRouteScreen(),
            },
          );
        },
      ),
    );
  }
}

// ============================================================
// 【主页面】
// 作用：包含底部导航栏和各个Tab页面
// 使用 IndexedStack 保持页面状态，避免重复构建
// ============================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 当前Tab索引
  int _currentIndex = 0;

  // 使用 const 构造函数避免重复创建页面
  static const _screens = [
    HomeScreen(),
    LearningRouteScreen(),
    ProjectListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          // 使用淡入淡出效果，避免视觉跳跃
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: _screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: BottomNavBar(
          key: ValueKey<int>(_currentIndex),
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
        ),
      ),
    );
  }
}
