import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/colors.dart';
import '../controllers/visiblity_provider.dart';

class VisibilitySelector extends ConsumerWidget {
  const VisibilitySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(visibilityProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose your Visibility",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: DefaultColors.black,
          ),
        ),
        RadioListTile<bool>(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Activate Visibility",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.black,
                ),
              ),
              Text(
                "Contacts who have your number can see you in their list",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.white_700,
                ),
              ),
            ],
          ),
          value: true,
          groupValue: isVisible,
          onChanged: (value) {
            ref.read(visibilityProvider.notifier).state = value!;
          },
        ),
        RadioListTile<bool>(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deactivate Visibility",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.black,
                ),
              ),
              Text(
                "You won't appear in anyone's list and can't see others",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.white_700,
                ),
              ),
            ],
          ),
          value: false,
          groupValue: isVisible,
          onChanged: (value) {
            ref.read(visibilityProvider.notifier).state = value!;
          },
        ),
      ],
    );
  }
}
