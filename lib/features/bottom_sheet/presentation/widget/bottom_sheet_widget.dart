import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

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
    return SizedBox(
      width: double.infinity,

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.03,
          // vertical: SizeConfig.screenWidth * 0.03,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.06),
            Image.asset(imagePath),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.screenWidth * 0.054,
                color: Color(0xff0D3E7F),
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.screenWidth * 0.036,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.screenWidth * 0.12,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xff0D3E7F)),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: setupFunction,
                child: Text(
                  setupButtonText,
                  style: TextStyle(fontSize: SizeConfig.screenWidth * 0.036),
                ),
              ),
            ),
            // SizedBox(height: SizeConfig.screenHeight * 0.01),
            TextButton(
              onPressed: setuprLaterFunction,
              child: Text(
                setupLaterButtonText,
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth * 0.036,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D3E7F),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.06),
          ],
        ),
      ),
    );
  }
}
