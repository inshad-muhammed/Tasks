import 'package:flutter/material.dart';
import 'package:tasks/core/constants/colors.dart';

class ShimmerEffectWidgetCustomisation extends StatelessWidget {
  const ShimmerEffectWidgetCustomisation({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: screenWidth * 0.086,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          width: double.infinity,
          height: screenWidth * 0.3,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
        SizedBox(height: screenWidth * 0.03),
        Container(
          width: double.infinity,
          height: screenWidth * 0.086,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          width: double.infinity,
          height: screenWidth * 0.6,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
        SizedBox(height: screenWidth * 0.03),
        Container(
          width: double.infinity,
          height: screenWidth * 0.086,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Container(
          width: double.infinity,
          height: screenWidth * 0.2,
          decoration: BoxDecoration(
            color: DefaultColors.white,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
      ],
    );
  }
}
