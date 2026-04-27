// ============================================================
// 【课程数据文件】
// 作用：存储所有课程内容，包含4个阶段的系统学习路线
// 特点：使用通俗易懂的语言，没有专业术语
// ============================================================

import '../models/course_model.dart';

// 阶段1：编程入门 - 用最通俗的话讲解编程基础
final List<CourseModel> stage1Courses = [
  CourseModel(
    id: 's1c1',
    stageId: 'stage1',
    title: '什么是代码？',
    subtitle: '认识编程的第一步',
    description: '用买奶茶的例子，告诉你代码到底是什么',
    difficulty: 1,
    content: '''
# 这一课我们来解决一个问题：代码到底是什么？

## 打个比方

想象你去奶茶店点奶茶。

你告诉店员："我要一杯珍珠奶茶，少冰少糖。"

店员听到你的话，然后去做奶茶，最后把做好的奶茶递给你。

## 代码就是"和电脑说话的语言"

代码就像上面这个例子：
- 你说的话 = 代码（告诉电脑要做什么）
- 店员 = 电脑（听懂你的话并执行）
- 做好的奶茶 = 结果（电脑执行完任务给你的东西）

## 代码长什么样？

代码看起来像这样（别担心，现在看不懂是正常的）：

```
print("Hello World")
```

这句话的意思是："电脑你好，请显示'Hello World'这串文字"

## 记住一件事

代码就是**告诉电脑要做什么**的语言。

就像你告诉店员要做什么奶茶一样，只是换成了电脑能听懂的话。

## 小练习

想一想：
1. 你每天用手机点外卖，其实是谁在帮你"说话"给餐厅听？
2. 代码和平时说话，有什么一样和不一样的地方？

下一课我们会教你写出第一行代码！
''',
    codeExample: null,
    codeExplanation: null,
  ),
  CourseModel(
    id: 's1c2',
    stageId: 'stage1',
    title: '写出第一行代码',
    subtitle: 'Hello World',
    description: '教你写出人生第一个程序，显示"Hello World"',
    difficulty: 1,
    content: '''
# 这一课教你写出人生第一行代码！

## 准备工作

跟着做之前，你需要：
1. 电脑上安装了Flutter（不知道怎么装？看新手入门指南）
2. 创建好了一个Flutter项目（叫它"我的第一个App"）

## 第一步：找到代码文件

1. 打开VSCode（就是那个写代码的软件）
2. 打开你的项目文件夹
3. 找到 lib/main.dart 这个文件
4. 双击打开它

## 第二步：看清楚代码

打开后，你会看到很多代码，现在别管它们是什么意思。

找到这行（或者类似的一行）：
```
print('Hello World');
```

## 第三步：改成你想说的话

把 Hello World 改成任何你想说的话，比如：

```
print('你好，世界！');
```

或者

```
print('我是小白，我开始学编程了！');
```

## 第四步：保存和运行

1. 按 Ctrl + S 保存文件
2. 按 Shift + F5 运行程序
3. 看着屏幕上的结果！

## 恭喜你！

你刚刚写出了人生第一个程序！虽然只是显示一句话，但这说明你已经迈出了编程的第一步！

## 发生了什么？

- print() 是一个"打印命令"，告诉电脑在屏幕上显示文字
- 引号里面的内容会原样显示出来
- 分号 ; 表示这句话说完了

记住这个格式，以后会经常用到：
```
print('这里写你想显示的内容');
```
''',
    codeExample: '''
// 这是第一个Flutter程序
// 作用：在屏幕上显示文字

import 'package:flutter/material.dart';

void main() {
  // runApp 是启动Flutter应用的意思
  runApp(const MyApp());
}

// MyApp 是一个自定义的组件（可以理解为一个页面）
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的第一个App',
      home: Scaffold(
        body: Center(
          child: Text('Hello World'), // 这里就是显示的文字
        ),
      ),
    );
  }
}''',
    codeExplanation: '''
这端代码解释：

1. import 'package:flutter/material.dart';
   意思是"引入Flutter的材料设计库"，就像打开工具箱一样

2. void main()
   这是程序的"入口"，程序从这里开始执行

3. runApp(const MyApp());
   告诉Flutter："启动这个应用"

4. class MyApp extends StatelessWidget
   定义了一个叫MyApp的组件（页面）

5. Widget build(BuildContext context)
   这个方法是用来"画"页面的

6. return MaterialApp(...)
   返回一个Material风格的应用

7. Scaffold(body: Center(child: Text('Hello World')))
   Scaffold是页面脚手架
   Center是"居中"
   Text是"文字"
''',
  ),
  CourseModel(
    id: 's1c3',
    stageId: 'stage1',
    title: '认识变量 - 像盒子一样存东西',
    subtitle: '编程的基本存储',
    description: '用收纳盒做比喻，告诉你什么是变量',
    difficulty: 1,
    content: '''
# 这一课讲的是：变量是什么？

## 变量是什么？

想象你有很多收纳盒。

每个盒子上贴一个标签（名字），里面可以放东西。

变量就是这个原理：
- 盒子 = 变量（存储数据的地方）
- 标签 = 变量名（给数据起的名字）
- 里面的东西 = 变量的值（实际保存的数据）

## 代码里的变量

看这行代码：

```
var name = '小明';
```

这行代码的意思是：
- var = 我要创建一个盒子
- name = 盒子的名字叫"name"
- = '小明' = 盒子里放的是"小明"这个文字

## 常见的"盒子类型"

### 1. 文字盒（String）
放文字的盒子
```
var name = '小明';
var city = '北京';
```

### 2. 数字盒（int/double）
放数字的盒子
```
var age = 18;        // 整数
var height = 1.75;   // 小数
```

### 3. 是非盒（bool）
放"对"或"错"的盒子
```
var isStudent = true;   // 是学生
var isMarried = false; // 没结婚
```

## 怎么用变量？

创建变量后，可以在别的地方使用：

```
var name = '小明';
print(name);      // 会显示：小明
print('你好，' + name);  // 会显示：你好，小明
```

## 小技巧

起名字要有意义：
- ✅ var name = '小明';   // 好名字，一看就知道是名字
- ❌ var x = '小明';       // 坏名字，不知道x是什么

下一课我们学习用变量做计算！
''',
    codeExample: '''
// 变量示例代码

void main() {
  // ===== 文字变量 =====
  var name = '小明';
  var city = '北京';

  print('我叫\$name');
  print('我住在\$city');

  // ===== 数字变量 =====
  var age = 18;
  var height = 1.75;

  print('我今年\$age岁');
  print('我身高\$height米');

  // ===== 修改变量的值 =====
  age = 19;  // 生日到了，变大一岁
  print('明年我就\$age岁了');

  // ===== 计算 =====
  var price = 50;
  var quantity = 3;
  var total = price * quantity;  // 50 * 3 = 150
  print('总价是：\$total元');
}''',
    codeExplanation: '''
代码解释：

1. var name = '小明';
   创建了一个叫name的变量，里面放的是"小明"
   var 是"变量"的意思，Dart语言的语法

2. print('我叫\$name');
   \$name 是"插值"，意思是把name变量的值插入到文字里
   运行结果会是：我叫小明

3. age = 19;
   直接给变量赋新值，会覆盖原来的值

4. var total = price * quantity;
   可以对数字变量进行数学运算
   * 是乘法，还有 + - / 等
''',
  ),
  CourseModel(
    id: 's1c4',
    stageId: 'stage1',
    title: '简单运算 - 计算器怎么工作',
    subtitle: '数学运算入门',
    description: '学会加减乘除，让你的App会算数学',
    difficulty: 1,
    content: '''
# 这一课学的是：怎么让电脑做数学题

## 基本运算

电脑最擅长的就是计算，我们来学学基本的数学运算：

| 符号 | 名字 | 例子 | 结果 |
|------|------|------|------|
| + | 加 | 5 + 3 | 8 |
| - | 减 | 5 - 3 | 2 |
| * | 乘 | 5 * 3 | 15 |
| / | 除 | 6 / 3 | 2 |
| % | 取余 | 7 % 3 | 1 |

## 在代码里用运算

### 简单计算
```
var a = 10;
var b = 3;

print(a + b);   // 加法：13
print(a - b);   // 减法：7
print(a * b);   // 乘法：30
print(a / b);   // 除法：3.33...
```

### 取整数（整除）
有时候我们不想要小数部分：
```
print(a ~/ b);  // 整除：3
```

### 取余数（取模）
看看一个数除以另一个数还剩多少：
```
print(a % b);  // 余数：1  （10除以3等于3余1）
```

## 复合赋值运算

有时候我们需要先算再存：

| 写法 | 等价于 | 意思 |
|------|--------|------|
| a += 5 | a = a + 5 | a加5 |
| a -= 5 | a = a - 5 | a减5 |
| a *= 5 | a = a * 5 | a乘5 |
| a /= 5 | a = a / 5 | a除5 |

### 例子：累计加分
```
var score = 0;     // 初始分数0分
score += 10;       // 加10分
score += 20;       // 再加20分
print(score);      // 显示：30
```

## 自增自减

这是一个常用的小技巧：

| 写法 | 等价于 | 意思 |
|------|--------|------|
| a++ | a = a + 1 | a加1 |
| a-- | a = a - 1 | a减1 |

## 小练习

假设你要做一个计算器：
1. 用户输入两个数字
2. 显示出相加、相减、相乘、相除的结果

你能想象代码怎么写吗？

下一课我们学习"条件判断"——让电脑做选择！
''',
    codeExample: '''
// 计算器核心代码示例

void main() {
  // 定义两个数字
  var num1 = 10;
  var num2 = 3;

  // 加法
  var sum = num1 + num2;
  print('\$num1 + \$num2 = \$sum');

  // 减法
  var difference = num1 - num2;
  print('\$num1 - \$num2 = \$difference');

  // 乘法
  var product = num1 * num2;
  print('\$num1 * \$num2 = \$product');

  // 除法
  var quotient = num1 / num2;
  print('\$num1 / \$num2 = \$quotient');

  // 整除（不要小数部分）
  var integerQuotient = num1 ~/ num2;
  print('\$num1 整除 \$num2 = \$integerQuotient');

  // 取余（除法剩下的部分）
  var remainder = num1 % num2;
  print('\$num1 除以 \$num2 的余数 = \$remainder');
}''',
    codeExplanation: '''
代码解释：

1. var sum = num1 + num2;
   把num1和num2相加的结果存入sum变量

2. ~/ 是整除运算符
   7 ~/ 3 = 2（不要小数部分）

3. % 是取余（取模）运算符
   7 % 3 = 1（7除以3等于2余1）

4. print('...\$sum...');
   使用 \$ 进行字符串插值，把变量值插入文字中
''',
  ),
  CourseModel(
    id: 's1c5',
    stageId: 'stage1',
    title: '条件判断 - 如果...就...',
    subtitle: '让电脑做选择',
    description: '学会if语句，让你的程序会"思考"',
    difficulty: 1,
    content: '''
# 这一课学的是：让电脑做选择

## 生活中的"如果...就..."

想想你每天是怎么做决定的：

- 如果 明天不下雨，就 去公园
- 如果 考试考得好，就 买玩具
- 如果 饿了，就 吃东西

这就是"条件判断"——根据情况做不同的事。

## 代码里的条件判断

### 最简单的：如果...就

```
if (条件) {
  做这件事;
}
```

例子：
```
var score = 85;

if (score >= 60) {
  print('及格了！');
}
```

解释：
- score >= 60 是一个"条件"，电脑会判断它是对还是错
- >= 的意思是"大于等于"
- 如果条件是对的，就执行大括号里的代码

### 如果...否则...

```
if (条件) {
  做这件事;
} else {
  做那件事;
}
```

例子：
```
var score = 45;

if (score >= 60) {
  print('及格了！');
} else {
  print('不及格，要加油！');
}
```

### 如果...否则如果...否则

```
if (条件1) {
  情况1;
} else if (条件2) {
  情况2;
} else {
  其他情况;
}
```

例子（成绩评级）：
```
var score = 85;

if (score >= 90) {
  print('优秀');
} else if (score >= 80) {
  print('良好');
} else if (score >= 60) {
  print('及格');
} else {
  print('不及格');
}
```

## 常见比较符号

| 符号 | 意思 | 例子 |
|------|------|------|
| == | 等于 | a == b（a等于b）|
| != | 不等于 | a != b（a不等于b）|
| > | 大于 | a > b（a大于b）|
| < | 小于 | a < b（a小于b）|
| >= | 大于等于 | a >= b |
| <= | 小于等于 | a <= b |

## 小练习

试着写一个判断年龄的程序：
- 如果年龄 >= 18，显示"成年了"
- 否则显示"还是小朋友"

下一课我们学习"循环"——让电脑重复做事情！
''',
    codeExample: '''
// 条件判断示例代码

void main() {
  // 考试成绩判断
  var score = 85;

  if (score >= 90) {
    print('成绩：\$score - 等级：优秀 🎉');
  } else if (score >= 80) {
    print('成绩：\$score - 等级：良好 👍');
  } else if (score >= 60) {
    print('成绩：\$score - 等级：及格 📚');
  } else {
    print('成绩：\$score - 等级：不及格 💪');
  }

  print('');  // 空一行

  // 年龄判断
  var age = 16;

  if (age >= 18) {
    print('年龄：\$age - 你已经成年了！');
  } else {
    print('年龄：\$age - 你还是未成年人');
    print('再等\${18 - age}年就成年了');
  }
}''',
    codeExplanation: '''
代码解释：

1. if (score >= 90) { ... }
   如果score大于等于90，就执行第一个大括号里的代码

2. else if (score >= 80) { ... }
   如果上面条件不满足，但score大于等于80，就执行这个

3. else { ... }
   如果所有条件都不满足，就执行else里的代码

4. \${18 - age}
   在字符串里进行计算，18 - age

注意：判断相等要用 == （两个等号）
      一个等号 = 是"赋值"，意思是"把右边的值给左边"
''',
  ),
];

