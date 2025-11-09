import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/core/utils/size_config.dart';

class IconWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback function;
  const IconWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return InkWell(
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenWidth * 0.15,
            width: SizeConfig.screenWidth * 0.15,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(
                SizeConfig.screenWidth * 0.05,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.screenWidth * 0.045),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenWidth * 0.015),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: SizeConfig.screenWidth * 0.04,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
