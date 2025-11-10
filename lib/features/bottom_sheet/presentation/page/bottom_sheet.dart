import 'package:flutter/material.dart';

import 'package:tasks/features/bottom_sheet/presentation/widget/bottom_sheet_widget.dart';

class BiometricBottomSheet extends StatelessWidget {
  const BiometricBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return BottomSheetWidget(
                  imagePath: "assets/fingerprint.png",
                  title: "Enable Biometric Login ?",
                  description: "Setup biometric authentication to login easily",
                  setupFunction: () {},
                  setuprLaterFunction: () {},
                  setupButtonText: "Continue",
                  setupLaterButtonText: "Setup Later in settings",
                );
              },
            );
          },
          child: Text("View Bottom Sheet"),
        ),
      ),
    );
  }
}
