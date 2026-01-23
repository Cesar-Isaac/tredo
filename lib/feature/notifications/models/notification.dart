class NotificationModel {
  final String id;
  final String title;
  final String body;
  final DateTime? readAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    this.readAt,
  });

  bool get isRead => readAt != null;

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? readAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      readAt: readAt ?? this.readAt,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at']) : null,
    );
  }
}
