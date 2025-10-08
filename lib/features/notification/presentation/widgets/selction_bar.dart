import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/constants/notifications.dart';
import 'package:tasks/features/notification/presentation/controllers/selection_mode_providers.dart';

class SelectionBar extends ConsumerWidget {
  const SelectionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedNotificationsProvider);
    final totalCount = notificationSections
        .expand((section) => section["notifications"])
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
                  for (var notif in section["notifications"]) {
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
                  color: Color(0xff4197CB),
                  size: SizeConfig.screenWidth * 0.04,
                ),
                Text(
                  "Select All",
                  style: TextStyle(
                    color: Color(0xff4197CB),
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
                          '${selected.length} notifications deleted',
                        ),
                      ),
                    );
                    // Reset after delete
                    ref.read(selectedNotificationsProvider.notifier).state = {};
                    ref.read(selectionModeProvider.notifier).state = false;
                  },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenWidth * 0.5,
                ),
                border: Border.all(color: Color(0xff0D3E7F)),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.screenWidth * 0.02),
                child: Row(
                  spacing: SizeConfig.screenWidth * 0.01,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: SizeConfig.screenWidth * 0.04,
                      color: Color(0xff4197CB),
                    ),
                    Text(
                      "Delete Notification",
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.03,
                        color: Color(0xff4197CB),
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
