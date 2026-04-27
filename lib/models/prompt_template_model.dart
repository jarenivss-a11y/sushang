// ============================================================
// 【提示词模板数据模型】
// 作用：保存给Claude Code发送的提示词模板，方便小白复用
// ============================================================

class PromptTemplateModel {
  // 模板ID
  final String id;

  // 模板名称（比如"生成计算器代码"）
  final String name;

  // 模板用途说明（比如"用来生成一个简单的计算器App"）
  final String usage;

  // 完整的提示词内容
  final String promptContent;

  // 是否是内置模板（内置模板不能删除）
  final bool isBuiltIn;

  // 创建时间
  final DateTime createTime;

  // 使用次数
  int useCount;

  // 构造函数
  PromptTemplateModel({
    required this.id,
    required this.name,
    required this.usage,
    required this.promptContent,
    this.isBuiltIn = false,
    required this.createTime,
    this.useCount = 0,
  });

  // 从JSON创建
  factory PromptTemplateModel.fromJson(Map<String, dynamic> json) {
    return PromptTemplateModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      usage: json['usage'] ?? '',
      promptContent: json['promptContent'] ?? '',
      isBuiltIn: json['isBuiltIn'] ?? false,
      createTime:
          DateTime.tryParse(json['createTime'] ?? '') ?? DateTime.now(),
      useCount: json['useCount'] ?? 0,
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'usage': usage,
      'promptContent': promptContent,
      'isBuiltIn': isBuiltIn,
      'createTime': createTime.toIso8601String(),
      'useCount': useCount,
    };
  }

  // 创建副本（用于更新数据）
  PromptTemplateModel copyWith({
    String? id,
    String? name,
    String? usage,
    String? promptContent,
    bool? isBuiltIn,
    DateTime? createTime,
    int? useCount,
  }) {
    return PromptTemplateModel(
      id: id ?? this.id,
      name: name ?? this.name,
      usage: usage ?? this.usage,
      promptContent: promptContent ?? this.promptContent,
      isBuiltIn: isBuiltIn ?? this.isBuiltIn,
      createTime: createTime ?? this.createTime,
      useCount: useCount ?? this.useCount,
    );
  }
}
