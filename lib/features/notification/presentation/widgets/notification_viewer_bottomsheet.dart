import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

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
    final theme = Theme.of(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: SizeConfig.screenWidth * 0.05),
            Text(
              title,
              style: TextStyle(
                color: theme.splashColor,
                fontSize: SizeConfig.screenWidth * 0.05,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/notification_icons/received.png",
                  height: SizeConfig.screenWidth * 0.22,
                  width: SizeConfig.screenWidth * 0.22,
                ),
                Column(
                  spacing: SizeConfig.screenWidth * 0.02,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.56,
                      child: Text(
                        message,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: SizeConfig.screenWidth * 0.036,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: SizeConfig.screenWidth * 0.032,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.05),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: const Color(0xff0D3E7F)),
                  backgroundColor: theme.scaffoldBackgroundColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenWidth * 0.032,
                  ),
                  child: Text(
                    "Close",
                    style: TextStyle(color: const Color(0xff0D3E7F)),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenWidth * 0.03),
          ],
        ),
      ),
    );
  }
}
