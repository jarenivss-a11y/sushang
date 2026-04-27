// ============================================================
// 【提示词库页面】
// 作用：显示Claude Code提示词模板，可复制使用
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/prompts_data.dart';
import '../../models/prompt_template_model.dart';

class PromptLibraryScreen extends StatelessWidget {
  const PromptLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提示词库'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 说明
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.blue[700]),
                    const SizedBox(width: 8),
                    Text(
                      '什么是提示词？',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '提示词就是你对Claude说的话。把这些模板复制发给Claude，它就能帮你生成或修改代码。',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[900],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 提示词列表
          ...builtInPrompts.map((prompt) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _PromptCard(prompt: prompt),
              )),
        ],
      ),
    );
  }
}

// 提示词卡片
class _PromptCard extends StatelessWidget {
  final PromptTemplateModel prompt;

  const _PromptCard({required this.prompt});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题
            Row(
              children: [
                const Icon(Icons.description, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    prompt.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // 用途
            Text(
              prompt.usage,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            // 内容预览
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                prompt.promptContent.length > 100
                    ? '${prompt.promptContent.substring(0, 100)}...'
                    : prompt.promptContent,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 复制按钮
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _copyPrompt(context),
                icon: const Icon(Icons.copy, size: 18),
                label: const Text('复制提示词'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _copyPrompt(BuildContext context) {
    Clipboard.setData(ClipboardData(text: prompt.promptContent));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('提示词已复制到剪贴板！去Claude粘贴使用吧。'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
