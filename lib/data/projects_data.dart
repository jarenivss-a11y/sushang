// ============================================================
// 【实战项目数据文件】
// 作用：存储5个零基础可完成的实战项目
// 每个项目都有完整代码、分步教程、自定义指南
// ============================================================

import '../models/project_model.dart';

// 项目1：简易计算器
final ProjectModel calculatorProject = ProjectModel(
  id: 'project1',
  name: '我的第一个计算器',
  subtitle: '最基础的实战项目，学会界面和逻辑结合',
  difficulty: 1,
  icon: '🧮',
  introduction: '''
# 项目介绍

这是一个最基础的计算器App，学会了这个，你就学会了：

- 怎么用Flutter画界面
- 怎么让按钮有点击反应
- 怎么做简单的数学计算
- 怎么保存和显示数据

## 我会学到什么？

1. Flutter的基本结构
2. StatefulWidget（会变化的页面）
3. GridView（网格布局，做按钮用的）
4. 简单的事件处理

## 难度

⭐☆☆☆☆（非常简单，适合零基础）

## 预计完成时间

30分钟 - 1小时
''',
  effectDescription: '''
最终效果是一个可以用的计算器：
- 有数字键 0-9
- 有加减乘除运算键
- 有等号键得出结果
- 有清除键C重新开始
- 会显示你输入的数字和计算结果
''',
  steps: [
    ProjectStep(
      stepNumber: 1,
      title: '创建Flutter项目',
      description: '打开命令行，输入以下命令创建项目：',
      codeSnippet: '''
flutter create my_calculator
cd my_calculator
code .
''',
      tip: '如果不知道怎么打开命令行，按 Windows键+R，输入 cmd 回车',
    ),
    ProjectStep(
      stepNumber: 2,
      title: '打开主文件',
      description: '1. 在VSCode左侧找到 lib 文件夹\n2. 点击 main.dart 打开它\n3. 删除里面的所有代码',
      tip: 'main.dart 是Flutter应用的入口文件，每个项目都有',
    ),
    ProjectStep(
      stepNumber: 3,
      title: '粘贴计算器代码',
      description: '把下面完整的代码复制粘贴到 main.dart 中：',
      codeSnippet: '''
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  double num1 = 0;
  String operator = '';
  bool needClear = false;

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        display = '0';
        num1 = 0;
        operator = '';
      } else if ('0123456789'.contains(value)) {
        if (needClear || display == '0') {
          display = value;
          needClear = false;
        } else {
          display += value;
        }
      } else if ('+-×÷'.contains(value)) {
        num1 = double.parse(display);
        operator = value;
        needClear = true;
      } else if (value == '=') {
        double num2 = double.parse(display);
        double result = 0;
        switch (operator) {
          case '+': result = num1 + num2; break;
          case '-': result = num1 - num2; break;
          case '×': result = num1 * num2; break;
          case '÷': if (num2 != 0) result = num1 / num2; break;
        }
        display = result.toString();
        if (display.endsWith('.0')) {
          display = display.substring(0, display.length - 2);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的计算器')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.bottomRight,
            child: Text(display, style: TextStyle(fontSize: 56)),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: EdgeInsets.all(8),
              children: [
                _buildButton('C', Colors.red),
                _buildButton('÷', Colors.blue),
                _buildButton('×', Colors.blue),
                _buildButton('⌫', Colors.orange),
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('-', Colors.blue),
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('+', Colors.blue),
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('=', Colors.green),
                _buildButton('0', flex: 2),
                _buildButton('.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value, [Color? color, int flex = 1]) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[200],
            foregroundColor: color != null ? Colors.white : Colors.black,
            padding: EdgeInsets.all(20),
          ),
          onPressed: () => onButtonPressed(value),
          child: Text(value, style: TextStyle(fontSize: 28)),
        ),
      ),
    );
  }
}
''',
      codeExplanation: '''
代码解释：

1. CalculatorApp - 根组件，返回MaterialApp
2. CalculatorScreen - 计算器页面，使用StatefulWidget因为要保存数据
3. display - 保存屏幕上显示的内容
4. num1 - 保存第一个输入的数字
5. operator - 保存当前选中的运算符
6. onButtonPressed - 按钮点击的处理函数
7. GridView.count - 网格布局，crossAxisCount:4 表示一行4个按钮
''',
      tip: '复制代码时注意不要遗漏任何部分',
    ),
    ProjectStep(
      stepNumber: 4,
      title: '保存并运行',
      description: '1. 按 Ctrl + S 保存文件\n2. 按 Shift + F5 运行程序\n3. 等待几秒钟，就会看到计算器界面了！',
      tip: '第一次运行可能要下载一些东西，耐心等待',
    ),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  double num1 = 0;
  String operator = '';
  bool needClear = false;

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        display = '0';
        num1 = 0;
        operator = '';
      } else if ('0123456789'.contains(value)) {
        if (needClear || display == '0') {
          display = value;
          needClear = false;
        } else {
          display += value;
        }
      } else if ('+-×÷'.contains(value)) {
        num1 = double.parse(display);
        operator = value;
        needClear = true;
      } else if (value == '=') {
        double num2 = double.parse(display);
        double result = 0;
        switch (operator) {
          case '+': result = num1 + num2; break;
          case '-': result = num1 - num2; break;
          case '×': result = num1 * num2; break;
          case '÷': if (num2 != 0) result = num1 / num2; break;
        }
        display = result.toString();
        if (display.endsWith('.0')) {
          display = display.substring(0, display.length - 2);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的计算器')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.bottomRight,
            child: Text(display, style: TextStyle(fontSize: 56)),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: EdgeInsets.all(8),
              children: [
                _buildButton('C', Colors.red),
                _buildButton('÷', Colors.blue),
                _buildButton('×', Colors.blue),
                _buildButton('⌫', Colors.orange),
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('-', Colors.blue),
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('+', Colors.blue),
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('=', Colors.green),
                _buildButton('0', flex: 2),
                _buildButton('.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value, [Color? color, int flex = 1]) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[200],
            foregroundColor: color != null ? Colors.white : Colors.black,
            padding: EdgeInsets.all(20),
          ),
          onPressed: () => onButtonPressed(value),
          child: Text(value, style: TextStyle(fontSize: 28)),
        ),
      ),
    );
  }
}
''',
  codeExplanation: '''