// 阶段2：基础代码练习
final List<CourseModel> stage2Courses = [
  CourseModel(
    id: 's2c1',
    stageId: 'stage2',
    title: '字符串处理 - 操作文字',
    subtitle: '文字操作入门',
    description: '学会拼接、截取、替换文字',
    difficulty: 2,
    content: '''
# 这一课学的是：怎么处理文字

## 字符串是什么？

在编程里，"文字"有个专门的名字叫"字符串"。

可以理解为：用引号包起来的一串字符。

```
var name = '小明';        // 这是字符串
var message = "你好";     // 这也是字符串
var empty = '';           // 空字符串（什么都没有）
```

## 字符串的常用操作

### 1. 拼接（把两段文字连在一起）

```
var firstName = '张';
var lastName = '三';
var fullName = firstName + lastName;
print(fullName);  // 显示：张三

// 更简单的方法
var name = '张' '三';  // 直接拼接
```

### 2. 插值（在文字里嵌入变量）

```
var name = '小明';
var age = 18;
print('我叫\$name，今年\$age岁');
// 显示：我叫小明，今年18岁
```

### 3. 获取长度

```
var text = 'Hello';
print(text.length);  // 显示：5
```

### 4. 转大小写

```
var text = 'Hello';
print(text.toUpperCase());  // HELLO（大写）
print(text.toLowerCase());  // hello（小写）
```

## 下一课预告

下节课我们学习"列表"——怎么存储很多数据！
''',
    codeExample: '''
// 字符串处理示例

void main() {
  // 1. 拼接字符串
  var greeting = '你好' + '世界';
  print('拼接：\$greeting');

  // 2. 字符串插值
  var name = '小明';
  var city = '北京';
  print('我叫\$name，来自\$city');

  // 3. 获取字符串长度
  var word = 'Flutter';
  print('"\$word"的长度是：\${word.length}');

  // 4. 转大小写
  var text = 'Hello World';
  print('大写：\${text.toUpperCase()}');
  print('小写：\${text.toLowerCase()}');

  // 5. 判断是否包含某个文字
  var email = 'test@example.com';
  if (email.contains('@')) {
    print('这是一个邮箱格式');
  }
}''',
    codeExplanation: '''
代码解释：

1. '你好' + '世界'
   用 + 号可以把两个字符串连接成一个

2. \$name
   \$ 符号可以插入变量值到字符串中

3. \${word.length}
   \${} 里面可以写表达式

4. text.toUpperCase()
   toUpperCase() 是一个方法，意思是"转换为大写"

5. email.contains('@')
   contains() 是检查字符串是否包含某个内容
''',
  ),
  CourseModel(
    id: 's2c2',
    stageId: 'stage2',
    title: '列表使用 - 存储多个数据',
    subtitle: '数据集合入门',
    description: '学会用列表存储和操作多个数据',
    difficulty: 2,
    content: '''
# 这一课学的是：怎么存储很多数据

## 列表是什么？

想象你有一个书包，里面可以放多本书。

编程里的"列表"就是这个原理——一个变量可以存很多个数据。

## 创建列表

### 创建空列表
```
var emptyList = [];           // 方式1
var anotherEmpty = List();    // 方式2
```

### 创建有内容的列表
```
var numbers = [1, 2, 3, 4, 5];       // 数字列表
var names = ['小明', '小红', '小李']; // 文字列表
var mixed = [1, '你好', true, 3.14]; // 混合格（不推荐）
```

## 访问列表元素

每个元素都有一个位置编号，叫做"索引"。

**注意：从0开始数！**

```
var fruits = ['苹果', '香蕉', '橙子'];

// 获取第1个元素（索引是0）
print(fruits[0]);  // 苹果

// 获取第2个元素（索引是1）
print(fruits[1]);  // 香蕉

// 获取第3个元素（索引是2）
print(fruits[2]);  // 橙子
```

## 常用操作

### 添加元素
```
var list = [1, 2, 3];
list.add(4);        // 在最后添加一个
list.insert(0, 0);  // 在开头插入一个
print(list);        // [1, 2, 3, 4] 或 [0, 1, 2, 3, 4]
```

### 删除元素
```
var list = [1, 2, 3, 4];
list.remove(3);      // 删除值为3的元素
list.removeAt(0);    // 删除索引为0的元素
print(list);        // [2, 4] 或 [2, 3, 4]
```

### 获取长度
```
var list = [1, 2, 3];
print(list.length);  // 3
```

## 遍历列表（一个个处理）

### 方法1：for循环
```
var numbers = [1, 2, 3];
for (var i = 0; i < numbers.length; i++) {
  print(numbers[i]);
}
```

### 方法2：forEach（更简单）
```
var numbers = [1, 2, 3];
for (var number in numbers) {
  print(number);
}
```

下一课我们学习"循环"——让代码重复执行！
''',
    codeExample: '''
// 列表使用示例

void main() {
  // 创建列表
  var fruits = ['苹果', '香蕉', '橙子', '葡萄'];

  // 访问元素（索引从0开始！）
  print('第一个水果：\${fruits[0]}');
  print('第二个水果：\${fruits[1]}');

  // 获取列表长度
  print('水果数量：\${fruits.length}');

  // 添加元素
  fruits.add('草莓');
  print('添加后：\$fruits');

  // 删除元素
  fruits.remove('香蕉');
  print('删除后：\$fruits');

  // 遍历列表
  print('\\n所有水果：');
  for (var fruit in fruits) {
    print('- \$fruit');
  }

  // 查找元素
  if (fruits.contains('橙子')) {
    print('找到了橙子！');
  }
}''',
    codeExplanation: '''
代码解释：

1. var fruits = ['苹果', '香蕉', '橙子'];
   用方括号创建一个列表，里面放文字

2. fruits[0]
   用中括号和索引访问列表元素
   注意：第一个元素的索引是0，不是1！

3. fruits.add('草莓')
   add() 方法在列表末尾添加一个元素

4. fruits.remove('香蕉')
   remove() 方法删除指定值的元素

5. for (var fruit in fruits) { ... }
   for-in 循环：依次把每个元素拿出来处理
''',
  ),
  CourseModel(
    id: 's2c3',
    stageId: 'stage2',
    title: '循环操作 - 重复做一样的事',
    subtitle: '循环结构入门',
    description: '学会用循环让电脑重复执行任务',
    difficulty: 2,
    content: '''
# 这一课学的是：怎么让电脑重复做事情

## 为什么要用循环？

想象你要：
- 显示1到100的数字
- 给100个用户发邮件
- 计算100个同学的成绩

一个个写会累死！循环就是来解决这个问题的。

## for循环 - 知道要循环多少次

### 基础用法
```
for (var i = 1; i <= 5; i++) {
  print(i);
}
```
结果：显示1、2、3、4、5

解释：
- var i = 1 ：从1开始数
- i <= 5 ：数到5为止
- i++ ：每次加1

### 用在列表上
```
var fruits = ['苹果', '香蕉', '橙子'];
for (var i = 0; i < fruits.length; i++) {
  print(fruits[i]);
}
```

## while循环 - 不知道要循环多少次

当你不确定要循环多少次，只知道什么时候停下来：

```
var i = 1;
while (i <= 5) {
  print(i);
  i++;
}
```
结果：显示1、2、3、4、5

## break和continue

### break - 提前结束循环
```
for (var i = 1; i <= 10; i++) {
  if (i == 6) {
    break;  // 遇到6就停下来，不显示6
  }
  print(i);
}
// 显示：1、2、3、4、5
```

### continue - 跳过这一次
```
for (var i = 1; i <= 5; i++) {
  if (i == 3) {
    continue;  // 遇到3就跳过，继续下一个
  }
  print(i);
}
// 显示：1、2、4、5（没有3）
```

## 小练习

试着写一个程序：
1. 计算1+2+3+...+100的和
2. 找出1到50中所有的偶数

下一课我们学习"函数"——把常用代码打包！
''',
    codeExample: '''
// 循环示例代码

void main() {
  // for循环：显示1到10
  print('=== for循环 ===');
  for (var i = 1; i <= 10; i++) {
    print(i);
  }

  // while循环：计算累加
  print('\\n=== while循环 ===');
  var sum = 0;
  var i = 1;
  while (i <= 100) {
    sum += i;  // sum = sum + i
    i++;
  }
  print('1+2+3+...+100 = \$sum');

  // 遍历列表
  print('\\n=== 遍历列表 ===');
  var fruits = ['苹果', '香蕉', '橙子', '葡萄'];
  for (var fruit in fruits) {
    print('我喜欢吃 \$fruit');
  }

  // break：找到第一个满足条件的就停
  print('\\n=== break示例 ===');
  for (var n = 1; n <= 10; n++) {
    if (n == 6) {
      print('找到6了，停止！');
      break;
    }
    print(n);
  }
}''',
    codeExplanation: '''
代码解释：

1. for (var i = 1; i <= 10; i++)
   - 初始值：i = 1
   - 条件：i <= 10 时继续
   - 步进：每次循环结束 i++

2. sum += i
   等价于 sum = sum + i

3. while (i <= 100)
   当条件满足时一直循环

4. break
   立即跳出循环，不再执行

5. for (var fruit in fruits)
   依次把列表中每个元素拿出来处理
''',
  ),
  CourseModel(
    id: 's2c4',
    stageId: 'stage2',
    title: '函数入门 - 把代码打包',
    subtitle: '代码复用基础',
    description: '学会创建函数，让代码可以重复使用',
    difficulty: 2,
    content: '''
# 这一课学的是：什么是函数，怎么用函数

## 函数是什么？

函数就像一个"工具箱"。

你把一组代码放进去，给它起个名字，以后想用这组代码时，只需要叫它的名字就行了。

## 为什么需要函数？

假设你要在程序里多处计算"总价 = 单价 × 数量"：

**不用函数（重复写很多遍）：**
```
var total1 = price1 * quantity1;
var total2 = price2 * quantity2;
var total3 = price3 * quantity3;
```

**用函数（一行搞定）：**
```
int calculateTotal(int price, int quantity) {
  return price * quantity;
}

var total1 = calculateTotal(price1, quantity1);
var total2 = calculateTotal(price2, quantity2);
```

好处：
1. 少写字
2. 改一处就全改了
3. 代码更清晰

## 怎么定义函数？

### 基本格式
```
返回类型 函数名(参数) {
  函数体（要执行的代码）
  return 返回值;
}
```

### 例子
```
// 无参数无返回值
void sayHello() {
  print('你好！');
}

// 有参数无返回值
void greet(String name) {
  print('你好，\$name！');
}

// 有参数有返回值
int add(int a, int b) {
  return a + b;
}
```

## 怎么调用函数？

```
sayHello();           // 调用无参数的函数

greet('小明');         // 调用有参数的函数

var result = add(1, 2);  // 调用并获取返回值
print(result);           // 显示：3
```

## 带默认值的参数

有时候参数太多，调用时记不住顺序，可以用默认值：

```
void greet(String name, {String greeting = '你好'}) {
  print('\$greeting，\$name！');
}

greet('小明');                    // 你好，小明！
greet('小红', greeting: '早上好');  // 早上好，小红！
```

## 小练习

试着写一个函数：
- 函数名叫 calculateCircleArea（计算圆面积）
- 参数是半径 radius
- 返回值是圆的面积（π × 半径²）
- π 用 3.14

下一课我们学习做第一个简单App：计算器！
''',
    codeExample: '''
// 函数示例代码

void main() {
  // 调用有返回值的函数
  var result = add(10, 20);
  print('10 + 20 = \$result');

  // 调用无返回值的函数
  greet('小明');
  greet('小红', '早上好');

  // 使用默认参数
  printInfo('小明', age: 18);
  printInfo('小红', age: 20, city: '北京');
}

// 有返回值的函数
int add(int a, int b) {
  return a + b;
}

// 无返回值的函数
void greet(String name, [String greeting = '你好']) {
  print('\$greeting，\$name！');
}

// 使用命名参数的函数
void printInfo(String name, {int? age, String? city}) {
  print('姓名：\$name');
  if (age != null) print('年龄：\$age');
  if (city != null) print('城市：\$city');
}''',
    codeExplanation: '''
代码解释：

1. int add(int a, int b) { return a + b; }
   - int：返回值类型（整数）
   - add：函数名
   - a, b：参数

2. void greet(String name, [String greeting = '你好'])
   - void：没有返回值
   - []：可选参数，有默认值

3. {int? age, String? city}
   - {}：命名参数
   - ?：表示参数可以为空

4. return a + b;
   - return：返回计算结果
''',
  ),
];

