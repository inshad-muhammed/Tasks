import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/account_selector.dart';
import '../controllers/content_step_provider.dart';
import 'continue_button.dart';

class AccountSelectionContent extends ConsumerWidget {
  const AccountSelectionContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 1.27,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              ref.read(contentStepProvider.notifier).state = 0;
            },
            child: Row(
              spacing: 2,
              children: [
                Icon(Icons.arrow_back_ios_new, size: screenWidth * 0.04),
                Text(
                  "Back",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 320,
            child: Text(
              "Select your linked account to transfer and receive from your friends",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: DefaultColors.black,
              ),
            ),
          ),
          SizedBox(height: 40),
          AccountSelector(),
          Spacer(),
          ContinueButton(
            onPressed: () {
              ref.read(contentStepProvider.notifier).state = 3;
            },
          ),
        ],
      ),
    );
  }
}
