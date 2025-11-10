import 'package:flutter/material.dart';
import 'package:tasks/core/constants/colors.dart';

// ignore: must_be_immutable
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  bool unread;

  FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.unread = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? DefaultColors.white : DefaultColors.grayD4,
          borderRadius: BorderRadius.circular(80),
          border: Border.all(
            color: isSelected ? DefaultColors.grayD5 : DefaultColors.grayD4,
            width: 1,
          ),
        ),
        child: Row(
          spacing: screenWidth * 0.01,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: isSelected
                    ? DefaultColors.black
                    : DefaultColors.grayBase,
                fontWeight: FontWeight.bold,
              ),
            ),
            unread
                ? Container(
                    height: screenWidth * 0.03,
                    width: screenWidth * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: DefaultColors.blueLightBase,
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: DefaultColors.white,
                          fontSize: screenWidth * 0.016,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
