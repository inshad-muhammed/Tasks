import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.03,
          vertical: SizeConfig.screenWidth * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 1),
          border: Border.all(
            color: isSelected ? Colors.grey.shade300 : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: SizeConfig.screenWidth * 0.03,
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
