import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.screenWidth * 0.12,
          width: SizeConfig.screenWidth * 0.12,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withAlpha(100), width: 0.5),
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.03),
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.015),
            child: Image.asset("assets/rhombus.png"),
          ),
        ),
      ],
    );
  }
}
