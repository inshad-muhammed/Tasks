import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/controllers/tab_index_provider.dart';

class TabContent extends ConsumerWidget {
  final int index;
  final String title;

  const TabContent(this.index, this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider);
    final isSelected = selectedIndex == index;

    return Row(
      spacing: SizeConfig.screenWidth * 0.02,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        Container(
          height: SizeConfig.screenWidth * 0.03,
          width: SizeConfig.screenWidth * 0.03,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 1),
            color: isSelected ? Colors.red : Colors.grey,
          ),
          child: Center(
            child: Text(
              "2",
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.screenWidth * 0.016,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
