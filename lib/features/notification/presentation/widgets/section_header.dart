import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: DefaultColors.darkestGray,
      ),
    );
  }
}
