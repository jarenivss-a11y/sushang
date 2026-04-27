// ============================================================
// 【常见问答数据文件】
// 作用：存储零基础小白常见问题和通俗易懂的答案
// 分类：环境配置、代码报错、Claude Code使用
// ============================================================

class QAModel {
  final String question;      // 问题
  final String answer;       // 答案
  final String category;      // 分类

  QAModel({
    required this.question,
    required this.answer,
    required this.category,
  });
}

// 环境配置类问答
final List<QAModel> environmentQA = [
  QAModel(
    question: '怎么安装Flutter？',
    answer: '''
安装Flutter其实很简单，按步骤来就行：

第一步：下载Flutter
1. 打开浏览器，访问 flutter.dev/download-windows
2. 点击"Download Flutter SDK"按钮
3. 等待下载完成（文件约2GB）

第二步：解压Flutter
1. 找到下载的zip文件
2. 右键 → "全部解压缩"
3. 选择一个位置（比如桌面）

第三步：配置环境变量
1. 按 Windows键 + R
2. 输入 sysdm.cpl 回车
3. 点击"高级" → "环境变量"
4. 在"系统变量"中找到"Path"，双击
5. 点击"新建"，输入 Flutter解压路径\\bin
   比如：C:\\Users\\你的名字\\Desktop\\flutter\\bin
6. 点击确定

第四步：验证安装
1. 打开"命令提示符"
2. 输入 flutter --version
3. 如果显示版本号，说明安装成功了！

如果遇到问题，别慌，在群里问或者问AI助手。
''',
    category: '环境配置',
  ),
  QAModel(
    question: 'Flutter和Dart是什么关系？',
    answer: '''
Flutter和Dart的关系就像：

- Flutter 是"做蛋糕的整体方案"（工具和方法）
- Dart 是"做蛋糕的配方"（编程语言）

简单说：
- Dart 是代码语言，就像英语是一种语言一样
- Flutter 是用Dart语言来做手机App的"工具箱"

你写代码的时候：
1. 用Dart语言写代码
2. 用Flutter的"工具"来把代码变成手机App

所以你学的是：
- Dart语法（怎么写）
- Flutter组件（用什么来组装App）

两者都要学，但不用分开学，边做边学就行！
''',
    category: '环境配置',
  ),
  QAModel(
    question: 'VSCode怎么打开Flutter项目？',
    answer: '''
用VSCode打开Flutter项目很简单：

方法一：用命令
1. 打开命令提示符（Windows+R，输入cmd）
2. 进入你的项目文件夹：cd 你的项目路径
3. 输入：code .
4. VSCode会自动打开

方法二：直接用VSCode
1. 打开VSCode
2. 点击左上角"文件" → "打开文件夹"
3. 找到你的项目文件夹，点击"选择文件夹"

打开后你会看到：
- 左边是文件列表
- 找到 lib/main.dart 就是主要代码文件
''',
    category: '环境配置',
  ),
  QAModel(
    question: 'flutter run 是什么意思？',
    answer: '''
flutter run 是一个"运行命令"。

意思是：让Flutter启动你的App

当你输入这个命令后：
1. Flutter会编译（翻译）你的代码
2. 编译成功后，会自动在手机或模拟器上运行

不同的运行方式：
- flutter run          → 运行App
- flutter run -d chrome → 在Chrome浏览器运行
- flutter build apk     → 打包成安卓安装包

刚开始学，只需要记住 flutter run 就够了！
''',
    category: '环境配置',
  ),
  QAModel(
    question: '手机怎么连接电脑开发？',
    answer: '''
让手机和电脑连接一起开发，有两种方式：

方式一：USB连接（推荐新手）
1. 用USB线把手机连到电脑
2. 手机上打开"开发者模式"
   （设置 → 关于手机 → 连续点击"版本号"7次）
3. 手机上启用"USB调试"
4. 电脑上运行 flutter devices 看看能不能找到手机
5. 然后 flutter run 就能在手机上运行了

方式二：模拟器
1. 电脑上安装安卓模拟器（比如夜神模拟器）
2. 打开模拟器
3. 运行 flutter run

新手推荐用USB线直连，真机测试更准确！
''',
    category: '环境配置',
  ),
];

