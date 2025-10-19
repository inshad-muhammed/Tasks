import 'package:flutter/material.dart';

import 'package:tasks/core/utils/size_config.dart';

class ShimmerEffectWidgetCustomisation extends StatelessWidget {
  const ShimmerEffectWidgetCustomisation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.screenWidth * 0.086,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
        ),
        SizedBox(height: SizeConfig.screenWidth * 0.02),
        Container(
          width: double.infinity,
          height: SizeConfig.screenWidth * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
        ),
        SizedBox(height: SizeConfig.screenWidth * 0.03),
        Container(
          width: double.infinity,
          height: SizeConfig.screenWidth * 0.086,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
        ),
        SizedBox(height: SizeConfig.screenWidth * 0.02),
        Container(
          width: double.infinity,
          height: SizeConfig.screenWidth * 0.6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
        ),
        SizedBox(height: SizeConfig.screenWidth * 0.03),
        Container(
          width: double.infinity,
          height: SizeConfig.screenWidth * 0.086,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
        ),
        SizedBox(height: SizeConfig.screenWidth * 0.02),
        Container(
          width: double.infinity,
          height: SizeConfig.screenWidth * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
        ),
      ],
    );
  }
}
