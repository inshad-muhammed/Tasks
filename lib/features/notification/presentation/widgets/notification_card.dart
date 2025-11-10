import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/notification/presentation/widgets/highlited_text.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  final List<String> highlights;
  final String time;
  final String notificationtype;
  final bool unread;
  // final bool showButton;
  final bool isSelected;
  final String? id;
  final bool isSelectionMode;

  const NotificationCard({
    super.key,
    required this.message,
    required this.highlights,
    required this.time,
    this.unread = false,
    // this.showButton = false,
    required this.notificationtype,
    this.isSelected = false,
    required this.id,
    required this.isSelectionMode,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: unread ? DefaultColors.white : DefaultColors.blue_03,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: DefaultColors.blueLightBase, width: 2)
            : Border.all(
                color: unread ? DefaultColors.blue_01 : DefaultColors.blue_03,
                width: 1,
              ),
      ),
      child: Row(
        children: [
          Container(
            height: screenWidth * 0.084,
            width: screenWidth * 0.084,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: DefaultColors.blue_01),
            ),
            child: isSelectionMode
                ? Center(
                    child: Icon(
                      Icons.check_circle,
                      size: screenWidth * 0.05,
                      color: isSelected
                          ? DefaultColors.greenBase
                          : DefaultColors.transparent,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      "assets/notification_icons/$notificationtype.svg",
                    ),
                  ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HighlightedText(message: message, highlights: highlights),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(
            time,
            style: TextStyle(color: DefaultColors.grayMedBase, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
