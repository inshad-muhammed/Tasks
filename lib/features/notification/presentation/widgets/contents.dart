import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'filter_bar.dart';
import 'notification_card.dart';
import 'notification_viewer_bottomsheet.dart';
import 'section_header.dart';
import 'selction_bar.dart';

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
  final void Function(String id) onMarkAsRead;

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
    required this.onMarkAsRead,
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
            children: [_buildTopBar(), ..._buildSections(context)],
          ),
        ),
      ),
    );
  }

  //Builds the top bar: SelectionBar if items are selected, FilterBar otherwise.
  Widget _buildTopBar() {
    if (selectedIds.isNotEmpty) {
      return SelectionBar(
        selectedCount: selectedIds.length,
        // Provide total unread count so SelectionBar can show or use it.
        totalCount: sections
            .expand((sec) => List<Map<String, dynamic>>.from(sec['notifications']))
            .where((n) => (n['unread'] ?? false) == true)
            .length,
        onSelectAllToggle: onSelectAllToggle,
        onDeleteSelected: onDeleteSelected,
      );
    } else {
      return FilterBar(
        selected: selectedFilter,
        onAll: onFilterAll,
        onUnread: onFilterUnread,
        onRead: onFilterRead,
      );
    }
  }

  //Builds a list of section widgets based on the current filter.
  List<Widget> _buildSections(BuildContext context) {
    return sections.map((section) {
      final filteredItems = _filterNotifications(section['notifications']);
      if (filteredItems.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader('${section['date']}'),
          const SizedBox(height: 8),
          ..._buildNotificationCards(context, filteredItems),
        ],
      );
    }).toList();
  }

  //Filters notifications based on the current selectedFilter.
  List<Map<String, dynamic>> _filterNotifications(
    List<Map<String, dynamic>> notifications,
  ) {
    final items = List<Map<String, dynamic>>.from(notifications);

    return items.where((n) {
      final isUnread = (n['unread'] ?? false) == true;

      if (selectedFilter == 'all') return true;
      if (selectedFilter == 'unread') return isUnread;
      return !isUnread; // 'read' filter
    }).toList();
  }

  //Builds notification card widgets for a list of notifications.
  List<Widget> _buildNotificationCards(
    BuildContext context,
    List<Map<String, dynamic>> notifications,
  ) {
    return notifications.map((notif) {
      final id = '${notif['id']}';
      final isSelected = selectedIds.contains(id);

      return _buildNotificationItem(context, notif, id, isSelected);
    }).toList();
  }

  //Builds a single notification item (card and tap functon).
  Widget _buildNotificationItem(
    BuildContext context,
    Map<String, dynamic> notif,
    String id,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () => _handleNotificationTap(context, notif, id),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: NotificationCard(
          id: id,
          message: '${notif['message']}',
          time: '${notif['time']}',
            highlights: _normalizeHighlights(notif['highlights']),
          notificationtype: '${notif['notificationtype']}',
          unread: (notif['unread'] ?? false) == true,
          isSelected: isSelected,
          isSelectionMode: isSelectionMode,
        ),
      ),
    );
  }

  //Handles the tap on a notification: toggle selection or show viewer.
  void _handleNotificationTap(
    BuildContext context,
    Map<String, dynamic> notif,
    String id,
  ) {
    if (isSelectionMode) {
      onToggleSelect(id);
    } else {
      // Notify parent that this notification has been opened/read so it can
      // update the underlying data (mark unread -> false). Parent will
      // rebuild and the current filter (e.g., 'unread') will then exclude it.
      try {
        onMarkAsRead(id);
      } catch (_) {
        // Defensive: if parent handler throws, we still show the viewer.
      }

      _showNotificationViewer(context, notif);
    }
  }

  //Shows the notification details in bottom sheet.
  void _showNotificationViewer(
    BuildContext context,
    Map<String, dynamic> notif,
  ) {
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

  /// Normalizes highlights into a List<String>.
  /// if higlight is empty return empty list
  /// single String return that string in a list [that string]
  /// list<dynamic> changes  to List<String>
  List<String> _normalizeHighlights(dynamic highlights) {
    if (highlights == null) return const <String>[];
    if (highlights is String) return [highlights];
    return List<String>.from(highlights as List);
  }
}
