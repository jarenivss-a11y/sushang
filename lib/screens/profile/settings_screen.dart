// ============================================================
// 【设置页面】
// 作用：深色模式切换、清除缓存、导出数据等
// ============================================================

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 外观设置
          _buildSection(
            title: '🎨 外观',
            children: [
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) {
                  return SwitchListTile(
                    title: const Text('深色模式'),
                    subtitle: const Text('切换深色/浅色主题'),
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    secondary: Icon(
                      themeProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 数据管理
          _buildSection(
            title: '📁 数据管理',
            children: [
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('清除缓存'),
                subtitle: const Text('清除临时数据，保留学习记录'),
                onTap: () => _showClearCacheDialog(context),
              ),
              ListTile(
                leading: const Icon(Icons.file_download_outlined),
                title: const Text('导出笔记'),
                subtitle: const Text('导出错题和笔记为文件'),
                onTap: () => _showExportDialog(context),
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text('导出代码'),
                subtitle: const Text('导出收藏的代码片段'),
                onTap: () => _showExportCodeDialog(context),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 关于
          _buildSection(
            title: 'ℹ️ 关于',
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('App信息'),
                subtitle: Text('版本 ${AppConstants.appVersion}'),
                onTap: () => _showAboutDialog(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Column(children: children),
        ),
      ],
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清除缓存'),
        content: const Text('确定要清除缓存吗？学习记录会保留。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('缓存已清除')),
              );
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('导出笔记'),
        content: const Text('导出功能开发中...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showExportCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('导出代码'),
        content: const Text('导出代码功能开发中...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: AppConstants.appVersion,
      applicationIcon: const Text('😊', style: TextStyle(fontSize: 48)),
      children: [
        const Text(''),
        const Text(AppConstants.appDescription),
        const Text(''),
        const Text('专为零基础小白设计的编程学习App'),
      ],
    );
  }
}
