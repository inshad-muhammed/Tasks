import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/quick_link_page.dart';
import 'package:tasks/core/utils/size_config.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    final s = DefaultStrings.instance;
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.screenHeight * 0.02,
        top: SizeConfig.screenHeight * 0.01,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(theme.splashColor),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(s.buttonText, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
