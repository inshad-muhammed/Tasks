import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenWidth * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).hintColor
              : Theme.of(context).hoverColor,
          borderRadius: BorderRadius.circular(screenWidth * 1),
          border: Border.all(
            color: isSelected ? Colors.grey.shade300 : Colors.grey.shade200,
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
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            unread
                ? Container(
                    height: screenWidth * 0.03,
                    width: screenWidth * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 1),
                      color: Theme.of(context).highlightColor,
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.black,
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
