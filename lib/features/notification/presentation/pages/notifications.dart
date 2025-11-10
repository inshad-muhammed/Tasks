import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/filter_bar.dart';
import '../widgets/notification_card.dart';
import '../widgets/notification_viewer_bottomsheet.dart';
import '../widgets/section_header.dart';
import '../widgets/selction_bar.dart';

class Notifications extends StatelessWidget {
  final bool isSelectionMode;
  final Set<String> selectedIds;
  final void Function(String id) onToggleSelect;
  final List<Map<String, dynamic>> sections;
  final String selectedFilter; // 'all' | 'unread' | 'read'
  final VoidCallback onFilterAll;
  final VoidCallback onFilterUnread;
  final VoidCallback onFilterRead;
  final VoidCallback onSelectAllToggle;
  final VoidCallback onDeleteSelected;

  const Notifications({
    super.key,
    required this.isSelectionMode,
    required this.selectedIds,
    required this.onToggleSelect,
    required this.sections,
    required this.selectedFilter,
    required this.onFilterAll,
    required this.onFilterUnread,
    required this.onFilterRead,
    required this.onSelectAllToggle,
    required this.onDeleteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectedIds.isNotEmpty)
                SelectionBar(
                  totalCount: () {
                    return sections
                        .expand(
                          (sec) =>
                              List<Map<String, dynamic>>.from(
                                    sec["notifications"],
                                  )
                                  .where((n) => (n['unread'] ?? false) == true)
                                  .toList(),
                        )
                        .length;
                  }(),
                  selectedCount: selectedIds.length,
                  onSelectAllToggle: onSelectAllToggle,
                  onDeleteSelected: onDeleteSelected,
                )
              else
                FilterBar(
                  selected: selectedFilter,
                  onAll: onFilterAll,
                  onUnread: onFilterUnread,
                  onRead: onFilterRead,
                ),

              ...sections.map((section) {
                final items =
                    List<Map<String, dynamic>>.from(
                      section["notifications"],
                    ).where((n) {
                      if (selectedFilter == 'all') return true;
                      if (selectedFilter == 'unread') {
                        return (n['unread'] ?? false) == true;
                      }
                      return (n['unread'] ?? false) != true;
                    }).toList();
                if (items.isEmpty) return const SizedBox.shrink();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader('${section["date"]}'),
                    SizedBox(height: 8),

                    ...items.map((notif) {
                      final id = '${notif['id']}';
                      final isSelected = selectedIds.contains(id);
                      return GestureDetector(
                        onTap: () {
                          if (isSelectionMode) {
                            onToggleSelect(id);
                          } else {
                            showModalBottomSheet(
                              backgroundColor: DefaultColors.white,
                              context: context,
                              builder: (context) {
                                return NotificationViewerBottomsheet(
                                  title: '${notif['title']}',
                                  message: '${notif['message']}',
                                  time: '${notif['time']}',
                                );
                              },
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: NotificationCard(
                            id: id,
                            message: '${notif['message']}',
                            time: '${notif['time']}',
                            highlights: notif['highlights'] == null
                                ? const <String>[]
                                : notif['highlights'] is String
                                ? [notif['highlights'] as String]
                                : List<String>.from(
                                    notif['highlights'] as List,
                                  ),
                            notificationtype: '${notif['notificationtype']}',
                            unread: (notif['unread'] ?? false) == true,
                            isSelected: isSelected,
                            isSelectionMode: isSelectionMode,
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
    );
  }
}
