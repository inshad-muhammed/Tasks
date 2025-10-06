import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';

class TabContent extends ConsumerWidget {
  final int index;
  final String title;

  const TabContent(this.index, this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      spacing: SizeConfig.screenWidth * 0.02,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        Container(
          height: SizeConfig.screenWidth * 0.04,
          width: SizeConfig.screenWidth * 0.04,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 1),
            color: index == 0 ? Color(0xff4197CB) : Colors.red,
          ),
          child: Center(
            child: Text(
              "2",
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.screenWidth * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
