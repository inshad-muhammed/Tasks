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
    return SizedBox(
      height: screenWidth * 1.27,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 70),
            SizedBox(
              width: 200,
              child: Text(
                "Easily send money to your Dukhan Bank contacts",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 300,
              child: Text(
                "Directly pay your contacts who use Dukhan Bank. No account numbers required.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.white_700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 70),
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
