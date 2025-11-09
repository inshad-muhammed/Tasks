import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/notification.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/controllers/filter_state_providers.dart';
import 'package:tasks/features/notification/presentation/widgets/filter_button.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final s = DefaultStrings.instance;
    final selectedFilter = ref.watch(notificationFilterProvider);
    return SizedBox(
      height: screenWidth * 0.12,
      child: Row(
        spacing: screenWidth * 0.01,
        children: [
          FilterButton(
            label: s.filterOption1,
            isSelected: selectedFilter == NotificationFilter.all,
            onTap: () {
              ref.read(notificationFilterProvider.notifier).state =
                  NotificationFilter.all;
            },
          ),
          FilterButton(
            unread: true,
            label: s.filterOption2,
            isSelected: selectedFilter == NotificationFilter.unread,
            onTap: () {
              ref.read(notificationFilterProvider.notifier).state =
                  NotificationFilter.unread;
            },
          ),
          FilterButton(
            label: s.filterOption3,
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
                Icon(
                  Icons.done_all,
                  color: Theme.of(context).highlightColor,
                  size: screenWidth * 0.04,
                ),
                SizedBox(width: screenWidth * 0.008),

                Text(
                  s.markAsReadButtonText,
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
