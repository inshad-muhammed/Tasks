import 'package:flutter/material.dart';

class BottomSheetItem {
  final String leadingIcon;
  final String label;
  final String? subLabel;
  final String? trailingIcon;
  final String? trailingIconUrl;
  final Widget? routePage;
  final void Function(BuildContext context)? onTap;

  BottomSheetItem({
    this.onTap,
    required this.leadingIcon,
    required this.label,
    this.subLabel,
    this.trailingIcon,
    this.trailingIconUrl,
    this.routePage,
  });
}