// 代码报错类问答
final List<QAModel> errorQA = [
  QAModel(
    question: '代码有红色波浪线是什么意思？',
    answer: '''
红色波浪线 = 代码有错误！

这就像写作文时老师用红笔划出的错误一样。

常见原因：
1. 拼写错误
   比如：print 写成了 prnt

2. 缺少符号
   比如：引号、括号、分号没写

3. 用了没定义的东西
   比如：用了一个没创建的变量

怎么看错误信息：
- 把鼠标放在红色波浪线上
- 会显示"错误原因"
- 根据提示修改就好

红色波浪线是朋友，不是敌人！它在帮你找到问题。
''',
    category: '代码报错',
  ),
  QAModel(
    question: '运行后显示红色错误页面怎么办？',
    answer: '''
运行时出现红色错误页面，叫做"崩溃了"。

别慌，按以下步骤排查：

第一步：看错误信息
- 错误信息会显示在命令行窗口（黑色的窗口）
- 找到"Exception"或"Error"开头的行

第二步：复制错误信息
- 选中错误信息，复制
- 可以发给AI助手问："我的代码报这个错，怎么解决？"

第三步：常见错误和解决方法

1. 缺少包
   错误：Undefined name 'xxx'
   解决：运行 flutter pub get

2. 空数据
   错误：Null check operator used on a null value
   解决：检查是不是用了空变量的值

3. 索引越界
   错误：RangeError
   解决：检查列表访问的索引是否超过范围

记住：报错是正常的，每个程序员都会遇到！
''',
    category: '代码报错',
  ),
  QAModel(
    question: '为什么按钮点击没反应？',
    answer: '''
按钮点击没反应，通常是以下几个原因：

原因1：忘记写 onPressed
```dart
// 错误：没有写点击处理
ElevatedButton(
  child: Text('点我'),
)

// 正确：写了onPressed
ElevatedButton(
  onPressed: () {
    print('点击了！');
  },
  child: Text('点我'),
)
```

原因2：onPressed写了但没更新界面
```dart
// 错误：没有调用setState
onPressed: () {
  count++;  // 数据变了，但界面没更新
}

// 正确：用setState更新
onPressed: () {
  setState(() {
    count++;
  });
}
```

原因3：按钮被其他东西挡住了
- 检查是否有其他组件覆盖了按钮
- 用Container或Padding调整位置

检查清单：
1. onPressed 有没有写？
2. 需要更新的数据有没有用 setState？
3. 按钮有没有被挡住？
''',
    category: '代码报错',
  ),
  QAModel(
    question: '变量下面有红线是什么问题？',
    answer: '''
变量下面有红线，通常是：

问题1：变量没初始化
```dart
// 错误
String name;  // 没给值

// 正确
String name = '小明';  // 给个初始值
```

问题2：变量类型不匹配
```dart
// 错误
int age = '18';  // age是数字，不能放文字

// 正确
int age = 18;    // 数字不用引号
```

问题3：用了未定义的变量
```dart
// 错误：userName没定义过
print(userName);

// 正确：先定义
var userName = '小明';
print(userName);
```

解决方法：
1. 仔细看错误提示
2. 鼠标移到红线上，看提示
3. 根据提示修改

如果实在看不出来，把代码发给AI助手，让它帮你找问题！
''',
    category: '代码报错',
  ),
];

// Claude Code使用类问答
final List<QAModel> claudeQA = [
  QAModel(
    question: '怎么给Claude发消息让它写代码？',
    answer: '''
给Claude发消息很简单，就像和朋友聊天一样！

但是要让它听懂你，你需要：
1. 说清楚你要什么
2. 说明用什么技术
3. 说明具体要求

好例子：
"请用Flutter帮我做一个计算器App，要有0-9数字键，加减乘除运算键，等号键和清除键，代码要带详细中文注释，因为我是零基础学习者"

不好的例子：
"帮我写个计算器"
"做个App"

越清楚的要求，越能得到你想要的结果！

记住这个模板：
```
我要：生成/修改/调试代码
技术：Flutter/Dart
功能：具体要什么
其他：注释/简单易懂等
```
''',
    category: 'Claude Code使用',
  ),
  QAModel(
    question: 'Claude给的代码怎么用？',
    answer: '''
Claude给的代码用起来很简单：

第一步：复制代码
1. 全选Claude给的代码（通常有高亮背景）
2. 复制（Ctrl+C）

第二步：粘贴到项目
1. 打开你的Flutter项目
2. 找到对应的文件（Claude通常会说明是哪个文件）
3. 粘贴（Ctrl+V）到文件里

第三步：保存并运行
1. 保存（Ctrl+S）
2. 如果提示缺少包，运行 flutter pub get
3. 运行 flutter run

第四步：看效果
- 如果是你想要的，恭喜你！
- 如果不是，把问题再发给Claude，让它修改

遇到问题不要慌，把错误信息发给Claude，它会帮你修！
''',
    category: 'Claude Code使用',
  ),
  QAModel(
    question: 'Claude写的代码报错了怎么办？',
    answer: '''
Claude写的代码报错很常见，别慌！

解决方法：

第一步：复制错误信息
- 运行后看命令行窗口
- 找到Exception或Error那几行
- 全部复制

第二步：发给Claude
- 把错误信息发给Claude
- 说明"这个代码报错了，请帮我修"

第三步：复制修复后的代码
- Claude会给你修复后的代码
- 替换原来的代码
- 重新运行

模板：
```
我的代码报错了，错误信息是：
[粘贴错误信息]

请帮我看看哪里错了，怎么修改。
```

Claude很擅长修bug，多试几次就好了！
''',
    category: 'Claude Code使用',
  ),
  QAModel(
    question: '怎么让Claude用中文回答？',
    answer: '''
让Claude用中文回答很简单：

在提示词开头加一句：
"请用中文回答" 或 "请用中文解释"

例子：
"请用Flutter写一个计算器，用中文回答，请给代码加上中文注释"

这样Claude就会：
- 用中文回复
- 代码注释用中文
- 解释也用中文

对于零基础学习者，一定要让AI用中文回答，不然可能看不懂！
''',
    category: 'Claude Code使用',
  ),
  QAModel(
    question: 'Claude给的代码太复杂看不懂怎么办？',
    answer: '''
看不懂Claude给的代码？很正常！

解决方法：

方法1：让它简化
发给Claude：
"这段代码太复杂了，我是零基础，请帮我简化成最简单的版本，加上详细的中文注释"

方法2：让它分段解释
发给Claude：
"请帮我解释这段代码，每一行都解释一下，用通俗易懂的话"

方法3：让它一步步给
发给Claude：
"我需要做一个计算器，请一步步给我代码，先给我界面部分的代码，解释清楚后再给下一步"

记住：
- 你可以问任何问题
- 不懂就问，它不会烦的
- 问得越具体，回答越有用
''',
    category: 'Claude Code使用',
  ),
];

// 全部问答数据
class AllQA {
  static List<QAModel> get all => [
        ...environmentQA,
        ...errorQA,
        ...claudeQA,
      ];

  static List<QAModel> getByCategory(String category) {
    return all.where((qa) => qa.category == category).toList();
  }

  static List<String> get categories => ['环境配置', '代码报错', 'Claude Code使用'];
}
