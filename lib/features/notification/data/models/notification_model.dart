class NotificationItem {
  final String id;
  final String title;
  final String time;
  final String message;
  final List<String> highlights;
  final String notificationType;
  final bool unread;

  NotificationItem({
    required this.id,
    required this.title,
    required this.time,
    required this.message,
    required this.highlights,
    required this.notificationType,
    this.unread = false,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      title: json['title'],
      time: json['time'],
      message: json['message'],
      highlights: List<String>.from(json['highlights']),
      notificationType: json['notificationtype'],
      unread: json['unread'] ?? false,
    );
  }
}

class NotificationSection {
  final String title;
  final List<NotificationItem> notifications;

  NotificationSection({required this.title, required this.notifications});

  factory NotificationSection.fromJson(Map<String, dynamic> json) {
    final String sectionTitle = json.values.first;
    final List<dynamic> items = json[json.keys.last];

    return NotificationSection(
      title: sectionTitle,
      notifications: items
          .map((item) => NotificationItem.fromJson(item))
          .toList(),
    );
  }
}
