import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/content_step_provider.dart';

class DeactivateVisibiltyStateScreen extends ConsumerWidget {
  const DeactivateVisibiltyStateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 1.27,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your account is private",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              "Change to visible so friends can see you",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: DefaultColors.white_700,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ref.read(contentStepProvider.notifier).state = 1;
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DefaultColors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: DefaultColors.blueT1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Enable Visibility",
                style: TextStyle(
                  color: DefaultColors.blueT1,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
