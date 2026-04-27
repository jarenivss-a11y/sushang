// ============================================================
// 【专注模式页面】
// 作用：番茄钟计时器，帮助专注学习
// ============================================================

import 'package:flutter/material.dart';

class FocusModeScreen extends StatefulWidget {
  const FocusModeScreen({super.key});

  @override
  State<FocusModeScreen> createState() => _FocusModeScreenState();
}

class _FocusModeScreenState extends State<FocusModeScreen> {
  // 专注状态：idle, focusing, resting, paused
  String _state = 'idle';

  // 剩余秒数
  int _remainingSeconds = 20 * 60;

  // 专注时长（分钟）
  int _focusDuration = 20;

  // 休息时长（分钟）
  int _restDuration = 10;

  // 专注次数
  int _focusCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('专注模式'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 专注计时器
            _buildTimerSection(),
            const SizedBox(height: 24),

            // 设置
            if (_state == 'idle') _buildSettingsSection(),
            const SizedBox(height: 24),

            // 统计
            _buildStatsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerSection() {
    // 格式化时间
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    String timeString = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    // 状态描述
    String stateText = '';
    Color stateColor = Colors.grey;
    switch (_state) {
      case 'focusing':
        stateText = '专注中...';
        stateColor = Colors.blue;
        break;
      case 'resting':
        stateText = '休息一下~';
        stateColor = Colors.green;
        break;
      case 'paused':
        stateText = '已暂停';
        stateColor = Colors.orange;
        break;
      default:
        stateText = '点击开始专注';
        stateColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // 状态文字
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: stateColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              stateText,
              style: TextStyle(
                fontSize: 14,
                color: stateColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // 倒计时
          Text(
            timeString,
            style: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _state == 'focusing'
                ? '保持专注，不要看手机哦'
                : _state == 'resting'
                    ? '休息一下，喝杯水'
                    : '准备好了就开始吧',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 32),

          // 控制按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_state == 'idle') ...[
                ElevatedButton(
                  onPressed: _startFocusing,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('开始专注'),
                ),
              ],
              if (_state == 'focusing') ...[
                ElevatedButton(
                  onPressed: _pause,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('暂停'),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: _giveUp,
                  child: const Text('放弃'),
                ),
              ],
              if (_state == 'resting') ...[
                ElevatedButton(
                  onPressed: _skipRest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('跳过休息'),
                ),
              ],
              if (_state == 'paused') ...[
                ElevatedButton(
                  onPressed: _resume,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                  ),
                  child: const Text('继续'),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: _giveUp,
                  child: const Text('放弃'),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '⚙️ 专注设置',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // 专注时长
          Row(
            children: [
              const Text('专注时长：'),
              const Spacer(),
              DropdownButton<int>(
                value: _focusDuration,
                items: [5, 15, 20, 25, 30, 45, 60].map((v) {
                  return DropdownMenuItem(
                    value: v,
                    child: Text('$v 分钟'),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _focusDuration = value;
                      _remainingSeconds = value * 60;
                    });
                  }
                },
              ),
            ],
          ),
          // 休息时长
          Row(
            children: [
              const Text('休息时长：'),
              const Spacer(),
              DropdownButton<int>(
                value: _restDuration,
                items: [5, 10, 15, 20].map((v) {
                  return DropdownMenuItem(
                    value: v,
                    child: Text('$v 分钟'),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _restDuration = value;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📊 今日统计',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatItem(
                  icon: Icons.check_circle,
                  value: '$_focusCount',
                  label: '完成次数',
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: _StatItem(
                  icon: Icons.timer,
                  value: '${_focusCount * _focusDuration}',
                  label: '专注分钟',
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 开始专注
  void _startFocusing() {
    setState(() {
      _state = 'focusing';
      _remainingSeconds = _focusDuration * 60;
    });
    _startTimer();
  }

  // 暂停
  void _pause() {
    setState(() {
      _state = 'paused';
    });
  }

  // 继续
  void _resume() {
    setState(() {
      _state = 'focusing';
    });
    _startTimer();
  }

  // 放弃
  void _giveUp() {
    setState(() {
      _state = 'idle';
      _remainingSeconds = _focusDuration * 60;
      _focusCount = 0;
    });
  }

  // 跳过休息
  void _skipRest() {
    setState(() {
      _state = 'idle';
      _remainingSeconds = _focusDuration * 60;
    });
  }

  // 计时器逻辑（简化版，不使用真实定时器）
  void _startTimer() {
    // 注意：这里只是示例，实际需要使用Timer或相关库来实现真实倒计时
    // 为了简化，这里只是切换状态
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
