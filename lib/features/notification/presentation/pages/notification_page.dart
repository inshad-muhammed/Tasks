import 'package:flutter/material.dart';
import 'package:tasks/features/notification/presentation/constants/notifications.dart';
import 'package:tasks/features/notification/presentation/pages/notifications.dart';

import '../../../../core/constants/colors.dart' show DefaultColors;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSelectionMode = false;
  final Set<String> selectedIds = <String>{};
  String selectedFilter = 'all'; // 'all' | 'unread' | 'read'

  late final List<Map<String, dynamic>> sections;

  @override
  void initState() {
    super.initState();
    sections = notificationSections;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.white,
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: DefaultColors.white,
        leading: Icon(Icons.arrow_back, size: 20),

        titleSpacing: 0,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 20,
            color: DefaultColors.dashboarddarkBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.settings_outlined, size: 18),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelectionMode = !isSelectionMode;
                selectedIds.clear();
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                isSelectionMode ? "Done" : "Select",
                style: TextStyle(
                  color: DefaultColors.dashboarddarkBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(height: 2, color: DefaultColors.grayD4),
        ),
      ),
      body: Notifications(
        isSelectionMode: isSelectionMode,
        selectedIds: selectedIds,
        onToggleSelect: (id) {
          setState(() {
            if (selectedIds.contains(id)) {
              selectedIds.remove(id);
            } else {
              selectedIds.add(id);
            }
          });
        },
        sections: sections,
        selectedFilter: selectedFilter,
        onFilterAll: () => setState(() => selectedFilter = 'all'),
        onFilterUnread: () => setState(() => selectedFilter = 'unread'),
        onFilterRead: () => setState(() => selectedFilter = 'read'),
        onSelectAllToggle: () {
          setState(() {
            final total = sections
                .expand(
                  (sec) =>
                      List<Map<String, dynamic>>.from(sec["notifications"]),
                )
                .length;
            if (selectedIds.length == total) {
              selectedIds.clear();
            } else {
              selectedIds
                ..clear()
                ..addAll(
                  sections.expand(
                    (sec) => List<Map<String, dynamic>>.from(
                      sec["notifications"],
                    ).map((n) => '${n['id']}'),
                  ),
                );
            }
          });
        },
        onDeleteSelected: () {
          setState(() {
            for (final section in sections) {
              final list = List<Map<String, dynamic>>.from(
                section["notifications"],
              );
              list.removeWhere((n) => selectedIds.contains('${n['id']}'));
              section["notifications"] = list;
            }
            selectedIds.clear();
            isSelectionMode = false;
          });
        },
      ),
    );
  }
}
