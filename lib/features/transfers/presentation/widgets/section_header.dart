import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showAddButton;
  final VoidCallback? onTap;
  const SectionHeader({
    super.key,
    required this.title,
    this.showAddButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: DefaultColors.black,
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.dashboardBlue,
                ),
              ),
            ),
            showAddButton
                ? IconButton(
                    onPressed: onTap,
                    icon: Icon(Icons.add, color: DefaultColors.dashboardBlue),
                  )
                : SizedBox(),
          ],
        ),
      ],
    );
  }
}
