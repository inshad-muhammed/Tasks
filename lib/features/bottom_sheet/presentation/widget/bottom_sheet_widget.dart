import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class BottomSheetWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String setupButtonText;
  final String setupLaterButtonText;
  final VoidCallback setupFunction;
  final VoidCallback setuprLaterFunction;
  const BottomSheetWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.setupFunction,
    required this.setuprLaterFunction,
    required this.setupButtonText,
    required this.setupLaterButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,

      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: DefaultColors.blueDarkBase,
              ),
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: DefaultColors.darksetGray,
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: screenWidth * 0.12,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(DefaultColors.blueC1),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: setupFunction,
                child: Text(setupButtonText, style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: setuprLaterFunction,
              child: Text(
                setupLaterButtonText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.dashboarddarkBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
