import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required String title,
    required String time,
    required String message,
    @Default(<String>[]) List<String> highlights,
    @JsonKey(name: 'notificationtype') required String notificationType,
    @Default(false) bool unread,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);
}

class NotificationSection {
  final String title;
  final List<NotificationItem> notifications;

  NotificationSection({required this.title, required this.notifications});

  /// The JSON coming from `notificationSections` uses dynamic keys (e.g. {"date": "Today", "notifications": [...]})
  /// so we extract the first String value as the title and the List as notifications.
  factory NotificationSection.fromJson(Map<String, dynamic> json) {
    String title = '';
    List<dynamic> items = [];

    for (final entry in json.entries) {
      if (entry.value is String) {
        title = entry.value as String;
      } else if (entry.value is List) {
        items = entry.value as List<dynamic>;
      }
    }

    final notifications = items
        .map((e) => NotificationItem.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    return NotificationSection(title: title, notifications: notifications);
  }
}

// class NotificationItem {
//   final String id;
//   final String title;
//   final String time;
//   final String message;
//   final List<String> highlights;
//   final String notificationType;
//   final bool unread;

//   NotificationItem({
//     required String id,
//     required String title,
//     required String time,
//     required String message,
//     required String highlights,
//     required String notificationType,
//     String unread = false,
//   });

//   factory NotificationItem.fromJson(Map<String, dynamic> json) {
//     return NotificationItem(
//       id: json['id'],
//       title: json['title'],
//       time: json['time'],
//       message: json['message'],
//       highlights: List<String>.from(json['highlights']),
//       notificationType: json['notificationtype'],
//       unread: json['unread'] ?? false,
//     );
//   }
// }

// class NotificationSection {
//   final String title;
//   final List<NotificationItem> notifications;

//   NotificationSection({required String title, required String notifications});

//   factory NotificationSection.fromJson(Map<String, dynamic> json) {
//     final String sectionTitle = json.values.first;
//     final List<dynamic> items = json[json.keys.last];

//     return NotificationSection(
//       title: sectionTitle,
//       notifications: items
//           .map((item) => NotificationItem.fromJson(item))
//           .toList(),
//     );
//   }
// }
