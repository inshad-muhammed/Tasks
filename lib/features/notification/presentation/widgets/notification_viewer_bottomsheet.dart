import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class NotificationViewerBottomsheet extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  const NotificationViewerBottomsheet({
    super.key,
    required this.title,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: screenWidth * 0.05),
            Text(
              title,
              style: TextStyle(
                color: DefaultColors.dashboarddarkBlue,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/notification_icons/received.png",
                  height: 109,
                  width: 109,
                ),
                Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        message,
                        style: TextStyle(
                          color: DefaultColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Text(
                      time,
                      style: TextStyle(
                        color: DefaultColors.grayMedBase,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  side: BorderSide(color: DefaultColors.blueDarkBase),
                  backgroundColor: DefaultColors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Close",
                    style: TextStyle(color: DefaultColors.blueDarkBase),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