这段代码实现了一个完整的计算器App：

1. main() 是程序入口
2. CalculatorApp 是根组件，指定使用MaterialApp
3. CalculatorScreen 是计算器页面，用StatefulWidget因为数据会变化
4. display 保存屏幕显示的文字
5. num1 和 operator 保存运算数据
6. onButtonPressed 处理每个按钮的点击
7. GridView.count 创建4列的网格布局
8. _buildButton 辅助方法创建每个按钮

你可以修改的地方：
- 按钮颜色
- 字体大小
- 添加更多按钮（比如%取余）
''',
  customizableParts: [
    '按钮颜色：把 Colors.red 改成 Colors.purple 等',
    '字体大小：把 fontSize: 56 改成更大或更小的数字',
    '标题文字：把 AppBar 中的 Text 改成你想要的标题',
    '添加新按钮：在 GridView.children 列表中添加',
  ],
);

// 项目2：待办清单
final ProjectModel todoProject = ProjectModel(
  id: 'project2',
  name: '待办清单App',
  subtitle: '学会数据的增删改查，做一个真正的任务管理工具',
  difficulty: 2,
  icon: '📝',
  introduction: '''
# 项目介绍

这是一个待办清单App，可以记录你要做的事情，完成了可以打勾。

学会了这个，你就学会了：

- 怎么添加数据
- 怎么显示列表
- 怎么删除数据
- 怎么标记完成
- 怎么保存数据（关闭App再打开还在）

## 我会学到什么？

1. ListView（列表视图）
2. TextField（输入框）
3. SharedPreferences（数据保存）
4. Checkbox（复选框）

## 难度

⭐⭐☆☆☆（简单）

## 预计完成时间

1-2小时
''',
  effectDescription: '''
最终效果是一个待办清单：
- 可以输入新的待办事项
- 可以看到所有待办列成一列
- 可以点击复选框标记完成
- 可以滑动或点击删除待办
- 关闭App再打开，数据还在
''',
  steps: [
    ProjectStep(
      stepNumber: 1,
      title: '创建项目',
      description: '创建新的Flutter项目：',
      codeSnippet: '''
