import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/constants/notifications.dart';
import 'package:tasks/features/notification/presentation/controllers/selection_mode_providers.dart';
import 'package:tasks/features/notification/presentation/widgets/filter_bar.dart';
import 'package:tasks/features/notification/presentation/widgets/notification_card.dart';
import 'package:tasks/features/notification/presentation/widgets/section_header.dart';
import 'package:tasks/features/notification/presentation/widgets/selction_bar.dart';

class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int idCounter = 0;
    final isSelectionMode = ref.watch(selectionModeProvider);
    final selected = ref.watch(selectedNotificationsProvider);

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          if (selected.isNotEmpty) SelectionBar() else FilterBar(),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenWidth * 0.05),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: notificationSections.length,
                    itemBuilder: (context, sectionIndex) {
                      final section = notificationSections[sectionIndex];
                      final sectionTitle = section["date"];
                      final List notifications = section["notifications"];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (sectionIndex != 0)
                            SizedBox(height: SizeConfig.screenWidth * 0.05),
                          SectionHeader(sectionTitle),
                          SizedBox(height: SizeConfig.screenWidth * 0.02),
                          ...notifications.map<Widget>((notif) {
                            final id = '${notif["id"]}';
                            var isSelected = selected.contains(id);

                            return GestureDetector(
                              onTap: () {
                                if (isSelectionMode) {
                                  final selectedSet = {...selected};
                                  if (isSelected) {
                                    selectedSet.remove(id);
                                  } else {
                                    selectedSet.add(id);
                                  }
                                  ref
                                          .read(
                                            selectedNotificationsProvider
                                                .notifier,
                                          )
                                          .state =
                                      selectedSet;
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: SizeConfig.screenWidth * 0.02,
                                ),
                                child: NotificationCard(
                                  message: notif["message"],
                                  time: notif["time"] ?? "",
                                  highlights: List<String>.from(
                                    notif["highlights"] ?? [],
                                  ),
                                  notificationtype: notif["notificationtype"],
                                  unread: notif["unread"] ?? false,
                                  showButton: notif["showButton"] ?? false,
                                  isSelected: isSelected = selected.contains(
                                    id,
                                  ),
                                  id: 'notif_${idCounter++}',
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
