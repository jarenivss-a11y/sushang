// ============================================================
// 【应用入口文件】
// 作用：启动整个Flutter应用
// ============================================================

import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  // 确保Flutter绑定初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 运行App
  runApp(const CodeMasterApp());
}
