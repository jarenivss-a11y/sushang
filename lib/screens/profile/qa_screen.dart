// ============================================================
// 【新手问答页面】
// 作用：显示常见问题解答
// ============================================================

import 'package:flutter/material.dart';
import '../../data/qa_data.dart';

class QAScreen extends StatefulWidget {
  const QAScreen({super.key});

  @override
  State<QAScreen> createState() => _QAScreenState();
}

class _QAScreenState extends State<QAScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新手问答'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '环境配置'),
            Tab(text: '代码报错'),
            Tab(text: 'AI使用'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildQAList(environmentQA),
          _buildQAList(errorQA),
          _buildQAList(claudeQA),
        ],
      ),
    );
  }

  Widget _buildQAList(List<QAModel> qaList) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: qaList.length,
      itemBuilder: (context, index) {
        return _QACard(qa: qaList[index]);
      },
    );
  }
}

class _QACard extends StatelessWidget {
  final QAModel qa;

  const _QACard({required this.qa});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(
          qa.question,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              qa.answer,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
