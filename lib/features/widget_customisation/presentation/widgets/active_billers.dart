import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/widget_customisation.dart';
import 'package:tasks/core/utils/size_config.dart';

class BillerCard extends StatelessWidget {
  const BillerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = DefaultStrings.instance;
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.screenWidth * 0.3,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.activeBillerCardTitle,
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.screenWidth * 0.038,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.395,
                      child: Text(
                        s.activeBillerCardDescription,
                        style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.028,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset("assets/creative.png"),
                    Positioned(
                      bottom: -20,
                      right: -30,
                      child: Image.asset("assets/image 2923.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
