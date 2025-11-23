import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailUs extends StatelessWidget {
  const MailUs({super.key});

  void openEmailApp() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'support@dukhanbank.com');

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint("No email application configured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: openEmailApp,
      child: const Text("Open Email App"),
    );
  }
}
