import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/widget_customisation.dart';
import 'package:tasks/core/utils/size_config.dart';

class CreditCardBills extends StatelessWidget {
  const CreditCardBills({super.key});

  @override
  Widget build(BuildContext context) {
    final s = DefaultStrings.instance;
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.screenWidth * 0.24,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.onPrimaryContainer),
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
        color: theme.colorScheme.onSecondaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
        child: Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            border: Border.all(
              color: theme.colorScheme.onPrimaryContainer,
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
            child: Row(
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Image.asset("assets/creative.png"),
                    Positioned(
                      bottom: -20,
                      right: -24,
                      child: Image.asset(
                        "assets/image 2923.png",
                        width: SizeConfig.screenWidth * 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.08),
                Text(
                  s.creditCardbillDescription,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.screenWidth * 0.03,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
