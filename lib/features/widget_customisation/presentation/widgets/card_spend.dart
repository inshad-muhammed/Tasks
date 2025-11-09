import 'package:flutter/material.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/widget_customisation.dart';
import 'package:tasks/core/utils/size_config.dart';

class CardSpend extends StatelessWidget {
  const CardSpend({super.key});

  @override
  Widget build(BuildContext context) {
    final s = DefaultStrings.instance;
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.onPrimaryContainer),
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
        color: theme.colorScheme.onSecondaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.04,
          right: SizeConfig.screenWidth * 0.04,
          bottom: SizeConfig.screenWidth * 0.04,
          top: SizeConfig.screenWidth * 0.08,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                border: Border.all(
                  color: theme.colorScheme.onPrimaryContainer,
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenWidth * 0.02,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/spend.png",
                    width: SizeConfig.screenWidth * 0.22,
                  ),
                  Text(
                    s.cardSpendDescription,
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth * 0.03,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
                    child: SizedBox(
                      width: double.infinity,
                      height: SizeConfig.screenWidth * 0.074,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              theme.colorScheme.onSecondaryContainer,

                          foregroundColor: Colors.grey.shade400,
                        ),

                        onPressed: () {},
                        child: Row(
                          spacing: SizeConfig.screenWidth * 0.03,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              s.cardSpendButtonText,
                              style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Image.asset("assets/upright.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -18,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                  border: Border.all(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenWidth * 0.014,
                    horizontal: SizeConfig.screenWidth * 0.04,
                  ),
                  child: Text(
                    s.cardSpendTitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: SizeConfig.screenWidth * 0.028,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
