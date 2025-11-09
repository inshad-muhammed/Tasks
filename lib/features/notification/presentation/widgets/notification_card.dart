import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/notification/presentation/controllers/selection_mode_providers.dart';
import 'package:tasks/features/notification/presentation/widgets/highlited_text.dart';

class NotificationCard extends ConsumerWidget {
  final String message;
  final List<String> highlights;
  final String time;
  final String notificationtype;
  final bool unread;
  // final bool showButton;
  final bool isSelected;
  final String? id;

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
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final isSelectionMode = ref.watch(selectionModeProvider);
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
      decoration: BoxDecoration(
        color: unread ? theme.cardColor : theme.disabledColor,
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.03),
        border: isSelected
            ? Border.all(color: Color(0xff4197CB), width: 2)
            : Border.all(
                color: unread
                    ? Color(0xff4197CB)
                    : Theme.of(context).shadowColor,
                width: 1,
              ),
      ),
      child: Row(
        children: [
          Container(
            height: SizeConfig.screenWidth * 0.084,
            width: SizeConfig.screenWidth * 0.084,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.5),
              border: Border.all(color: Color(0xff4197CB)),
            ),
            child: isSelectionMode
                ? Center(
                    child: Icon(
                      Icons.check_circle,
                      size: SizeConfig.screenWidth * 0.05,
                      color: isSelected ? Colors.green : Colors.transparent,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(SizeConfig.screenWidth * 0.016),
                    child: SvgPicture.asset(
                      "assets/notification_icons/$notificationtype.svg",
                    ),
                  ),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HighlightedText(message: message, highlights: highlights),
              ],
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.01),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: SizeConfig.screenWidth * 0.024,
            ),
          ),
          // if (showButton)
          //   Row(
          //     children: [
          //       SizedBox(width: SizeConfig.screenWidth * 0.1),
          //       ElevatedButton(
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: const Color(0xff0D3E7F),
          //           foregroundColor: Colors.white,
          //           minimumSize: Size(
          //             SizeConfig.screenWidth * 0.12,
          //             SizeConfig.screenWidth * 0.07,
          //           ),
          //           padding: EdgeInsets.symmetric(
          //             horizontal: SizeConfig.screenWidth * 0.01,
          //             vertical: SizeConfig.screenWidth * 0.01,
          //           ),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(
          //               SizeConfig.screenWidth * 0.05,
          //             ),
          //           ),
          //         ),
          //         child: Text(
          //           s.payButtonText,
          //           style: TextStyle(fontSize: SizeConfig.screenWidth * 0.03),
          //         ),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
