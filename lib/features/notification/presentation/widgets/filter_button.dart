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
        child: Row(
          spacing: SizeConfig.screenWidth * 0.01,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: SizeConfig.screenWidth * 0.03,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            unread
                ? Container(
                    height: SizeConfig.screenWidth * 0.03,
                    width: SizeConfig.screenWidth * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeConfig.screenWidth * 1,
                      ),
                      color: Color(0xff4197CB),
                    ),
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.screenWidth * 0.016,
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
