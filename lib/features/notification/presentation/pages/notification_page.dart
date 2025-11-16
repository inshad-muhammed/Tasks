import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../constants/notifications.dart';
import '../widgets/contents.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSelectionMode = false;
  final Set<String> selectedIds = <String>{};
  String selectedFilter = 'all';

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
          //Selct button logic
          GestureDetector(
            onTap: () {
              // Initially selecton mode is false, when user taps on select button
              // it will enable the selection mode.
              setState(() {
                isSelectionMode = !isSelectionMode;
                //after select any one notification the select button  text changes to "Done",
                //when user taps on "Done" button it will disable the selection mode and clear selections.
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
          child: Divider(color: DefaultColors.grayD4),
        ),
      ),
      body: Notifications(
        isSelectionMode: isSelectionMode,
        selectedIds: selectedIds,
        onToggleSelect: (id) {
          setState(() {
            //If the id is already selected, unselect it otherwise add it.
            if (selectedIds.contains(id)) {
              //Remove the id from the set of selected ids.
              selectedIds.remove(id);
            } else {
              //Add the id to the set of selected ids.
              selectedIds.add(id);
            }
          });
        },
        sections: sections,
        selectedFilter: selectedFilter,
        //Filter button(all)
        onFilterAll: () =>
            setState(() => selectedFilter = 'all'), //Filter button(all)
        onFilterUnread: () =>
            setState(() => selectedFilter = 'unread'), //Filter button(unread)
        onFilterRead: () =>
            setState(() => selectedFilter = 'read'), //Filter button(read)
        //select all button logic
        onSelectAllToggle: () {
          setState(() {
            // Build the set of all notification ids once
            final allIds = sections
                .expand(
                  (sec) =>
                      List<Map<String, dynamic>>.from(sec['notifications']),
                )
                .map((n) => '${n['id']}')
                .toSet();

            // If everything is already selected, clear selection;
            if (selectedIds.length == allIds.length &&
                selectedIds.containsAll(allIds)) {
              selectedIds.clear();
            } else {
              selectedIds.addAll(allIds);
            }
          });
        },
        onMarkAsRead: (id) {
          setState(() {
            // Find the notification by id and mark it as read.
            for (final section in sections) {
              // Work on a shallow copy of the list and write it back to
              // avoid mutating while iterating.
              final list = List<Map<String, dynamic>>.from(
                section['notifications'],
              );
              var updated = false;
              for (final n in list) {
                if ('${n['id']}' == id) {
                  n['unread'] = false;
                  updated = true;
                  break;
                }
              }
              if (updated) {
                section['notifications'] = list;
                break;
              }
            }
          });
        },

        //delete notification buttonlogic
        onDeleteSelected: () {
          setState(() {
            // Iterate over each section and remove notifications whose ids
            // are currently present in `selectedIds`.
            // We copy the list first to avoid changing the original while iterating,
            // then assign the filtered list back to the section.
            for (final section in sections) {
              //Make a copy of the notifications list for this section.
              final current = List<Map<String, dynamic>>.from(
                section['notifications'],
              );

              //Filter out any notification 'n' whose stringified id is in selectedIds(set of notification contains selectedIds).
              section['notifications'] = current
                  .where((n) => !selectedIds.contains('${n['id']}'))
                  .toList();
            }

            //After deletion, clear the selection set and exit selection mode.
            selectedIds.clear();
            isSelectionMode = false;
          });
        },
      ),
    );
  }
}
