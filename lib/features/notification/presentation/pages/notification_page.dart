import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/notification.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/controllers/selection_mode_providers.dart';
import 'package:tasks/features/notification/presentation/pages/notifications.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final s = DefaultStrings.instance;
    final isSelectionMode = ref.watch(selectionModeProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.16,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: Icon(Icons.arrow_back, size: screenWidth * 0.06),
        leadingWidth: screenWidth * 0.15,
        titleSpacing: 0,
        title: Text(
          s.pageTitle,
          style: TextStyle(fontSize: screenWidth * 0.045),
        ),
        actions: [
          Icon(Icons.settings_outlined, size: screenWidth * 0.06),
          // SizedBox(width:  screenWidth * 0.03),
          GestureDetector(
            onTap: () {
              ref.read(selectionModeProvider.notifier).toggle();
              ref.read(selectedNotificationsProvider.notifier).state = {};
            },
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Text(
                isSelectionMode ? "Done" : "Select",
                style: TextStyle(
                  color: theme.focusColor,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(height: 2, color: Colors.grey.shade300),
        ),
      ),
      body: Notifications(),
    );
  }
}
