import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: screenWidth * 0.6,
            height: screenWidth * 0.06,
            color: DefaultColors.white,
          ),
          SizedBox(height: 8),
          Container(
            width: screenWidth * 0.4,
            height: screenWidth * 0.04,
            color: DefaultColors.white,
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: screenWidth * 0.03,
            runSpacing: screenWidth * 0.05,
            children: List.generate(8, (index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      color: DefaultColors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.04,
                    color: DefaultColors.white,
                  ),
                ],
              );
            }),
          ),
          Spacer(),
          Container(
            width: screenWidth,
            height: screenWidth * 0.13,
            color: DefaultColors.white,
          ),
        ],
      ),
    );
  }
}
