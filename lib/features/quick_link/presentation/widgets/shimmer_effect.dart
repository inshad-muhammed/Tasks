import 'package:flutter/material.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Wrap(
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.04,
              color: Colors.white,
            ),
          ],
        );
      }),
    );
  }
}
