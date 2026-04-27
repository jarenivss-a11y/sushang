// ============================================================
// 【课程数据模型】
// 作用：定义一门课程的数据结构，方便存储和读取课程信息
// ============================================================

class CourseModel {
  // 课程ID，用于唯一标识课程
  final String id;

  // 所属阶段ID（比如"stage1"表示第一阶段）
  final String stageId;

  // 课程标题，显示在课程列表中
  final String title;

  // 课程副标题，简短说明课程内容
  final String subtitle;

  // 课程详细描述，说明学生会学到什么
  final String description;

  // 课程内容（知识点讲解）
  final String content;

  // 示例代码（如果有的话）
  final String? codeExample;

  // 代码说明（解释代码的作用）
  final String? codeExplanation;

  // 课程难度星级（1-5星）
  final int difficulty;

  // 是否已完成
  bool isCompleted;

  // 构造函数 - 创建课程对象
  CourseModel({
    required this.id,
    required this.stageId,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.content,
    this.codeExample,
    this.codeExplanation,
    this.difficulty = 1,
    this.isCompleted = false,
  });

  // 从JSON创建课程对象（用于从本地存储读取）
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      stageId: json['stageId'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      codeExample: json['codeExample'],
      codeExplanation: json['codeExplanation'],
      difficulty: json['difficulty'] ?? 1,
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  // 转换为JSON（用于保存到本地存储）
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stageId': stageId,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'content': content,
      'codeExample': codeExample,
      'codeExplanation': codeExplanation,
      'difficulty': difficulty,
      'isCompleted': isCompleted,
    };
  }
}

// ============================================================
// 【学习阶段模型】
// 作用：定义一个学习阶段的数据结构
// ============================================================

class StageModel {
  // 阶段ID
  final String id;

  // 阶段名称（比如"阶段1：编程入门"）
  final String name;

  // 阶段描述
  final String description;

  // 阶段包含的课程列表
  final List<CourseModel> courses;

  // 阶段完成度（0.0 - 1.0）
  double get progress {
    if (courses.isEmpty) return 0.0;
    int completed = courses.where((c) => c.isCompleted).length;
    return completed / courses.length;
  }

  // 阶段是否已完成
  bool get isCompleted => progress == 1.0;

  // 构造函数
  StageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.courses,
  });
}
