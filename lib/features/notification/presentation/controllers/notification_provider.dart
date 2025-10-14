// providers/notification_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/notification/data/models/notification_model.dart';
import 'package:tasks/features/notification/data/services/notification_service.dart';

final notificationServiceProvider = Provider((ref) => NotificationService());

final notificationSectionsProvider = FutureProvider<List<NotificationSection>>((
  ref,
) async {
  final service = ref.read(notificationServiceProvider);
  return service.fetchNotificationSections();
});
