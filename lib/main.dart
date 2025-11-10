import 'package:flutter/material.dart';
import 'package:tasks/features/notification/presentation/pages/notification_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Page',

      home: const NotificationPage(),
    );
  }
}
