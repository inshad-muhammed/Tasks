import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class InfoText extends StatelessWidget {
  final String message;
  const InfoText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: DefaultColors.blueLightBase.withAlpha(51),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Icon(Icons.info_outline_rounded),
          SizedBox(
            width: screenWidth * 0.75,
            child: Text(
              message,

              style: TextStyle(color: DefaultColors.blackT, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