flutter create my_todo
cd my_todo
code .
''',
      tip: '项目名不要用todo，可能会冲突',
    ),
    ProjectStep(
      stepNumber: 2,
      title: '添加依赖',
      description: '打开 pubspec.yaml，在 dependencies 下添加一行：',
      codeSnippet: '''
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  shared_preferences: ^2.3.3
''',
      tip: '添加后要运行 flutter pub get',
    ),
    ProjectStep(
      stepNumber: 3,
      title: '粘贴完整代码',
      description: '把下面代码复制到 lib/main.dart：',
      codeSnippet: '''
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的待办',
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> _todos = [];
  List<bool> _done = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _todos = prefs.getStringList('todos') ?? [];
      _done = List.generate(_todos.length, (_) => false);
    });
  }

  Future<void> _saveTodos() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos);
  }

  void _addTodo() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _todos.add(_controller.text);
      _done.add(false);
      _controller.clear();
    });
    _saveTodos();
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
      _done.removeAt(index);
    });
    _saveTodos();
  }

  void _toggleDone(int index) {
    setState(() {
      _done[index] = !_done[index];
    });
    _saveTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的待办')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: '输入新的待办...'),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _addTodo, child: Text('添加')),
              ],
            ),
          ),
          Expanded(
            child: _todos.isEmpty
                ? Center(child: Text('没有待办，添加一个吧！'))
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value: _done[index],
                          onChanged: (_) => _toggleDone(index),
                        ),
                        title: Text(
                          _todos[index],
                          style: TextStyle(
                            decoration: _done[index]
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTodo(index),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
''',
      codeExplanation: '''
代码解释：

1. StatefulWidget - 因为数据会变化，需要用这个
2. List<String> _todos - 保存所有待办内容
3. SharedPreferences - 用来保存数据到本地
4. _loadTodos / _saveTodos - 加载和保存数据
5. ListView.builder - 根据列表内容自动生成列表项
6. Checkbox - 复选框组件
''',
      tip: '记得运行 flutter pub get',
    ),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的待办',
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> _todos = [];
  List<bool> _done = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _todos = prefs.getStringList('todos') ?? [];
      _done = List.generate(_todos.length, (_) => false);
    });
  }

  Future<void> _saveTodos() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos);
  }

  void _addTodo() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _todos.add(_controller.text);
      _done.add(false);
      _controller.clear();
    });
    _saveTodos();
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
      _done.removeAt(index);
    });
    _saveTodos();
  }

  void _toggleDone(int index) {
    setState(() {
      _done[index] = !_done[index];
    });
    _saveTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的待办')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: '输入新的待办...'),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _addTodo, child: Text('添加')),
              ],
            ),
          ),
          Expanded(
            child: _todos.isEmpty
                ? Center(child: Text('没有待办，添加一个吧！'))
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value: _done[index],
                          onChanged: (_) => _toggleDone(index),
                        ),
                        title: Text(
                          _todos[index],
                          style: TextStyle(
                            decoration: _done[index]
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTodo(index),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
''',
  codeExplanation: '''
待办清单App的核心逻辑：

1. 两个列表：_todos存内容，_done存完成状态
2. SharedPreferences持久化：关闭App再打开还在
3. ListView.builder自动生成列表
4. 完成后显示删除线 decoration: lineThrough

可自定义修改：
- 界面颜色
- 添加编辑功能
- 添加分类标签
''',
  customizableParts: [
    'App标题：修改 AppBar 中的 Text',
    '按钮文字：修改 ElevatedButton 中的 child Text',
    '空状态提示：修改 Center 中的 Text',
    '添加已完成待办的筛选功能',
  ],
);

// 项目3：猜数字游戏
final ProjectModel guessNumberProject = ProjectModel(
  id: 'project3',
  name: '猜数字游戏',
  subtitle: '做一个简单的小游戏，学会随机数和用户交互',
  difficulty: 2,
  icon: '🎮',
  introduction: '''
# 项目介绍

这是一个猜数字游戏：电脑随机想一个1-100的数字，你来猜。

学会了这个，你就学会了：

- 怎么生成随机数
- 怎么获取用户输入
- 怎么做比较判断
- 怎么显示提示信息

## 我会学到什么？

1. Dart的Random（随机数）
2. AlertDialog（弹出对话框）
3. if/else条件判断

## 难度

⭐⭐☆☆☆（简单）

## 预计完成时间

1小时左右
''',
  effectDescription: '''
最终效果：
- 电脑随机想一个1-100的数字
- 你输入数字来猜
- 电脑会提示"太大了"或"太小了"
- 猜对了会显示恭喜和用了多少次
''',
  steps: [
    ProjectStep(
      stepNumber: 1,
      title: '创建项目',
      description: '创建猜数字游戏项目：',
      codeSnippet: '''
flutter create guess_number
cd guess_number
code .
''',
      tip: '项目名可以是任意的',
    ),
    ProjectStep(
      stepNumber: 2,
      title: '粘贴游戏代码',
      description: '复制以下代码到 lib/main.dart：',
      codeSnippet: '''
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(GuessNumberApp());
}

class GuessNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuessScreen(),
    );
  }
}

class GuessScreen extends StatefulWidget {
  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  int _target = 0;
  int _guessCount = 0;
  String _hint = '我来想一个1-100的数字，你来猜！';
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newGame();
  }

  void _newGame() {
    var random = Random();
    _target = random.nextInt(100) + 1;
    _guessCount = 0;
    _hint = '我来想一个1-100的数字，你来猜！';
  }

  void _guess() {
    var input = int.tryParse(_controller.text);
    if (input == null) {
      setState(() => _hint = '请输入有效的数字！');
      return;
    }
    _guessCount++;
    setState(() {
      if (input == _target) {
        _hint = '恭喜你猜对了！用了\$_guessCount次';
        _showWinDialog();
      } else if (input > _target) {
        _hint = '太大了，再小一点！你已经猜了\$_guessCount次';
      } else {
        _hint = '太小了，再大一点！你已经猜了\$_guessCount次';
      }
    });
    _controller.clear();
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🎉恭喜！'),
        content: Text('你用了\$_guessCount次猜对！'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _newGame();
            },
            child: Text('再来一局'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('猜数字游戏')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(_hint, style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 24),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '输入你的猜测(1-100)',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _guess(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _guess,
              child: Text('猜！'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                _newGame();
                _controller.clear();
              },
              child: Text('重新开始'),
            ),
          ],
        ),
      ),
    );
  }
}
''',
      codeExplanation: '''
代码解释：

1. dart:math - Dart的数学库，包含Random
2. Random().nextInt(100) + 1 - 生成1-100的随机整数
3. int.tryParse() - 尝试把字符串转成数字，失败返回null
4. AlertDialog - 弹出对话框组件
5. TextField onSubmitted - 用户按回车时触发
''',
      tip: '游戏逻辑在_guess()方法里',
    ),
  ],
  sourceCode: '''
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(GuessNumberApp());
}

class GuessNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuessScreen(),
    );
  }
}

class GuessScreen extends StatefulWidget {
  @override
  _GuessScreenState createState() => _GuessScreenState();
}

class _GuessScreenState extends State<GuessScreen> {
  int _target = 0;
  int _guessCount = 0;
  String _hint = '我来想一个1-100的数字，你来猜！';
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newGame();
  }

  void _newGame() {
    var random = Random();
    _target = random.nextInt(100) + 1;
    _guessCount = 0;
    _hint = '我来想一个1-100的数字，你来猜！';
  }

  void _guess() {
    var input = int.tryParse(_controller.text);
    if (input == null) {
      setState(() => _hint = '请输入有效的数字！');
      return;
    }
    _guessCount++;
    setState(() {
      if (input == _target) {
        _hint = '恭喜你猜对了！用了\$_guessCount次';
        _showWinDialog();
      } else if (input > _target) {
        _hint = '太大了，再小一点！你已经猜了\$_guessCount次';
      } else {
        _hint = '太小了，再大一点！你已经猜了\$_guessCount次';
      }
    });
    _controller.clear();
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🎉恭喜！'),
        content: Text('你用了\$_guessCount次猜对！'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _newGame();
            },
            child: Text('再来一局'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('猜数字游戏')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(_hint, style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            SizedBox(height: 24),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '输入你的猜测(1-100)',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _guess(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _guess,
              child: Text('猜！'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                _newGame();
                _controller.clear();
              },
              child: Text('重新开始'),
            ),
          ],
        ),
      ),
    );
  }
}
''',
  codeExplanation: '''
猜数字游戏的核心逻辑：

1. _newGame() - 生成新的随机数，重置计数
2. _guess() - 处理猜的动作，比较大小给出提示
3. _showWinDialog() - 猜对后弹出胜利对话框

可以修改的地方：
- 数字范围（改成1-1000）
- 界面样式
- 添加猜错次数限制
''',
  customizableParts: [
    '数字范围：把100改成其他数字',
    '提示文字：修改_hints变量',
    '界面颜色：修改ThemeData',
    '添加游戏难度选择',
  ],
);

// 项目4和5（继续简化）
final ProjectModel notepadProject = ProjectModel(
  id: 'project4',
  name: '简易记事本',
  subtitle: '学会保存文本数据，做一个私人笔记工具',
  difficulty: 2,
  icon: '📓',
  introduction: '''
# 项目介绍

这是一个简易记事本，可以写笔记、保存笔记、查看历史笔记。

学会了这个，你就学会了：

- 怎么用TextField输入多行文字
- 怎么保存数据到本地
- 怎么读取和显示历史数据
- 怎么用ListView显示列表

## 难度

⭐⭐☆☆☆（简单）

## 预计完成时间

1-2小时
''',
  effectDescription: '''
最终效果：
- 可以写新的笔记
- 保存后会在列表中显示
- 点击列表项可以查看内容
- 可以删除不需要的笔记
''',
  steps: [
    ProjectStep(
      stepNumber: 1,
      title: '创建项目',
      description: '创建记事本项目：',
      codeSnippet: '''
flutter create my_notepad
cd my_notepad
code .
''',
      tip: '项目名可以是任意的',
    ),
    ProjectStep(
      stepNumber: 2,
      title: '粘贴代码',
      description: '复制以下代码到 lib/main.dart（需要添加shared_preferences依赖）：',
      codeSnippet: '''
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() => runApp(NotepadApp());

class NotepadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '简易记事本', home: NotepadScreen());
  }
}

class Note {
  String title;
  String content;
  DateTime time;
  Note({required this.title, required this.content, required this.time});
}

class NotepadScreen extends StatefulWidget {
  @override
  _NotepadScreenState createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  List<Note> _notes = [];
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('notes');
    if (data != null) {
      var list = jsonDecode(data) as List;
      setState(() {
        _notes = list.map((n) => Note(
          title: n['title'],
          content: n['content'],
          time: DateTime.parse(n['time']),
        )).toList();
      });
    }
  }

  Future<void> _saveNotes() async {
    var prefs = await SharedPreferences.getInstance();
    var data = _notes.map((n) => {
      'title': n.title,
      'content': n.content,
      'time': n.time.toIso8601String(),
    }).toList();
    await prefs.setString('notes', jsonEncode(data));
  }

  void _addNote() {
    if (_contentController.text.trim().isEmpty) return;
    var content = _contentController.text;
    var title = content.split('\\n').first;
    if (title.length > 20) title = title.substring(0, 20) + '...';
    setState(() {
      _notes.insert(0, Note(title: title, content: content, time: DateTime.now()));
      _contentController.clear();
    });
    _saveNotes();
    Navigator.pop(context);
  }

  void _deleteNote(int index) {
    setState(() => _notes.removeAt(index));
    _saveNotes();
  }

  void _showAddPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('写笔记'),
          actions: [TextButton(onPressed: _addNote, child: Text('保存', style: TextStyle(color: Colors.white)))],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            controller: _contentController,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(hintText: '开始写笔记...', border: InputBorder.none),
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('简易记事本')),
      body: _notes.isEmpty
          ? Center(child: Text('还没有笔记，写一个吧！'))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                var note = _notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content, maxLines: 2, overflow: TextOverflow.ellipsis),
                  trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () => _deleteNote(index)),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(onPressed: _showAddPage, child: Icon(Icons.add)),
    );
  }
}
''',
      codeExplanation: '''
代码说明：
1. Note类 - 定义笔记的数据结构
2. jsonEncode/jsonDecode - JSON格式存储复杂数据
3. TextField(maxLines: null) - 多行输入框
4. FloatingActionButton - 悬浮添加按钮
''',
      tip: '记得添加 shared_preferences 依赖',
    ),
  ],
  sourceCode: '''
// 完整代码见上方步骤2
''',
  codeExplanation: '''
记事本核心功能：
1. 写笔记 - 多行TextField输入
2. 保存 - JSON格式存储
3. 显示列表 - ListView.builder
4. 删除 - removeAt删除指定项

可自定义：
- 笔记分类
- 搜索功能
- 字体大小调整
''',
  customizableParts: [
    'App名称',
    '笔记显示样式',
    '添加搜索功能',
  ],
);

final ProjectModel profileCardProject = ProjectModel(
  id: 'project5',
  name: '个人信息卡片',
  subtitle: '最简单的基础练习，学会Flutter布局',
  difficulty: 1,
  icon: '👤',
  introduction: '''
# 项目介绍

这是一个个人信息卡片App，显示头像、名字、简介等信息。

这是最简单的项目，适合作为入门练习！

## 难度

⭐☆☆☆☆（非常简单）

## 预计完成时间

30分钟
''',
  effectDescription: '''
最终效果：
- 显示一个漂亮的个人信息卡片
- 有头像（可以用emoji代替）
- 有名字和简介
- 底部有几个社交按钮
''',
  steps: [
    ProjectStep(
      stepNumber: 1,
      title: '创建项目',
      description: '创建个人信息卡片项目：',
      codeSnippet: '''
flutter create profile_card
cd profile_card
code .
''',
      tip: '',
    ),
    ProjectStep(
      stepNumber: 2,
      title: '粘贴代码',
      description: '复制以下代码到 lib/main.dart：',
      codeSnippet: '''
import 'package:flutter/material.dart';

void main() => runApp(ProfileCardApp());

class ProfileCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Text('😊', style: TextStyle(fontSize: 50)),
                  ),
                  SizedBox(height: 16),
                  Text('小明', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('零基础编程学习者', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 16),
                  Text('正在学习Flutter，希望能做出自己的App！', textAlign: TextAlign.center),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.wechat, color: Colors.green, size: 32),
                      Icon(Icons.weibo, color: Colors.orange, size: 32),
                      Icon(Icons.email, color: Colors.blue, size: 32),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
''',
      codeExplanation: '''
代码说明：
1. Card - 卡片组件，有阴影和圆角
2. CircleAvatar - 圆形头像
3. Column - 垂直布局
4. SizedBox - 留白组件
5. Row - 水平布局
6. Icon - 图标组件
''',
      tip: '这是最简单的项目，可以随便改着玩',
    ),
  ],
  sourceCode: '''
// 完整代码见上方步骤2
''',
  codeExplanation: '''
个人信息卡片核心：
1. Card - 卡片包装
2. CircleAvatar - 圆形头像
3. Column - 垂直排列内容

可自定义修改：
- 头像emoji
- 名字和简介文字
- 添加更多社交图标
- 改变卡片颜色
''',
  customizableParts: [
    '头像emoji：换成你喜欢的',
    '名字和简介：改成你自己的',
    '社交图标：添加更多或换掉',
    '卡片颜色：在Card外层加ColorFiltered或Container',
  ],
);

// 【项目6：商品列表 - 难度⭐⭐】
final ProjectModel productListProject = ProjectModel(
  id: 'project6',
  name: '商品列表展示',
  subtitle: '学习网络数据请求和列表展示',
  difficulty: 2,
  icon: '🛍️',
  introduction: '商品列表App，展示ListView.builder、RefreshIndicator下拉刷新、搜索过滤功能',
  effectDescription: '顶部搜索框 + 商品列表（图片+名称+价格）',
  steps: [
    ProjectStep(stepNumber: 1, title: '创建项目', description: '创建商品列表项目', codeSnippet: 'flutter create product_list'),
    ProjectStep(stepNumber: 2, title: '定义商品数据', description: '创建商品数据模型', codeSnippet: 'class Product { String name; double price; String imageUrl; }'),
    ProjectStep(stepNumber: 3, title: '编写列表页面', description: '用ListView.builder展示商品'),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';
void main() => runApp(ProductListApp());
class Product { String name; double price; String imageUrl; Product({required this.name, required this.price, required this.imageUrl}); }
final List<Product> products = [Product(name: 'iPhone 15', price: 6999, imageUrl: '📱'),Product(name: 'MacBook Pro', price: 12999, imageUrl: '💻'),Product(name: 'AirPods Pro', price: 1999, imageUrl: '🎧')];
class ProductListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: ProductListScreen());
}
class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> _filtered = List.from(products);
  final _searchController = TextEditingController();
  void _search(String keyword) {
    setState(() {
      _filtered = keyword.isEmpty ? products : products.where((p) => p.name.contains(keyword)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表')),
      body: Column(children: [
        Padding(padding: EdgeInsets.all(16), child: TextField(controller: _searchController, decoration: InputDecoration(hintText: '搜索...', prefixIcon: Icon(Icons.search)), onChanged: _search)),
        Expanded(child: ListView.builder(itemCount: _filtered.length, itemBuilder: (context, index) {
          final p = _filtered[index];
          return Card(child: ListTile(leading: Text(p.imageUrl, style: TextStyle(fontSize: 32)), title: Text(p.name), subtitle: Text('价格: \${p.price}'), trailing: Icon(Icons.chevron_right)));
        })),
      ]),
    );
  }
}
''',
  codeExplanation: 'ListView.builder高效渲染列表，搜索时过滤数据并刷新UI',
  customizableParts: ['修改商品数据', '改变卡片样式', '添加分类tab'],
);

// 【项目7：购物车 - 难度⭐⭐⭐】
final ProjectModel shoppingCartProject = ProjectModel(
  id: 'project7',
  name: '购物车',
  subtitle: '多选、数量修改、总价计算',
  difficulty: 3,
  icon: '🛒',
  introduction: '购物车是电商应用的核心功能！学习Checkbox多选、数量增删、总价计算',
  effectDescription: '商品列表+复选框+数量增减+底部结算栏',
  steps: [
    ProjectStep(stepNumber: 1, title: '创建项目', description: 'flutter create shopping_cart', codeSnippet: 'flutter create shopping_cart'),
    ProjectStep(stepNumber: 2, title: '定义CartItem', description: '购物车商品数据模型', codeSnippet: 'class CartItem { String name; double price; int count; bool selected; }'),
    ProjectStep(stepNumber: 3, title: '计算总价', description: '用fold累加选中商品', codeSnippet: 'double total = items.where((i)=>i.selected).fold(0,(sum,i)=>sum+i.price*i.count);'),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';
void main() => runApp(ShoppingCartApp());
class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: CartScreen());
}
class CartItem { String name; double price; int count; bool selected; CartItem({required this.name, required this.price, this.count=1, this.selected=false}); double get total => price * count; }
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  List<CartItem> _items = [CartItem(name: 'iPhone 15', price: 6999),CartItem(name: 'AirPods Pro', price: 1999)];
  double get total => _items.where((i)=>i.selected).fold(0,(sum,i)=>sum+i.total);
  int get count => _items.where((i)=>i.selected).length;
  void _toggle(int i) => setState(()=>_items[i].selected=!_items[i].selected);
  void _inc(int i) => setState(()=>_items[i].count++);
  void _dec(int i) => setState((){ if(_items[i].count>1) _items[i].count--; });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车')),
      body: Column(children: [
        Expanded(child: ListView.builder(itemCount: _items.length, itemBuilder: (context, index) {
          final item = _items[index];
          return Card(child: Padding(padding: EdgeInsets.all(12), child: Row(children: [
            Checkbox(value: item.selected, onChanged: (_)=>_toggle(index)),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)), Text('¥\${item.price}', style: TextStyle(color: Colors.red))])),
            IconButton(icon: Icon(Icons.remove), onPressed: ()=>_dec(index)),
            Text('\$item.count'),
            IconButton(icon: Icon(Icons.add), onPressed: ()=>_inc(index)),
          ])));
        })),
        Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 4)]), child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('已选 \$count 件'), Text('合计: ¥\${total.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red))]),
          Spacer(),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: (){}, child: Text('结算')),
        ])),
      ]),
    );
  }
}
''',
  codeExplanation: 'Checkbox控制选中状态，fold计算总价，setState刷新UI',
  customizableParts: ['添加全选按钮', '保存到本地', '结算流程'],
);

// 【项目8：订单管理 - 难度⭐⭐⭐】
final ProjectModel orderManagerProject = ProjectModel(
  id: 'project8',
  name: '订单管理系统',
  subtitle: 'Tab切换、订单状态筛选',
  difficulty: 3,
  icon: '📦',
  introduction: '订单管理系统是电商运营的核心！学习TabBar切换、订单状态枚举、列表筛选',
  effectDescription: '顶部Tab（全部/待付款/待发货/已完成）+ 订单列表',
  steps: [
    ProjectStep(stepNumber: 1, title: '创建项目', description: 'flutter create order_manager', codeSnippet: 'flutter create order_manager'),
    ProjectStep(stepNumber: 2, title: '定义状态枚举', description: '订单状态类型', codeSnippet: 'enum OrderStatus { all, pending, shipped, completed }'),
    ProjectStep(stepNumber: 3, title: 'TabBar切换', description: '用TabController控制', codeSnippet: 'TabBarView(controller: _tabController, children: [...])'),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';
void main() => runApp(OrderManagerApp());
class OrderManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: OrderScreen());
}
enum OrderStatus { all, pending, shipped, completed }
class Order { String id; String product; double price; OrderStatus status; Order({required this.id, required this.product, required this.price, required this.status}); }
class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}
class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Order> _orders = [Order(id: '001', product: 'iPhone 15', price: 6999, status: OrderStatus.pending),Order(id: '002', product: 'AirPods', price: 1999, status: OrderStatus.shipped),Order(id: '003', product: 'MacBook', price: 12999, status: OrderStatus.completed)];
  @override
  void initState() { super.initState(); _tabController = TabController(length: 4, vsync: this); }
  List<Order> _filter(OrderStatus s) => s==OrderStatus.all ? _orders : _orders.where((o)=>o.status==s).toList();
  Color _color(OrderStatus s) => s==OrderStatus.pending?Colors.orange:s==OrderStatus.shipped?Colors.blue:Colors.green;
  String _text(OrderStatus s) => s==OrderStatus.pending?'待付款':s==OrderStatus.shipped?'待发货':'已完成';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的订单'), bottom: TabBar(controller: _tabController, tabs: [Tab(text:'全部'),Tab(text:'待付款'),Tab(text:'待发货'),Tab(text:'已完成')])),
      body: TabBarView(controller: _tabController, children: [0,1,2,3].map((i)=>_OrderListView(status: OrderStatus.values[i], orders: _filter(OrderStatus.values[i]), color: _color, text: _text)).toList()),
    );
  }
}
class _OrderListView extends StatelessWidget {
  final OrderStatus status; final List<Order> orders; final Color Function(OrderStatus) color; final String Function(OrderStatus) text;
  _OrderListView({required this.status, required this.orders, required this.color, required this.text});
  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) return Center(child: Text('没有相关订单'));
    return ListView.builder(itemCount: orders.length, itemBuilder: (context, index) {
      final o = orders[index];
      return Card(margin: EdgeInsets.all(8), child: Padding(padding: EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('订单号: \${o.id}', style: TextStyle(color: Colors.grey)), Container(padding: EdgeInsets.symmetric(horizontal:8,vertical:4), decoration: BoxDecoration(color: color(o.status).withAlpha(25), borderRadius: BorderRadius.circular(4)), child: Text(text(o.status), style: TextStyle(color: color(o.status), fontSize: 12)))])),
        Divider(),
        Text('\${o.product}'),
        Text('合计: ¥\${o.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red)),
      ])));
    });
  }
}
''',
  codeExplanation: 'TabBarView实现tab切换，filter按状态筛选订单',
  customizableParts: ['订单详情页', '取消订单', '订单排序'],
);

// 【项目9：销售统计 - 难度⭐⭐⭐⭐】
final ProjectModel salesStatsProject = ProjectModel(
  id: 'project9',
  name: '销售数据统计',
  subtitle: '数据可视化、图表展示',
  difficulty: 4,
  icon: '📊',
  introduction: '销售统计是电商运营的重要工具！学习数据统计、简单柱状图、排行榜',
  effectDescription: '关键指标卡片 + 柱状图 + 销售排行榜',
  steps: [
    ProjectStep(stepNumber: 1, title: '创建项目', description: 'flutter create sales_stats', codeSnippet: 'flutter create sales_stats'),
    ProjectStep(stepNumber: 2, title: '统计指标', description: '用fold计算总和', codeSnippet: 'double total = data.fold(0,(sum,d)=>sum+d.amount);'),
    ProjectStep(stepNumber: 3, title: '简单柱状图', description: '用Container画柱子', codeSnippet: 'Container(width:30, height:height, decoration:BoxDecoration(color:Colors.blue))'),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';
void main() => runApp(SalesStatsApp());
class SalesStatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: StatsScreen());
}
class SalesData { String date; double amount; SalesData(this.date, this.amount); }
class StatsScreen extends StatelessWidget {
  final List<SalesData> data = [SalesData('周一',1234),SalesData('周二',2345),SalesData('周三',1890),SalesData('周四',2100),SalesData('周五',3200),SalesData('周六',4500),SalesData('周日',3800)];
  double get total => data.fold(0,(sum,d)=>sum+d.amount);
  int get orders => data.length*15;
  double get avg => total/orders;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('销售统计')),
      body: SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [Expanded(child: _Card('总销售额','\\(total/10000).toStringAsFixed(1)万',Colors.red,Icons.money)), SizedBox(width:8), Expanded(child: _Card('订单数','\$orders',Colors.blue,Icons.shopping_cart))]),
        SizedBox(height:8),
        Row(children: [Expanded(child: _Card('客单价','\\(avg).toStringAsFixed(0)',Colors.green,Icons.person)), SizedBox(width:8), Expanded(child: _Card('转化率','3.2%',Colors.purple,Icons.trending_up))]),
        SizedBox(height:24),
        Text('近7天销售趋势', style: TextStyle(fontSize:16, fontWeight:FontWeight.bold)),
        SizedBox(height:12),
        Container(height:200, padding:EdgeInsets.all(16), decoration:BoxDecoration(color:Colors.white, borderRadius:BorderRadius.circular(12), boxShadow:[BoxShadow(color:Colors.grey[200]!, blurRadius:4)]), child: _BarChart(data)),
        SizedBox(height:24),
        Text('销售排行', style: TextStyle(fontSize:16, fontWeight:FontWeight.bold)),
        _RankItem(1,'iPhone 15',50,349950),
        _RankItem(2,'MacBook Pro',30,389970),
        _RankItem(3,'AirPods',100,199900),
      ])),
    );
  }
}
class _Card extends StatelessWidget {
  final String t,v; final Color c; final IconData i;
  _Card(this.t,this.v,this.c,this.i);
  @override
  Widget build(BuildContext context) => Container(padding:EdgeInsets.all(16), decoration:BoxDecoration(color:Colors.white, borderRadius:BorderRadius.circular(12), boxShadow:[BoxShadow(color:Colors.grey[200]!, blurRadius:4)]), child: Column(crossAxisAlignment:CrossAxisAlignment.start, children: [Icon(i,color:c), SizedBox(height:8), Text(v,style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)), Text(t,style:TextStyle(color:Colors.grey))]));
}
class _BarChart extends StatelessWidget {
  final List<SalesData> d;
  _BarChart(this.d);
  @override
  Widget build(BuildContext context) {
    final max = d.map((e)=>e.amount).reduce((a,b)=>a>b?a:b);
    return Row(mainAxisAlignment:MainAxisAlignment.spaceAround, crossAxisAlignment:CrossAxisAlignment.end, children: d.map((e)=>Column(mainAxisAlignment:MainAxisAlignment.end, children: [Text('\\(e.amount/1000).toStringAsFixed(0)k',style:TextStyle(fontSize:10)), SizedBox(height:4), Container(width:30,height:(e.amount/max)*100, decoration:BoxDecoration(color:Colors.blue, borderRadius:BorderRadius.circular(4))), SizedBox(height:4), Text(e.date,style:TextStyle(fontSize:10))])).toList());
  }
}
class _RankItem extends StatelessWidget {
  final int r; final String n; final int s; final double v;
  _RankItem(this.r,this.n,this.s,this.v);
  Color get c => r==1?Colors.amber:r==2?Colors.grey:r==3?Colors.brown:Colors.grey[300]!;
  @override
  Widget build(BuildContext context) => Card(margin:EdgeInsets.only(bottom:8), child: Padding(padding:EdgeInsets.all(12), child: Row(children: [Container(width:24,height:24,decoration:BoxDecoration(color:c,shape:BoxShape.circle), child:Center(child:Text('\$r',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)))), SizedBox(width:12), Expanded(child:Text(n)), Text('销量: \$s'), SizedBox(width:16), Text('\\(v/10000).toStringAsFixed(1)万',style:TextStyle(color:Colors.red,fontWeight:FontWeight.bold))])));
}
''',
  codeExplanation: '用fold做数据统计，用Container画简单柱状图',
  customizableParts: ['接入图表库', '时间筛选', '数据导出'],
);

