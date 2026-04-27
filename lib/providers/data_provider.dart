// ============================================================
// 【数据管理中心】
// 作用：管理错题本、提示词库等用户数据
// ============================================================

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/error_note_model.dart';
import '../models/prompt_template_model.dart';

// 数据中心管理器
class DataProvider extends ChangeNotifier {
  // 错题列表
  List<ErrorNoteModel> _errorNotes = [];

  // 用户提示词列表
  List<PromptTemplateModel> _userPrompts = [];

  // 获取错题列表
  List<ErrorNoteModel> get errorNotes => _errorNotes;

  // 获取用户提示词
  List<PromptTemplateModel> get userPrompts => _userPrompts;

  // 初始化
  Future<void> init() async {
    await _loadErrorNotes();
    await _loadUserPrompts();
  }

  // 加载错题
  Future<void> _loadErrorNotes() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('errorNotes');
    if (data != null) {
      var list = jsonDecode(data) as List;
      _errorNotes = list.map((n) => ErrorNoteModel.fromJson(n)).toList();
    }
    notifyListeners();
  }

  // 保存错题
  Future<void> _saveErrorNotes() async {
    var prefs = await SharedPreferences.getInstance();
    var data = _errorNotes.map((n) => n.toJson()).toList();
    await prefs.setString('errorNotes', jsonEncode(data));
  }

  // 加载用户提示词
  Future<void> _loadUserPrompts() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('userPrompts');
    if (data != null) {
      var list = jsonDecode(data) as List;
      _userPrompts = list.map((p) => PromptTemplateModel.fromJson(p)).toList();
    }
    notifyListeners();
  }

  // 保存用户提示词
  Future<void> _saveUserPrompts() async {
    var prefs = await SharedPreferences.getInstance();
    var data = _userPrompts.map((p) => p.toJson()).toList();
    await prefs.setString('userPrompts', jsonEncode(data));
  }

  // 添加错题
  Future<void> addErrorNote(ErrorNoteModel note) async {
    _errorNotes.insert(0, note);
    await _saveErrorNotes();
    notifyListeners();
  }

  // 删除错题
  Future<void> deleteErrorNote(String id) async {
    _errorNotes.removeWhere((n) => n.id == id);
    await _saveErrorNotes();
    notifyListeners();
  }

  // 更新错题复习时间
  Future<void> updateReviewTime(String id, DateTime time) async {
    var index = _errorNotes.indexWhere((n) => n.id == id);
    if (index != -1) {
      _errorNotes[index] = _errorNotes[index].copyWith(
        reviewTime: time,
        reviewCount: _errorNotes[index].reviewCount + 1,
      );
      await _saveErrorNotes();
      notifyListeners();
    }
  }

  // 获取需要复习的错题
  List<ErrorNoteModel> get notesNeedingReview {
    var now = DateTime.now();
    return _errorNotes.where((n) {
      if (n.reviewTime == null) return true;
      return n.reviewTime!.isBefore(now);
    }).toList();
  }

  // 添加用户提示词
  Future<void> addUserPrompt(PromptTemplateModel prompt) async {
    _userPrompts.add(prompt);
    await _saveUserPrompts();
    notifyListeners();
  }

  // 删除用户提示词
  Future<void> deleteUserPrompt(String id) async {
    _userPrompts.removeWhere((p) => p.id == id);
    await _saveUserPrompts();
    notifyListeners();
  }

  // 更新提示词使用次数
  Future<void> incrementPromptUse(String id) async {
    var index = _userPrompts.indexWhere((p) => p.id == id);
    if (index != -1) {
      _userPrompts[index] = _userPrompts[index].copyWith(
        useCount: _userPrompts[index].useCount + 1,
      );
      await _saveUserPrompts();
      notifyListeners();
    }
  }

  // 搜索错题
  List<ErrorNoteModel> searchErrorNotes(String keyword) {
    if (keyword.isEmpty) return _errorNotes;
    return _errorNotes.where((n) {
      return n.errorReason.toLowerCase().contains(keyword.toLowerCase()) ||
          n.errorType.toLowerCase().contains(keyword.toLowerCase());
    }).toList();
  }

  // 导出所有数据（返回JSON字符串）
  Future<String> exportAllData() async {
    var data = {
      'errorNotes': _errorNotes.map((n) => n.toJson()).toList(),
      'userPrompts': _userPrompts.map((p) => p.toJson()).toList(),
      'exportTime': DateTime.now().toIso8601String(),
    };
    return jsonEncode(data);
  }

  // 清除所有数据
  Future<void> clearAllData() async {
    _errorNotes.clear();
    _userPrompts.clear();
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('errorNotes');
    await prefs.remove('userPrompts');
    notifyListeners();
  }
}
