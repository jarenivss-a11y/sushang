// ============================================================
// 【提示词模板数据文件】
// 作用：存储内置的提示词模板，教小白怎么给Claude发消息
// 这些模板可以直接复制使用，根据需要修改
// ============================================================

import '../models/prompt_template_model.dart';

// 内置提示词模板
final List<PromptTemplateModel> builtInPrompts = [
  PromptTemplateModel(
    id: 'prompt1',
    name: '生成计算器代码',
    usage: '想要一个计算器App时使用',
    promptContent: '''请用Flutter帮我生成一个简单的计算器App，要求：
1. 有数字按钮0-9
2. 有加减乘除运算按钮
3. 有等号按钮显示结果
4. 有清除按钮C
5. 代码要带详细的中文注释
6. 代码要简单易懂，因为我是零基础学习者
7. 告诉我怎么运行这个代码''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
  PromptTemplateModel(
    id: 'prompt2',
    name: '修改代码样式',
    usage: '想让界面变成特定颜色或样式时使用',
    promptContent: '''请帮我修改以下Flutter代码，修改要求：
1. 把按钮颜色改成[蓝色/红色/绿色/紫色]
2. 把文字大小改成[更大/更小]
3. 把[某个组件]的[某个属性]改成[你想要的值]

这是我的代码：
[粘贴你的代码]

请给出修改后的完整代码，并告诉我改了哪里。''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
  PromptTemplateModel(
    id: 'prompt3',
    name: '调试报错代码',
    usage: '代码报错不知道怎么处理时使用',
    promptContent: '''我的Flutter代码报错了，请帮我找出问题并修复。

报错信息：
[粘贴错误信息]

这是我的代码：
[粘贴完整代码]

请：
1. 告诉我哪里错了
2. 解释为什么会出错
3. 给出修复后的完整代码''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
  PromptTemplateModel(
    id: 'prompt4',
    name: '生成待办清单代码',
    usage: '想要一个待办清单App时使用',
    promptContent: '''请用Flutter帮我生成一个待办清单App，要求：
1. 可以添加新的待办事项
2. 可以查看待办列表
3. 可以标记待办为已完成
4. 可以删除不需要的待办
5. 数据能保存起来，关闭App再打开还在
6. 代码要带详细的中文注释
7. 代码要简单易懂，因为我是零基础学习者''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
  PromptTemplateModel(
    id: 'prompt5',
    name: '解释代码含义',
    usage: '看不懂某段代码时使用',
    promptContent: '''请帮我解释下面这段Flutter/Dart代码是什么意思。
我完全不懂编程，请用最通俗易懂的话解释，就像教小朋友一样。

[粘贴你想了解的代码]

请：
1. 告诉我这段代码整体是做什么的
2. 逐行解释，每一行都解释
3. 用"[这行代码的意思是...]"的格式''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
  PromptTemplateModel(
    id: 'prompt6',
    name: '添加新功能',
    usage: '想在现有App上添加新功能时使用',
    promptContent: '''我有一个Flutter App，想添加一个新功能：[描述你想要的功能]

这是我的现有代码：
[粘贴你的代码]

请：
1. 告诉我需要在哪里添加代码
2. 需要添加什么代码
3. 给出修改后的完整代码
4. 代码要带中文注释''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
  PromptTemplateModel(
    id: 'prompt7',
    name: '生成猜数字游戏',
    usage: '想要一个简单小游戏时使用',
    promptContent: '''请用Flutter帮我生成一个猜数字游戏，要求：
1. 电脑随机想一个1-100的数字
2. 玩家输入数字来猜
3. 电脑提示"太大了"或"太小了"
4. 猜对了显示恭喜和用了多少次
5. 有重新开始按钮
6. 代码要带详细的中文注释
7. 代码要简单易懂，因为我是零基础学习者''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
  PromptTemplateModel(
    id: 'prompt8',
    name: '生成记事本代码',
    usage: '想要一个记事本App时使用',
    promptContent: '''请用Flutter帮我生成一个简易记事本App，要求：
1. 可以写新的笔记
2. 保存后能在列表中看到
3. 点击可以查看笔记内容
4. 可以删除笔记
5. 代码要带详细的中文注释
6. 代码要简单易懂，因为我是零基础学习者''',
    isBuiltIn: true,
    createTime: DateTime.now(),
  ),
];

// 所有提示词模板
class AllPrompts {
  static List<PromptTemplateModel> get builtIn => builtInPrompts;

  static PromptTemplateModel? getById(String id) {
    try {
      return builtInPrompts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
