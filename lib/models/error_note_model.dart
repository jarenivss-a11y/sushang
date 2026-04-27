// ============================================================
// 【错题本数据模型】
// 作用：记录小白学习过程中遇到的代码报错，方便复习
// ============================================================

class ErrorNoteModel {
  // 记录ID（唯一标识）
  final String id;

  // 报错截图保存的路径
  final String? screenshotPath;

  // 报错类型（方便分类查找）
  // 比如："运行时报错"、"代码写错了"、"环境配置问题"
  final String errorType;

  // 报错原因（用通俗语言描述）
  final String errorReason;

  // 正确的代码（可以复制使用）
  final String correctCode;

  // 所属学习阶段（方便按阶段筛选）
  final String stage;

  // 记录创建时间
  final DateTime createTime;

  // 下次复习时间
  DateTime? reviewTime;

  // 复习次数
  int reviewCount;

  // 构造函数
  ErrorNoteModel({
    required this.id,
    this.screenshotPath,
    required this.errorType,
    required this.errorReason,
    required this.correctCode,
    required this.stage,
    required this.createTime,
    this.reviewTime,
    this.reviewCount = 0,
  });

  // 从JSON创建
  factory ErrorNoteModel.fromJson(Map<String, dynamic> json) {
    return ErrorNoteModel(
      id: json['id'] ?? '',
      screenshotPath: json['screenshotPath'],
      errorType: json['errorType'] ?? '',
      errorReason: json['errorReason'] ?? '',
      correctCode: json['correctCode'] ?? '',
      stage: json['stage'] ?? '',
      createTime: DateTime.tryParse(json['createTime'] ?? '') ?? DateTime.now(),
      reviewTime: json['reviewTime'] != null
          ? DateTime.tryParse(json['reviewTime'])
          : null,
      reviewCount: json['reviewCount'] ?? 0,
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'screenshotPath': screenshotPath,
      'errorType': errorType,
      'errorReason': errorReason,
      'correctCode': correctCode,
      'stage': stage,
      'createTime': createTime.toIso8601String(),
      'reviewTime': reviewTime?.toIso8601String(),
      'reviewCount': reviewCount,
    };
  }

  // 创建副本（用于更新数据）
  ErrorNoteModel copyWith({
    String? id,
    String? screenshotPath,
    String? errorType,
    String? errorReason,
    String? correctCode,
    String? stage,
    DateTime? createTime,
    DateTime? reviewTime,
    int? reviewCount,
  }) {
    return ErrorNoteModel(
      id: id ?? this.id,
      screenshotPath: screenshotPath ?? this.screenshotPath,
      errorType: errorType ?? this.errorType,
      errorReason: errorReason ?? this.errorReason,
      correctCode: correctCode ?? this.correctCode,
      stage: stage ?? this.stage,
      createTime: createTime ?? this.createTime,
      reviewTime: reviewTime ?? this.reviewTime,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }
}

// 报错类型常量 - 方便小白选择，不懂专业术语也能理解
class ErrorTypeConstants {
  static const String runError = '运行时报错';        // 代码运行到一半突然停了
  static const String syntaxError = '代码写错了';      // 少了一个符号或者拼写错误
  static const String logicError = '结果不对';        // 代码能跑，但结果不是你想要的
  static const String environmentError = '环境问题';   // 软件没装好或者配置不对
  static const String other = '其他问题';

  // 所有报错类型列表
  static List<String> get all => [
        runError,
        syntaxError,
        logicError,
        environmentError,
        other,
      ];
}
