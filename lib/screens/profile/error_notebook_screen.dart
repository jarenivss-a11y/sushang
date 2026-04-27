// ============================================================
// 【错题本页面】
// 作用：记录、查看、管理学习中的报错
// ============================================================

import 'package:flutter/material.dart';
import '../../models/error_note_model.dart';

class ErrorNotebookScreen extends StatefulWidget {
  const ErrorNotebookScreen({super.key});

  @override
  State<ErrorNotebookScreen> createState() => _ErrorNotebookScreenState();
}

class _ErrorNotebookScreenState extends State<ErrorNotebookScreen> {
  List<ErrorNoteModel> _notes = [];
  String _searchKeyword = '';
  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('错题本'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchDialog,
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (value) {
              setState(() {
                _selectedType = value == '全部' ? null : value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: '全部', child: Text('全部')),
              ...ErrorTypeConstants.all.map((type) => PopupMenuItem(
                    value: type,
                    child: Text(type),
                  )),
            ],
          ),
        ],
      ),
      body: _notes.isEmpty
          ? _buildEmptyState()
          : _buildNotesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('📝', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          const Text(
            '还没有错题记录',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '遇到报错时，记录下来方便复习',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _showAddNoteDialog,
            icon: const Icon(Icons.add),
            label: const Text('添加错题'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesList() {
    var filteredNotes = _notes.where((note) {
      if (_selectedType != null && note.errorType != _selectedType) {
        return false;
      }
      if (_searchKeyword.isNotEmpty) {
        return note.errorReason.contains(_searchKeyword);
      }
      return true;
    }).toList();

    if (filteredNotes.isEmpty) {
      return Center(
        child: Text(
          '没有找到相关错题',
          style: TextStyle(color: Colors.grey[600]),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        return _NoteCard(
          note: filteredNotes[index],
          onDelete: () => _deleteNote(filteredNotes[index].id),
        );
      },
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('搜索错题'),
        content: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '输入关键词搜索...',
          ),
          onChanged: (value) {
            setState(() {
              _searchKeyword = value;
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加错题'),
        content: const Text('添加错题功能开发中...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _deleteNote(String id) {
    setState(() {
      _notes.removeWhere((n) => n.id == id);
    });
  }
}

// 错题卡片
class _NoteCard extends StatelessWidget {
  final ErrorNoteModel note;
  final VoidCallback onDelete;

  const _NoteCard({
    required this.note,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头部
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getTypeColor(note.errorType).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    note.errorType,
                    style: TextStyle(
                      fontSize: 12,
                      color: _getTypeColor(note.errorType),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 报错原因
            const Text(
              '报错原因：',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              note.errorReason,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            // 正确代码
            if (note.correctCode.isNotEmpty) ...[
              const Text(
                '正确写法：',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  note.correctCode,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            // 时间
            const SizedBox(height: 12),
            Text(
              _formatDate(note.createTime),
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case '运行时报错':
        return Colors.red;
      case '代码写错了':
        return Colors.orange;
      case '结果不对':
        return Colors.purple;
      case '环境问题':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