// 阶段3：简单工具开发
final List<CourseModel> stage3Courses = [
  CourseModel(
    id: 's3c1',
    stageId: 'stage3',
    title: '计算器开发 - 界面和逻辑',
    subtitle: '第一个完整App',
    description: '动手做一个能计算加减乘除的计算器',
    difficulty: 2,
    content: '''
# 这一课我们来做第一个完整的App：计算器

## 计算器长什么样？

- 屏幕区域：显示输入的数字和计算结果
- 按钮区域：数字键(0-9)、运算键(+-×÷)、功能键(等号、清除)

## 开发步骤

### 步骤1：创建项目

```
flutter create my_calculator
cd my_calculator
code .
```

### 步骤2：编写界面代码

在 lib/main.dart 中编写：

```
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
  String display = '0';  // 屏幕上显示的内容

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的计算器')),
      body: Column(
        children: [
          // 显示区域
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(display, style: TextStyle(fontSize: 48)),
          ),
          // 按钮区域
          // ... 按钮代码 ...
        ],
      ),
    );
  }
}
```

## 下一课我们完成计算器的完整代码！
''',
    codeExample: '''
// 计算器完整代码

import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的计算器',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';      // 显示的文字
  double num1 = 0;           // 第一个数字
  String operator = '';      // 当前运算符
  bool needClear = false;    // 是否需要清空

  // 处理按钮点击
  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        // 清空
        display = '0';
        num1 = 0;
        operator = '';
      } else if ('0123456789'.contains(value)) {
        // 数字
        if (needClear || display == '0') {
          display = value;
          needClear = false;
        } else {
          display += value;
        }
      } else if ('+-×÷'.contains(value)) {
        // 运算符
        num1 = double.parse(display);
        operator = value;
        needClear = true;
      } else if (value == '=') {
        // 等号，计算结果
        double num2 = double.parse(display);
        double result = 0;
        switch (operator) {
          case '+': result = num1 + num2; break;
          case '-': result = num1 - num2; break;
          case '×': result = num1 * num2; break;
          case '÷':
            if (num2 != 0) result = num1 / num2;
            break;
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
          // 显示区域
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.bottomRight,
            child: Text(
              display,
              style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
            ),
          ),
          // 按钮区域
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
}''',
    codeExplanation: '''
代码解释：

1. StatefulWidget vs StatelessWidget
   StatefulWidget 可以"变"，能保存数据
   这里计算器需要保存输入的数字，所以用 StatefulWidget

2. String display = '0';
   保存屏幕上显示的内容

3. setState(() { ... })
   调用这个方法会重新"画"页面，让界面更新

4. double.parse(display)
   把文字转换成数字

5. GridView.count
   网格视图，crossAxisCount: 4 表示一行放4个

6. Expanded(flex: 2)
   flex:2 的按钮宽度是其他的2倍，这里让"0"按钮更宽

你可以试着修改：
- 按钮颜色
- 字体大小
- 添加更多功能（比如取余、平方）
''',
  ),
  CourseModel(
    id: 's3c2',
    stageId: 'stage3',
    title: '待办清单 - 增删改查',
    subtitle: '数据存储入门',
    description: '做一个可以添加、删除、完成待办事项的App',
    difficulty: 2,
    content: '''
# 这一课我们来做第二个App：待办清单

## 待办清单有什么用？

- 记录要做的的事情
- 做完后可以标记完成
- 可以删除不需要的事项
- 数据保存下来，关闭App再打开还在

## 需要保存的数据

每条待办包含：
- 标题（要做的事情）
- 是否完成（打勾还是没打勾）
- 创建时间

## 数据怎么保存？

用 SharedPreferences 保存数据：

```
// 保存
var prefs = await SharedPreferences.getInstance();
prefs.setStringList('todos', todos);

// 读取
var prefs = await SharedPreferences.getInstance();
var todos = prefs.getStringList('todos') ?? [];
```

## 下一课看完整代码！
''',
    codeExample: '''
// 待办清单完整代码

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
  List<String> _todos = [];       // 待办列表
  List<bool> _done = [];           // 完成状态
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();  // 打开时加载保存的数据
  }

  // 加载保存的待办
  Future<void> _loadTodos() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _todos = prefs.getStringList('todos') ?? [];
      _done = List.generate(_todos.length, (_) => false);
    });
  }

  // 保存待办
  Future<void> _saveTodos() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos);
  }

  // 添加待办
  void _addTodo() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _todos.add(_controller.text);
      _done.add(false);
      _controller.clear();
    });
    _saveTodos();
  }

  // 删除待办
  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
      _done.removeAt(index);
    });
    _saveTodos();
  }

  // 切换完成状态
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
          // 输入区域
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '输入新的待办...',
                    ),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: Text('添加'),
                ),
              ],
            ),
          ),
          // 待办列表
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
}''',
    codeExplanation: '''
代码解释：

1. StatefulWidget
   需要使用setState来更新界面，所以用StatefulWidget

2. SharedPreferences
   Flutter自带的轻量级存储，适合保存小数据

3. _loadTodos()
   在initState中调用，打开App时读取之前保存的数据

4. _saveTodos()
   每次修改数据后调用，把数据保存到本地

5. ListView.builder
   自动列表组件，会根据数据数量自动生成列表项

6. Checkbox + onChanged
   复选框组件，勾选后会调用_toggleDone改变状态

7. TextDecoration.lineThrough
   文字中间的删除线，表示已完成

可以修改的地方：
- App名称
- 主题颜色
- 添加更多功能（编辑、排序、分类）
''',
  ),
  CourseModel(
    id: 's3c3',
    stageId: 'stage3',
    title: '简易记事本 - 笔记保存',
    subtitle: '文本存储入门',
    description: '做一个可以写笔记、保存笔记、查看笔记的App',
    difficulty: 2,
    content: '''
# 这一课我们来做第三个App：简易记事本

## 记事本有什么用？

- 随手记录想法、灵感
- 写日记、备忘录
- 保存重要的文字信息
- 随时查看历史记录

## 需要实现的功能

1. 输入文字
2. 保存笔记
3. 显示笔记列表
4. 点击查看/编辑
5. 删除笔记

## 数据存储格式

每条笔记包含：
- 标题（第一行或自动生成）
- 内容
- 创建时间
- 修改时间

## 完整代码在下一页！
''',
    codeExample: '''
// 简易记事本完整代码

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(NotepadApp());
}

class NotepadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '简易记事本',
      home: NotepadScreen(),
    );
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
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  // 加载笔记
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

  // 保存笔记
  Future<void> _saveNotes() async {
    var prefs = await SharedPreferences.getInstance();
    var data = _notes.map((n) => {
      'title': n.title,
      'content': n.content,
      'time': n.time.toIso8601String(),
    }).toList();
    await prefs.setString('notes', jsonEncode(data));
  }

  // 添加笔记
  void _addNote() {
    if (_contentController.text.trim().isEmpty) return;
    var content = _contentController.text;
    var title = content.split('\\n').first;  // 第一行作为标题
    if (title.length > 20) title = title.substring(0, 20) + '...';

    setState(() {
      _notes.insert(0, Note(
        title: title,
        content: content,
        time: DateTime.now(),
      ));
      _titleController.clear();
      _contentController.clear();
    });
    _saveNotes();
    Navigator.pop(context);
  }

  // 删除笔记
  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
    _saveNotes();
  }

  // 显示添加笔记页面
  void _showAddPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('写笔记'),
          actions: [
            TextButton(
              onPressed: _addNote,
              child: Text('保存', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            controller: _contentController,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              hintText: '开始写笔记...',
              border: InputBorder.none,
            ),
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
                  subtitle: Text(
                    note.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteNote(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPage,
        child: Icon(Icons.add),
      ),
    );
  }
}''',
    codeExplanation: '''
代码解释：

1. dart:convert
   Dart内置的JSON处理库

2. Note 类
   定义笔记的数据结构

3. jsonEncode / jsonDecode
   把对象转成JSON字符串，或反过来
   用于存储复杂数据

4. ListView.builder
   根据笔记数量自动生成列表

5. TextField(maxLines: null, expands: true)
   多行文本输入框，可以无限扩展

6. FloatingActionButton
   悬浮按钮，点击打开写笔记页面

可以修改的地方：
- 笔记列表的显示样式
- 添加搜索功能
- 添加笔记分类标签
''',
  ),
];

