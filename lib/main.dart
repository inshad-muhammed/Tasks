import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/pages/fawran_requests.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'DiodrumArabic'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const FawranRequestsPage(),
    );
  }
}
