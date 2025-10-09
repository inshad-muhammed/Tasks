import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/notification/presentation/pages/notification_page.dart';

void main() {
  runApp(ProviderScope(child: I18nBinder(child: const MyApp())));
}

class I18nBinder extends StatelessWidget {
  final Widget child;
  const I18nBinder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NotificationPage(),
    );
  }
}
