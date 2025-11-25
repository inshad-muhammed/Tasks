import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailUs extends StatelessWidget {
  const MailUs({super.key});

  void openEmailApp() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'insahdkorambayil@gmail.com',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint("No email application configured");
      SnackBar(content: Text("No email application configured"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: openEmailApp,
          child: const Text("Mail Us"),
        ),
      ),
    );
  }
}
