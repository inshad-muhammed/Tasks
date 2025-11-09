import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/notification.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/constants/notifications.dart';
import 'package:tasks/features/notification/presentation/controllers/selection_mode_providers.dart';

class SelectionBar extends ConsumerWidget {
  const SelectionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = DefaultStrings.instance;
    final selected = ref.watch(selectedNotificationsProvider);
    final totalCount = notificationSections
        .expand((section) => section[s.section2])
        .length;
    return SizedBox(
      height: SizeConfig.screenWidth * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (selected.length == totalCount) {
                ref.read(selectedNotificationsProvider.notifier).state = {};
              } else {
                final allIds = <String>{};
                for (var section in notificationSections) {
                  for (var notif in section[s.section2]) {
                    allIds.add('${notif["id"]}');
                  }
                }
                ref.read(selectedNotificationsProvider.notifier).state = allIds;
              }
            },
            child: Row(
              spacing: SizeConfig.screenWidth * 0.01,
              children: [
                Icon(
                  Icons.check,
                  color: Theme.of(context).highlightColor,
                  size: SizeConfig.screenWidth * 0.04,
                ),
                Text(
                  s.selectAllButtonText,
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontSize: SizeConfig.screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: selected.isEmpty
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${selected.length} ${s.snackBarMessage}',
                        ),
                      ),
                    );
                    // Reset after delete
                    ref.read(selectedNotificationsProvider.notifier).state = {};
                    ref.read(selectionModeProvider.notifier).toggle();
                  },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenWidth * 0.5,
                ),
                border: Border.all(color: Theme.of(context).highlightColor),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.screenWidth * 0.02),
                child: Row(
                  spacing: SizeConfig.screenWidth * 0.01,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: SizeConfig.screenWidth * 0.04,
                      color: Theme.of(context).highlightColor,
                    ),
                    Text(
                      s.deleteButtonText,
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.03,
                        color: Theme.of(context).highlightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
