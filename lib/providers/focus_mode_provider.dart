// ============================================================
// 【专注模式管理器】
// 作用：管理番茄钟计时器、专注时长设置、白噪音
// ============================================================

import 'dart:async';
import 'package:flutter/material.dart';
import '../models/focus_record_model.dart';

// 专注状态
enum FocusState {
  idle,     // 未开始
  focusing, // 专注中
  resting,  // 休息中
  paused,   // 暂停
}

// 专注模式管理器
class FocusModeProvider extends ChangeNotifier {
  // 专注状态
  FocusState _state = FocusState.idle;

  // 剩余秒数
  int _remainingSeconds = 20 * 60;  // 默认20分钟

  // 专注时长（分钟）
  int _focusDuration = 20;

  // 休息时长（分钟）
  int _restDuration = 10;

  // 当前专注次数
  int _focusCount = 0;

  // 计时器
  Timer? _timer;

  // 白噪音类型
  String _whiteNoise = '关闭';  // 关闭/白噪音/轻音乐

  // 获取状态
  FocusState get state => _state;
  int get remainingSeconds => _remainingSeconds;
  int get focusDuration => _focusDuration;
  int get restDuration => _restDuration;
  int get focusCount => _focusCount;
  String get whiteNoise => _whiteNoise;

  // 格式化时间显示
  String get formattedTime {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // 获取状态描述
  String get stateDescription {
    switch (_state) {
      case FocusState.idle:
        return '点击开始专注';
      case FocusState.focusing:
        return '专注中...';
      case FocusState.resting:
        return '休息一下~';
      case FocusState.paused:
        return '已暂停';
    }
  }

  // 获取进度百分比
  double get progress {
    int totalSeconds;
    if (_state == FocusState.focusing || _state == FocusState.paused) {
      totalSeconds = _focusDuration * 60;
    } else {
      totalSeconds = _restDuration * 60;
    }
    return 1 - (_remainingSeconds / totalSeconds);
  }

  // 设置专注时长
  void setFocusDuration(int minutes) {
    _focusDuration = minutes;
    if (_state == FocusState.idle) {
      _remainingSeconds = minutes * 60;
    }
    notifyListeners();
  }

  // 设置休息时长
  void setRestDuration(int minutes) {
    _restDuration = minutes;
    notifyListeners();
  }

  // 设置白噪音
  void setWhiteNoise(String type) {
    _whiteNoise = type;
    notifyListeners();
  }

  // 开始专注
  void startFocusing() {
    _state = FocusState.focusing;
    _remainingSeconds = _focusDuration * 60;
    _startTimer();
    notifyListeners();
  }

  // 开始休息
  void startResting() {
    _state = FocusState.resting;
    _remainingSeconds = _restDuration * 60;
    _startTimer();
    notifyListeners();
  }

  // 暂停
  void pause() {
    _timer?.cancel();
    _state = FocusState.paused;
    notifyListeners();
  }

  // 继续
  void resume() {
    if (_state == FocusState.paused) {
      _state = FocusState.focusing;
      _startTimer();
      notifyListeners();
    }
  }

  // 放弃专注
  void giveUp() {
    _timer?.cancel();
    _state = FocusState.idle;
    _remainingSeconds = _focusDuration * 60;
    notifyListeners();
  }

  // 重置
  void reset() {
    _timer?.cancel();
    _state = FocusState.idle;
    _remainingSeconds = _focusDuration * 60;
    _focusCount = 0;
    notifyListeners();
  }

  // 启动计时器
  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        _onTimerComplete();
      }
    });
  }

  // 计时完成
  void _onTimerComplete() {
    _timer?.cancel();

    if (_state == FocusState.focusing) {
      // 专注完成，切换到休息
      _focusCount++;
      startResting();
    } else if (_state == FocusState.resting) {
      // 休息完成，可以开始新的专注
      _state = FocusState.idle;
      _remainingSeconds = _focusDuration * 60;
      notifyListeners();
    }
  }

  // 创建专注记录
  FocusRecordModel createRecord() {
    return FocusRecordModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: DateTime.now(),
      minutes: _focusCount * _focusDuration,
      completed: _state == FocusState.idle && _focusCount > 0,
      type: '学习',
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