// 【项目10：城市选择器 - 难度⭐⭐】
final ProjectModel cityPickerProject = ProjectModel(
  id: 'project10',
  name: '城市选择器',
  subtitle: '搜索过滤、列表展示',
  difficulty: 2,
  icon: '🏙️',
  introduction: '城市选择器常见于外卖、天气等App！学习搜索过滤、ListView列表展示',
  effectDescription: '搜索框 + 城市列表（点击选中）',
  steps: [
    ProjectStep(stepNumber: 1, title: '创建项目', description: 'flutter create city_picker', codeSnippet: 'flutter create city_picker'),
    ProjectStep(stepNumber: 2, title: '城市数据', description: '定义城市模型', codeSnippet: 'class City { String name; String pinyin; }'),
    ProjectStep(stepNumber: 3, title: '搜索过滤', description: '支持中英文搜索', codeSnippet: '_filtered = cities.where((c)=>c.name.contains(kw)).toList();'),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';
void main() => runApp(CityPickerApp());
class CityPickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: CityPickerScreen());
}
class City { String name; String pinyin; City(this.name, this.pinyin); }
class CityPickerScreen extends StatefulWidget {
  @override
  _CityPickerScreenState createState() => _CityPickerScreenState();
}
class _CityPickerScreenState extends State<CityPickerScreen> {
  List<City> _cities = [City('北京','beijing'),City('上海','shanghai'),City('广州','guangzhou'),City('深圳','shenzhen'),City('杭州','hangzhou'),City('南京','nanjing'),City('成都','chengdu'),City('重庆','chongqing')];
  List<City> _filtered = [];
  final _searchController = TextEditingController();
  @override
  void initState() { super.initState(); _filtered = List.from(_cities); }
  void _search(String keyword) {
    setState(() {
      _filtered = keyword.isEmpty ? _cities : _cities.where((c)=>c.name.contains(keyword) || c.pinyin.contains(keyword.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('选择城市')),
      body: Column(children: [
        Padding(padding: EdgeInsets.all(16), child: TextField(controller: _searchController, decoration: InputDecoration(hintText: '搜索城市...', prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))), onChanged: _search)),
        Expanded(child: _filtered.isEmpty ? Center(child: Text('没有找到城市')) : ListView.builder(itemCount: _filtered.length, itemBuilder: (context, index) {
          final c = _filtered[index];
          return ListTile(leading: CircleAvatar(child: Text(c.pinyin[0].toUpperCase())), title: Text(c.name), subtitle: Text(c.pinyin), onTap: () {
            Navigator.pop(context, c.name);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('已选择: \${c.name}')));
          });
        })),
      ]),
    );
  }
}
''',
  codeExplanation: '搜索时过滤城市列表，支持中文和拼音匹配',
  customizableParts: ['添加字母索引', '热门城市', '最近访问'],
);

// 【项目11：天气App - 难度⭐⭐⭐】
final ProjectModel weatherAppProject = ProjectModel(
  id: 'project11',
  name: '简易天气App',
  subtitle: '网络请求、数据解析',
  difficulty: 3,
  icon: '🌤️',
  introduction: '天气App展示如何获取网络数据！学习async/await异步编程、Future数据处理',
  effectDescription: '当前天气卡片 + 未来天气预报列表',
  steps: [
    ProjectStep(stepNumber: 1, title: '创建项目', description: '添加http依赖', codeSnippet: 'flutter pub add http'),
    ProjectStep(stepNumber: 2, title: '异步获取数据', description: '使用async/await', codeSnippet: 'Future<Weather> fetchWeather() async { return Weather(...); }'),
    ProjectStep(stepNumber: 3, title: '展示天气', description: '用Container画天气卡片', codeSnippet: 'Container(decoration: BoxDecoration(gradient: ...), child: Column(...))'),
  ],
  sourceCode: '''
