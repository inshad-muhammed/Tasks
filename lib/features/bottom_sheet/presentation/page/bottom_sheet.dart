import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/bottom_sheet.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/bottom_sheet/presentation/widget/bottom_sheet_widget.dart';

class BiometricBottomSheet extends StatelessWidget {
  const BiometricBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final s = DefaultStrings.instance;
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return BottomSheetWidget(
                  imagePath: "assets/fingerprint.png",
                  title: s.title,
                  description: s.description,
                  setupFunction: () {},
                  setuprLaterFunction: () {},
                  setupButtonText: s.setupButtonText,
                  setupLaterButtonText: s.setupLaterButtonText,
                );
              },
            );
          },
          child: Text(s.setupButtonText),
        ),
      ),
    );
  }
}
