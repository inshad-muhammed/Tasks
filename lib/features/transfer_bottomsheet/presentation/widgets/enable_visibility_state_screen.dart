import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/linked_account.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/visiblity_selector.dart';

import '../../../../core/constants/colors.dart';
import '../controllers/content_step_provider.dart';
import '../controllers/visiblity_provider.dart';
import 'continue_button.dart';

class EnableVisibilityStateScreen extends ConsumerWidget {
  const EnableVisibilityStateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new, size: screenWidth * 0.04),
              ),
              SizedBox(
                width: screenWidth * 0.8,
                child: Text(
                  "Select your linked account to transfer and receive from your friends",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    color: DefaultColors.blackT,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.026),
          VisibilitySelector(),
          SizedBox(height: screenHeight * 0.026),
          LinkedAccount(),

          Spacer(),
          ContinueButton(
            onPressed: () {
              final isVisible = ref.read(visibilityProvider);

              if (isVisible) {
                ref.read(contentStepProvider.notifier).state = 3;
              } else {
                ref.read(contentStepProvider.notifier).state = 2;
              }
            },
          ),
        ],
      ),
    );
  }
}
