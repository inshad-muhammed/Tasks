import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/controllers/filter_state_providers.dart';
import 'package:tasks/features/notification/presentation/widgets/filter_button.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(notificationFilterProvider);
    return Row(
      spacing: SizeConfig.screenWidth * 0.01,
      children: [
        FilterButton(
          label: "All",
          isSelected: selectedFilter == NotificationFilter.all,
          onTap: () {
            ref.read(notificationFilterProvider.notifier).state =
                NotificationFilter.all;
          },
        ),
        FilterButton(
          label: "Unread",
          isSelected: selectedFilter == NotificationFilter.unread,
          onTap: () {
            ref.read(notificationFilterProvider.notifier).state =
                NotificationFilter.unread;
          },
        ),
        FilterButton(
          label: "Read",
          isSelected: selectedFilter == NotificationFilter.read,
          onTap: () {
            ref.read(notificationFilterProvider.notifier).state =
                NotificationFilter.read;
          },
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Image.asset("assets/read.png"),
              Text(
                "Mark All As Read",
                style: TextStyle(
                  color: Color(0xff4197CB),
                  fontSize: SizeConfig.screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
