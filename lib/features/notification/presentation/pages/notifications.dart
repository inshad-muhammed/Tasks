import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/controllers/notification_provider.dart';
import 'package:tasks/features/notification/presentation/controllers/selection_mode_providers.dart';
import 'package:tasks/features/notification/presentation/widgets/filter_bar.dart';
import 'package:tasks/features/notification/presentation/widgets/notification_card.dart';
import 'package:tasks/features/notification/presentation/widgets/notification_shimmer_effect.dart';
import 'package:tasks/features/notification/presentation/widgets/notification_viewer_bottomsheet.dart';
import 'package:tasks/features/notification/presentation/widgets/section_header.dart';
import 'package:tasks/features/notification/presentation/widgets/selction_bar.dart'; // make sure this points to your model

class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSelectionMode = ref.watch(selectionModeProvider);
    final selected = ref.watch(selectedNotificationsProvider);
    final asyncSections = ref.watch(notificationSectionsProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: asyncSections.when(
        loading: () => Shimmer.fromColors(
          baseColor: theme.colorScheme.onPrimaryContainer,
          highlightColor: theme.colorScheme.inversePrimary,
          child: NotificationShimmerEffect(),
        ),
        error: (error, stack) => Center(child: Text("Error: $error")),
        data: (notificationSections) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (selected.isNotEmpty)
                  const SelectionBar()
                else
                  const FilterBar(),
                SizedBox(height: screenWidth * 0.05),

                // Build all sections
                ...notificationSections.map((section) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenWidth * 0.05),
                      SectionHeader(section.title),
                      SizedBox(height: screenWidth * 0.02),

                      // Build notifications
                      ...section.notifications.map((notif) {
                        final id = notif.id;
                        final isSelected = selected.contains(id);

                        return GestureDetector(
                          onTap: () {
                            if (isSelectionMode) {
                              final selectedSet = {...selected};
                              isSelected
                                  ? selectedSet.remove(id)
                                  : selectedSet.add(id);

                              ref
                                      .read(
                                        selectedNotificationsProvider.notifier,
                                      )
                                      .state =
                                  selectedSet;
                            } else {
                              showModalBottomSheet(
                                backgroundColor: theme.scaffoldBackgroundColor,
                                context: context,
                                builder: (context) {
                                  return NotificationViewerBottomsheet(
                                    title: notif.title,
                                    message: notif.message,
                                    time: notif.time,
                                  );
                                },
                              );
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: screenWidth * 0.02,
                            ),
                            child: NotificationCard(
                              id: id,
                              message: notif.message,
                              time: notif.time,
                              highlights: notif.highlights,
                              notificationtype: notif.notificationType,
                              unread: notif.unread,
                              isSelected: isSelected,
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
