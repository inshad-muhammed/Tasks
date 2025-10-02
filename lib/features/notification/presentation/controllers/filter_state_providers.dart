import 'package:flutter_riverpod/legacy.dart';

enum NotificationFilter { all, unread, read }

final notificationFilterProvider = StateProvider<NotificationFilter>(
  (ref) => NotificationFilter.all,
);
