import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class BillerCard extends StatelessWidget {
  const BillerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.3,
      decoration: BoxDecoration(
        border: Border.all(color: DefaultColors.grayMedBase),
        borderRadius: BorderRadius.circular(12),
        color: DefaultColors.dashboardGray,
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: DefaultColors.white,
            border: Border.all(color: DefaultColors.grayMedBase, width: 0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "No Billers Added!",
                      style: TextStyle(
                        color: DefaultColors.grayBase,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.395,
                      child: Text(
                        "Add to manage billers right from your dashboard.",
                        style: TextStyle(
                          fontSize: 12,
                          color: DefaultColors.grayBase,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(width: 32),
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
