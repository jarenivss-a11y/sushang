// ============================================================
// 【底部导航栏组件】
// 作用：App底部的Tab导航，方便切换不同页面
// ============================================================

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  // 当前选中的Tab索引
  final int currentIndex;

  // Tab切换回调
  final Function(int) onTap;

  // 构造函数
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // 当前选中的索引
      currentIndex: currentIndex,
      // Tab切换回调
      onTap: onTap,

      // 4个Tab的配置
      items: const [
        // 首页Tab
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),      // 未选中图标
          activeIcon: Icon(Icons.home),         // 选中图标
          label: '首页',                         // Tab文字
        ),
        // 学习路线Tab
        BottomNavigationBarItem(
          icon: Icon(Icons.school_outlined),
          activeIcon: Icon(Icons.school),
          label: '学习路线',
        ),
        // 项目实战Tab
        BottomNavigationBarItem(
          icon: Icon(Icons.code_outlined),
          activeIcon: Icon(Icons.code),
          label: '项目实战',
        ),
        // 我的Tab
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: '我的',
        ),
      ],
    );
  }
}
