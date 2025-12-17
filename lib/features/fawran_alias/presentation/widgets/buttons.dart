import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/colors.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final String? iconPath;
  const TextButtonWidget({
    super.key,
    this.onPressed,
    required this.label,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              SvgPicture.asset(iconPath!),
              SizedBox(width: screenWidth * 0.02),
            ],
            Text(
              label,
              style: TextStyle(
                color: DefaultColors.blueLightBase,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  const ElevatedButtonWidget({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: DefaultColors.blueT1,
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.016,
              horizontal: screenWidth * 0.08,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: DefaultColors.white,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}

class RepeatTransferButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const RepeatTransferButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: DefaultColors.white,
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.016,
              horizontal: screenWidth * 0.08,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: DefaultColors.blueT1),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/fawran_icons/repeat.svg'),
              Text(
                "Repeat Transfer",
                style: TextStyle(
                  color: DefaultColors.blueT1,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
