import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CardSpend extends StatelessWidget {
  const CardSpend({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.6,
      decoration: BoxDecoration(
        border: Border.all(color: DefaultColors.grayMedBase),
        borderRadius: BorderRadius.circular(12),
        color: DefaultColors.dashboardGray,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
          bottom: screenWidth * 0.04,
          top: screenWidth * 0.08,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: DefaultColors.white,
                border: Border.all(
                  color: DefaultColors.grayMedBase,
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/spend.png", width: screenWidth * 0.22),
                  Text(
                    "Nothing to track here yet.",
                    style: TextStyle(
                      fontSize: 14,
                      color: DefaultColors.grayBase,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      height: screenWidth * 0.074,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: DefaultColors.grayD4,

                          foregroundColor: DefaultColors.grayMedBase,
                        ),

                        onPressed: () {},
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "View all spends",
                              style: TextStyle(
                                fontSize: 12,
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
                  color: DefaultColors.white,
                  borderRadius: BorderRadius.circular(56),
                  border: Border.all(color: DefaultColors.grayMedBase),
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Text(
                    "Your recent spends",
                    style: TextStyle(
                      color: DefaultColors.grayBase,
                      fontSize: 12,
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
