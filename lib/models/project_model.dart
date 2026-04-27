// ============================================================
// 【实战项目数据模型】
// 作用：定义一个实战项目的数据结构
// ============================================================

class ProjectModel {
  // 项目ID
  final String id;

  // 项目名称
  final String name;

  // 项目副标题
  final String subtitle;

  // 项目难度星级（1-5）
  final int difficulty;

  // 项目图标（使用Emoji）
  final String icon;

  // 项目介绍
  final String introduction;

  // 项目效果描述
  final String effectDescription;

  // 分步教程列表
  final List<ProjectStep> steps;

  // 完整源代码
  final String sourceCode;

  // 代码说明
  final String codeExplanation;

  // 可自定义修改的地方说明
  final List<String> customizableParts;

  // 构造函数
  ProjectModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.difficulty,
    required this.icon,
    required this.introduction,
    required this.effectDescription,
    required this.steps,
    required this.sourceCode,
    required this.codeExplanation,
    required this.customizableParts,
  });

  // 从JSON创建
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      subtitle: json['subtitle'] ?? '',
      difficulty: json['difficulty'] ?? 1,
      icon: json['icon'] ?? '💻',
      introduction: json['introduction'] ?? '',
      effectDescription: json['effectDescription'] ?? '',
      steps: (json['steps'] as List<dynamic>?)
              ?.map((s) => ProjectStep.fromJson(s))
              .toList() ??
          [],
      sourceCode: json['sourceCode'] ?? '',
      codeExplanation: json['codeExplanation'] ?? '',
      customizableParts:
          List<String>.from(json['customizableParts'] ?? []),
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subtitle': subtitle,
      'difficulty': difficulty,
      'icon': icon,
      'introduction': introduction,
      'effectDescription': effectDescription,
      'steps': steps.map((s) => s.toJson()).toList(),
      'sourceCode': sourceCode,
      'codeExplanation': codeExplanation,
      'customizableParts': customizableParts,
    };
  }
}

// ============================================================
// 【项目步骤模型】
// 作用：定义项目的每一步教程
// ============================================================

class ProjectStep {
  // 步骤编号
  final int stepNumber;

  // 步骤标题
  final String title;

  // 步骤详细说明
  final String description;

  // 如果有代码，展示的代码片段
  final String? codeSnippet;

  // 代码说明
  final String? codeExplanation;

  // 提示信息（告诉小白要注意什么）
  final String? tip;

  // 构造函数
  ProjectStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    this.codeSnippet,
    this.codeExplanation,
    this.tip,
  });

  // 从JSON创建
  factory ProjectStep.fromJson(Map<String, dynamic> json) {
    return ProjectStep(
      stepNumber: json['stepNumber'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      codeSnippet: json['codeSnippet'],
      codeExplanation: json['codeExplanation'],
      tip: json['tip'],
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'stepNumber': stepNumber,
      'title': title,
      'description': description,
      'codeSnippet': codeSnippet,
      'codeExplanation': codeExplanation,
      'tip': tip,
    };
  }
}
