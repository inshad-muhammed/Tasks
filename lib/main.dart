import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/features/bottom_sheet/presentation/page/bottom_sheet.dart';
import 'package:tasks/features/menu/presentation/page/main_page.dart';
import 'package:tasks/features/quick_link/presentation/pages/quick_link.dart';
import 'package:tasks/features/widget_customisation/presentation/pages/customise_widget.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: QuickLinkPage(),
    );
  }
}
