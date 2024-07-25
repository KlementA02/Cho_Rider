class Notification {
  final String id;
  final String userId;
  final String title;
  final String message;
  final bool isRead;
  final DateTime sentDate;

  Notification({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.isRead,
    required this.sentDate,
  });

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      message: map['message'],
      isRead: map['isRead'],
      sentDate: DateTime.parse(map['sentDate']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'message': message,
      'isRead': isRead,
      'sentDate': sentDate.toIso8601String(),
    };
  }
}
