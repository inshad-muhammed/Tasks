import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final String value;
  final String selectedFilter;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.label,
    required this.value,
    required this.selectedFilter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final bool isSelected = selectedFilter == value;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? DefaultColors.dashboardBlue
              : DefaultColors.dashboardBlue.withAlpha(51),
          borderRadius: BorderRadius.circular(screenWidth * 1),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.032,
                color: isSelected ? DefaultColors.white : DefaultColors.blueT1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
