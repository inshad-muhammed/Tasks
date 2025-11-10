import 'package:flutter/material.dart';
import 'package:tasks/core/constants/colors.dart';

class SelectionBar extends StatelessWidget {
  final int selectedCount;
  final int totalCount;
  final VoidCallback onSelectAllToggle;
  final VoidCallback onDeleteSelected;

  const SelectionBar({
    super.key,
    required this.selectedCount,
    required this.totalCount,
    required this.onSelectAllToggle,
    required this.onDeleteSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onSelectAllToggle,
            child: Row(
              spacing: 10,
              children: [
                Icon(
                  Icons.check,
                  color: DefaultColors.dashboarddarkBlue,
                  size: 12,
                ),
                Text(
                  "Select All",
                  style: TextStyle(
                    color: DefaultColors.dashboarddarkBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: selectedCount == 0 ? null : onDeleteSelected,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                border: Border.all(color: DefaultColors.dashboarddarkBlue),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: 12,
                      color: DefaultColors.dashboarddarkBlue,
                    ),
                    Text(
                      "Delete Messages",
                      style: TextStyle(
                        fontSize: 12,
                        color: DefaultColors.dashboarddarkBlue,
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
