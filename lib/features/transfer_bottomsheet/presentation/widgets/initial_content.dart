import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/continue_button.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/visiblity_selector.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/content_step_provider.dart';
import '../controllers/visiblity_provider.dart';

class InitialContent extends ConsumerWidget {
  const InitialContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.56,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.044),
            SizedBox(
              width: screenWidth * 0.5,
              child: Text(
                "Easily send money to your Dukhan Bank contacts",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.blackT,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                "Directly pay your contacts who use Dukhan Bank. No account numbers required.",
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.grayTB.withAlpha(135),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.07),
            VisibilitySelector(),
            Spacer(),
            ContinueButton(
              onPressed: () {
                final isVisible = ref.read(visibilityProvider);

                if (isVisible) {
                  ref.read(contentStepProvider.notifier).state =
                      1; // account selection
                } else {
                  ref.read(contentStepProvider.notifier).state =
                      2; // deactivated content
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
