import 'package:flutter/material.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/buttons.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String message;
  final String mainButtonText;
  final String? subButtonText;
  final VoidCallback mainFunction;

  const CustomPopup({
    super.key,
    required this.title,
    required this.message,
    required this.mainButtonText,
    this.subButtonText,
    required this.mainFunction,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: DefaultColors.black,
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.05,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: DefaultColors.gray102,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.032),
          ElevatedButtonWidget(label: mainButtonText, onPressed: mainFunction),
          if (subButtonText != null)
            TextButtonWidget(
              label: subButtonText!,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