// 阶段4：Claude Code使用教程
final List<CourseModel> stage4Courses = [
  CourseModel(
    id: 's4c1',
    stageId: 'stage4',
    title: '什么是AI编程助手',
    subtitle: '认识Claude Code',
    description: '了解AI怎么帮你写代码',
    difficulty: 1,
    content: '''
# 这一课我们来认识一个新朋友：AI编程助手

## AI编程助手是什么？

想象你有一个24小时在线的老师，这个老师：

- 懂很多很多编程知识
- 可以帮你写代码
- 可以帮你检查代码哪里错了
- 可以用你能听懂的话解释代码

这就是AI编程助手！

## 什么是Claude Code？

Claude Code就是一个AI编程助手，它是专门为了帮你学编程而设计的。

你只需要用"人话"告诉它你想做什么，它就能帮你生成代码。

## 怎么和Claude Code说话？

就像和朋友聊天一样！比如你可以说：

- "帮我写一个计算器"
- "这个代码哪里错了？"
- "帮我解释一下这段代码是什么意思"

## Claude Code能帮你做什么？

1. **生成代码**：描述你想要的功能，它帮你写
2. **解释代码**：告诉你某段代码是什么意思
3. **调试代码**：找出代码哪里错了，告诉你怎么改
4. **修改代码**：帮你添加功能或修改样式
5. **回答问题**：解答你学习编程时的问题

## 使用示例

### 例子1：让它生成代码

你说：
"我要一个计算器App，有数字键0-9，有加减乘除，有等号和清除键"

Claude会给你完整的计算器代码！

### 例子2：让它解释代码

你说：
"帮我看看这段代码是做什么的：
```
var sum = 0;
for (var i = 1; i <= 100; i++) {
  sum += i;
}
```"

Claude会告诉你：
"这段代码是计算1+2+3+...+100的和，结果是5050"

## 记住一件事

AI是帮你学习的工具，但不是万能的。

遇到问题先自己想一想，实在不会了再问AI。

自己思考 + AI辅助 = 最好的学习方式！

下一课我们学习怎么给AI发消息！
''',
    codeExample: null,
    codeExplanation: null,
  ),
  CourseModel(
    id: 's4c2',
    stageId: 'stage4',
    title: '如何写提示词',
    subtitle: '和AI沟通的技巧',
    description: '学会写清楚、高效的提示词',
    difficulty: 1,
    content: '''
# 这一课教你：怎么写能让AI听懂你要什么

## 什么是提示词？

提示词就是你说给AI听的话，就像命令一样。

提示词写得好，AI就越能给你想要的结果。

## 写提示词的基本原则

### 原则1：说清楚你要什么

❌ 模糊的说法：
"帮我写代码"

✅ 清楚的说法：
"帮我写一个计算器App，用Flutter开发，包含0-9数字键、加减乘除运算键、等号键和清除键"

### 原则2：说明在什么平台用

❌ 不说平台：
"写一个App"

✅ 说清楚平台：
"写一个Flutter App" 或 "写一个安卓App"

### 原则3：说清楚要求

可以包括：
- 功能要求（做什么）
- 界面要求（长什么样）
- 技术要求（用什么技术）
- 学习要求（要详细注释）

## 好提示词的模板

```
【我要做什么】：生成/修改/调试代码
【使用的技术】：Flutter / Dart / 其他
【功能描述】：具体要实现什么功能
【界面要求】：如果有的话，描述一下
【其他要求】：比如要详细注释、代码要简单等
```

## 例子

### 生成计算器代码

```
请用Flutter帮我生成一个简单的计算器App，要求：
1. 有数字按钮0-9
2. 有加减乘除运算
3. 有等号按钮
4. 有清除按钮
5. 代码带详细中文注释，方便我学习
```

### 调试报错代码

```
我的代码报错了，报错信息是：
[粘贴报错信息]

请帮我看看哪里错了，怎么修改。
```

### 解释代码

```
请帮我解释下面这段代码是什么意思：
[粘贴代码]

用我能听懂的话解释。
```

## 小技巧

1. **一次说清楚**：不要挤在一起，分条写
2. **说具体数字**：比如"100个"比"很多"好
3. **说你的水平**：可以说"我是零基础"，AI会调整解释方式
4. **不满意就说**：AI给你的代码不对，就说"不对，我要的是...",它会重新给你

下一课我们学习怎么复制运行AI给的代码！
''',
    codeExample: '''
好的提示词示例：

---
我要：生成一个待办清单App
技术：Flutter
功能：可以添加待办、标记完成、删除待办
界面：简单的列表，每项前面有复选框
其他：代码带注释，我要学习用
---

好的提示词应该包含：
1. 明确的目标（生成什么）
2. 技术栈（用什么做）
3. 具体功能（要什么功能）
4. 其他要求（注释、学习目的等）''',
    codeExplanation: '''
提示词越清楚，AI越能给到你想要的结果。

记住这个公式：
清晰的目标 + 具体的要求 + 你的水平 = 好的提示词
''',
  ),
  CourseModel(
    id: 's4c3',
    stageId: 'stage4',
    title: '复制粘贴运行代码',
    subtitle: '把AI的代码跑起来',
    description: '学会把AI给的代码变成能用的App',
    difficulty: 1,
    content: '''
# 这一课教你：怎么把AI给的代码变成真正的App

## 整体流程

1. 从AI复制代码
2. 粘贴到代码编辑器
3. 保存文件
4. 运行看看效果

## 具体步骤

### 步骤1：创建Flutter项目

如果还没有项目，先创建一个：

```
flutter create my_app
cd my_app
```

### 步骤2：找到要替换的文件

通常AI会告诉你代码放到哪个文件，常见的是：
- lib/main.dart （入口文件）
- lib/screen/home_screen.dart （某个页面）

### 步骤3：复制粘贴

1. 全选原有代码（Ctrl+A）
2. 删除它（Delete键）
3. 粘贴AI给的代码（Ctrl+V）

### 步骤4：保存并运行

1. 按 Ctrl + S 保存
2. 按 Shift + F5 运行
3. 等待编译完成，看效果！

## 常见问题

### 问题1：粘贴后报红线/红波浪线

原因：缺少需要的"工具"（包）

解决方法：
1. 打开终端
2. 输入：flutter pub get
3. 等待下载完成
4. 再运行

### 问题2：运行后显示一片红

原因：代码有错误

解决方法：
1. 仔细看报错信息
2. 把报错信息发给AI，让它帮你修

### 问题3：界面不是想要的样子

原因：描述不够清楚

解决方法：
1. 告诉AI你实际想要的样子
2. 让它帮你修改

## 记住

不要害怕报错！报错是正常的，每个程序员都会遇到。

遇到问题：
1. 先看报错信息
2. 试着自己理解
3. 解决不了就问AI

下一课我们学习简单调试和修改！
''',
    codeExample: '''运行代码的完整步骤：

1. 创建项目（如果还没有）
   flutter create my_project
   cd my_project

2. 打开项目文件夹
   code .

3. 找到文件
   在lib文件夹下找到main.dart

4. 替换代码
   - 全选（Ctrl+A）
   - 删除（Delete）
   - 粘贴（Ctrl+V）

5. 下载依赖（如果需要）
   flutter pub get

6. 运行
   flutter run''',
    codeExplanation: '''
记住这个顺序：
复制 → 粘贴 → 保存 → 下载依赖 → 运行

遇到问题不要慌，看报错信息，问AI！
''',
  ),
  CourseModel(
    id: 's4c4',
    stageId: 'stage4',
    title: '简单调试和修改',
    subtitle: '让代码按你的想法工作',
    description: '学会自己修改代码，改成你想要的样子',
    difficulty: 1,
    content: '''
# 这一课教你：怎么修改代码，让它变成你想要的样子

## 修改代码的基本思路

1. 先搞清楚代码哪部分是做什么的
2. 想清楚你要改成什么样
3. 小心修改，避免改错

## 常见修改类型

### 类型1：修改文字

比如把"提交"改成"发送"：

找到代码中的：
```
Text('提交')
```

改成：
```
Text('发送')
```

### 类型2：修改颜色

比如把按钮从蓝色改成红色：

找到代码中的按钮样式：
```
backgroundColor: Colors.blue
```

改成：
```
backgroundColor: Colors.red
```

### 类型3：修改数值

比如把字体大小从16改成20：

找到：
```
fontSize: 16
```

改成：
```
fontSize: 20
```

### 类型4：添加功能

比如在按钮点击时多做一个动作：

原来的代码：
```
onPressed: () {
  saveData();
},
```

改成：
```
onPressed: () {
  saveData();
  showMessage('保存成功！');  // 新增一行
},
```

## 修改的小技巧

### 技巧1：一次只改一处

❌ 一次改很多地方，容易出错
✅ 每次只改一处，改完测试，再改下一处

### 技巧2：改之前先备份

复制一份原来的代码，万一改错了可以恢复

### 技巧3：改完要测试

改了代码之后一定要运行看看效果

## 遇到不会改的怎么办？

你可以这样问AI：

```
我想把按钮颜色改成绿色，代码里怎么改？
```

```
我想在点击按钮时弹出一个提示，代码怎么写？
```

## 小练习

试试修改计算器的代码：
1. 把"="按钮从绿色改成紫色
2. 把数字按钮的字体加大
3. 把标题从"计算器"改成"我的计算器"

完成后你就迈出了"自定义代码"的第一步！

## 恭喜你完成所有课程！

你已经学会了：
- 编程基础概念
- 基础代码知识
- 简单App开发
- AI辅助编程

现在你已经有能力开始真正的编程之旅了！
继续动手做项目，你会越来越厉害！
''',
    codeExample: '''常见修改示例：

// 1. 修改文字
Text('你好') → Text('Hello')

// 2. 修改颜色
Colors.blue → Colors.red
Colors.blue[100]到[900]可以调整深浅

// 3. 修改数字
fontSize: 16 → fontSize: 20
padding: EdgeInsets.all(8) → padding: EdgeInsets.all(16)

// 4. 添加功能
onPressed: () {
  print('点击了');
  // 在这里添加更多代码
}''',
    codeExplanation: '''
记住：
- 找到要改的地方
- 想清楚要改成什么样
- 小心修改
- 改完测试

改错了不要怕，问AI！
''',
  ),
];

