// ============================================================
// 【代码展示块组件】
// 作用：显示代码片段，带语法高亮和复制按钮
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeBlock extends StatelessWidget {
  // 代码内容
  final String code;

  // 代码语言
  final String language;

  // 是否显示复制按钮
  final bool showCopyButton;

  // 构造函数
  const CodeBlock({
    super.key,
    required this.code,
    this.language = 'dart',
    this.showCopyButton = true,
  });

  // 复制到剪贴板
  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('代码已复制到剪贴板！'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 标题栏
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 语言标签
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    language.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // 复制按钮
                if (showCopyButton)
                  GestureDetector(
                    onTap: () => _copyToClipboard(context),
                    child: Row(
                      children: const [
                        Icon(Icons.copy, size: 14, color: Colors.white70),
                        SizedBox(width: 4),
                        Text(
                          '复制',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // 代码内容
          Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                code,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  color: Color(0xFFE0E0E0),
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// 【代码说明组件】
// 作用：配合代码块，显示代码解释
// ============================================================

class CodeExplanation extends StatelessWidget {
  // 解释内容
  final String explanation;

  const CodeExplanation({
    super.key,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题
          Row(
            children: [
              Icon(Icons.info_outline, size: 18, color: Colors.blue[700]),
              const SizedBox(width: 8),
              Text(
                '代码解释',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 内容
          Text(
            explanation,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[900],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
