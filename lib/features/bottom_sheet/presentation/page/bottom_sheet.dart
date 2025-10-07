import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/bottom_sheet/presentation/widget/bottom_sheet_widget.dart';

class BiometricBottomSheet extends StatelessWidget {
  const BiometricBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
                  description: "Setup your biometric to login easily",
                  setupFunction: () {},
                  setuprLaterFunction: () {},
                  setupButtonText: "Enable Biometric Login",
                  setupLaterButtonText: "Setup Later in Settings",
                );
              },
            );
          },
          child: Text("Setup Biometric login"),
        ),
      ),
    );
  }
}