// 所有阶段数据汇总
class AllCourses {
  // 阶段1
  static final stage1 = StageModel(
    id: 'stage1',
    name: '阶段一：编程入门',
    description: '认识代码，了解编程是什么，学会写出第一行代码',
    courses: stage1Courses,
  );

  // 阶段2
  static final stage2 = StageModel(
    id: 'stage2',
    name: '阶段二：基础代码练习',
    description: '学习字符串、列表、循环、函数等编程基础技能',
    courses: stage2Courses,
  );

  // 阶段3
  static final stage3 = StageModel(
    id: 'stage3',
    name: '阶段三：简单工具开发',
    description: '动手做计算器、待办清单、记事本三个真实App',
    courses: stage3Courses,
  );

  // 阶段4
  static final stage4 = StageModel(
    id: 'stage4',
    name: '阶段四：Claude Code使用教程',
    description: '学会用AI辅助编程，成为真正的程序员',
    courses: stage4Courses,
  );

  // 所有阶段列表
  static final List<StageModel> allStages = [stage1, stage2, stage3, stage4];

  // 获取所有课程
  static List<CourseModel> get allCourses {
    return [
      ...stage1Courses,
      ...stage2Courses,
      ...stage3Courses,
      ...stage4Courses,
    ];
  }

  // 根据ID获取课程
  static CourseModel? getCourseById(String id) {
    try {
      return allCourses.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  // 获取某个阶段的课程
  static List<CourseModel> getCoursesByStage(String stageId) {
    return allCourses.where((c) => c.stageId == stageId).toList();
  }
}
