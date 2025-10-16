import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SizeConfig.screenWidth * 0.03,
      runSpacing: SizeConfig.screenWidth * 0.05,
      children: List.generate(8, (index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.15,
              height: SizeConfig.screenWidth * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenWidth * 0.04,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.02),
            Container(
              width: SizeConfig.screenWidth * 0.2,
              height: SizeConfig.screenWidth * 0.04,
              color: Colors.white,
            ),
          ],
        );
      }),
    );
  }
}
