import 'package:flutter/material.dart';
import 'package:tasks/features/notification/presentation/widgets/filter_button.dart';

import '../../../../core/constants/colors.dart';

class FilterBar extends StatelessWidget {
  final String selected; // 'all' | 'unread' | 'read'
  final VoidCallback onAll;
  final VoidCallback onUnread;
  final VoidCallback onRead;

  const FilterBar({
    super.key,
    required this.selected,
    required this.onAll,
    required this.onUnread,
    required this.onRead,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.06,
      child: Row(
        spacing: 10,
        children: [
          FilterButton(
            label: "All",
            isSelected: selected == 'all',
            onTap: onAll,
          ),
          FilterButton(
            unread: true,
            label: "Unread",
            isSelected: selected == 'unread',
            onTap: onUnread,
          ),
          FilterButton(
            label: "Read",
            isSelected: selected == 'read',
            onTap: onRead,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  Icons.done_all,
                  color: DefaultColors.blueLightBase,
                  size: 13,
                ),
                SizedBox(width: 8),

                Text(
                  "Mark as Read",
                  style: TextStyle(
                    color: DefaultColors.blueLightBase,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
