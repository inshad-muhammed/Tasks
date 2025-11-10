import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CreditCardBills extends StatelessWidget {
  const CreditCardBills({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenWidth * 0.24,
      decoration: BoxDecoration(
        border: Border.all(color: DefaultColors.grayMedBase),
        borderRadius: BorderRadius.circular(12),
        color: DefaultColors.dashboardGray,
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Container(
          decoration: BoxDecoration(
            color: DefaultColors.white,
            border: Border.all(color: DefaultColors.grayMedBase, width: 0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
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
                        width: screenWidth * 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Text(
                  "No Bills to show yet.",
                  style: TextStyle(
                    color: DefaultColors.grayBase,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
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
