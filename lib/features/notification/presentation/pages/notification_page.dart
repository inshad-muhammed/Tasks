import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/controllers/selection_mode_providers.dart';
import 'package:tasks/features/notification/presentation/pages/notifications.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: SizeConfig.screenWidth * 0.16,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, size: SizeConfig.screenWidth * 0.06),
        leadingWidth: SizeConfig.screenWidth * 0.15,
        titleSpacing: 0,
        title: Text(
          "Notifications (2)",
          style: TextStyle(
            color: const Color(0xff0D3E7F),
            fontSize: SizeConfig.screenWidth * 0.045,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              spacing: SizeConfig.screenWidth * 0.03,
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: const Color(0xff446193),
                  size: SizeConfig.screenWidth * 0.06,
                ),
                PopupMenuButton(
                  offset: Offset(0, kToolbarHeight),
                  color: Colors.white,

                  onSelected: (value) {
                    if (value == 'Select') {
                      ref.read(selectionModeProvider.notifier).state = true;
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      value: 'Select',
                      child: Text("Select Notifiactions"),
                    ),
                    PopupMenuItem(value: 'More', child: Text("<More Options>")),
                  ],
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(height: 2, color: Colors.grey.shade300),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.screenWidth * 0.04,
          left: SizeConfig.screenWidth * 0.04,
          right: SizeConfig.screenWidth * 0.04,
        ),

        child: Notifications(),
      ),
    );
  }
}