import 'package:flutter/material.dart';
void main() => runApp(WeatherApp());
class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: WeatherScreen());
}
class Weather { String city; int temp; String weather; int humidity; Weather(this.city, this.temp, this.weather, this.humidity); }
class FutureWeather { String day; String weather; int high; int low; FutureWeather(this.day, this.weather, this.high, this.low); }
class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}
class _WeatherScreenState extends State<WeatherScreen> {
  Weather? w = Weather('北京', 26, '晴', 45);
  List<FutureWeather> future = [FutureWeather('明天','多云',28,18),FutureWeather('后天','晴',30,20),FutureWeather('周四','阴',25,17)];
  String _emoji(String w) => w.contains('晴')?'☀️':w.contains('多云')?'⛅':w.contains('阴')?'☁️':w.contains('雨')?'🌧️':'🌤️';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('天气预报')),
      body: SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(children: [
        Container(width:double.infinity, padding:EdgeInsets.all(24), decoration:BoxDecoration(gradient:LinearGradient(colors:[Colors.blue[400]!,Colors.blue[600]!]), borderRadius:BorderRadius.circular(16)), child: Column(children: [
          Text(w!.city, style:TextStyle(color:Colors.white, fontSize:24)),
          SizedBox(height:16),
          Text(_emoji(w!.weather), style:TextStyle(fontSize:64)),
          Text('\$w.temp°C', style:TextStyle(color:Colors.white, fontSize:48, fontWeight:FontWeight.bold)),
          Text(w!.weather, style:TextStyle(color:Colors.white, fontSize:18)),
          SizedBox(height:16),
          Row(mainAxisAlignment:MainAxisAlignment.spaceAround, children: [Column(children:[Icon(Icons.water_drop, color:Colors.white70), Text('湿度',style:TextStyle(color:Colors.white70,fontSize:12)), Text('\$w.humidity%',style:TextStyle(color:Colors.white))]), Column(children:[Icon(Icons.air, color:Colors.white70), Text('风力',style:TextStyle(color:Colors.white70,fontSize:12)), Text('3级',style:TextStyle(color:Colors.white))])]),
        ])),
        SizedBox(height:24),
        Text('未来天气预报', style:TextStyle(fontSize:16, fontWeight:FontWeight.bold)),
        SizedBox(height:12),
        ...future.map((f)=>Card(margin:EdgeInsets.only(bottom:8), child:Padding(padding:EdgeInsets.all(16), child:Row(children:[Text(f.day,style:TextStyle(fontWeight:FontWeight.bold)), SizedBox(width:16), Text(_emoji(f.weather),style:TextStyle(fontSize:24)), SizedBox(width:16), Expanded(child:Text(f.weather)), Text('\$f.high° / \$f.low°',style:TextStyle(color:Colors.grey))])))).toList(),
      ])),
    );
  }
}
''',
  codeExplanation: 'async/await处理异步数据，setState更新UI',
  customizableParts: ['接入真实API', '城市搜索', '更多天气指数'],
);

// 所有项目列表
class AllProjects {
  static final List<ProjectModel> all = [
    calculatorProject,
    todoProject,
    guessNumberProject,
    notepadProject,
    profileCardProject,
    productListProject,
    shoppingCartProject,
    orderManagerProject,
    salesStatsProject,
    cityPickerProject,
    weatherAppProject,
  ];

  static ProjectModel? getById(String id) {
    try {
      return all.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}

