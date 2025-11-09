// services/notification_service.dart

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:tasks/features/notification/data/data_source/notification_model.dart';
import 'package:tasks/features/notification/presentation/constants/notifications.dart';

class NotificationService {
  final Dio _dio = Dio();

  Future<List<NotificationSection>> fetchNotificationSections() async {
    await Future.delayed(Duration(seconds: 2));

    final response = Response(
      requestOptions: RequestOptions(path: ''),
      data: notificationSections,
      statusCode: 200,
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((section) => NotificationSection.fromJson(section))
          .toList();
    } else {
      throw Exception("Failed to fetch notification sections");
    }
  }
}
