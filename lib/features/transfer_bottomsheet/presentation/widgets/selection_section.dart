import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../controllers/selection_provider.dart';

class SelectionBarSection extends ConsumerWidget {
  const SelectionBarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final selected = ref.watch(selectionProvider);

    Widget buildFilterButton(String text) {
      final bool isSelected = selected == text;

      return SizedBox(
        width: screenWidth * 0.44,
        height: screenWidth * 0.12,
        child: ElevatedButton(
          onPressed: () {
            ref.read(selectionProvider.notifier).state = text;
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 1),
            ),
            backgroundColor: isSelected
                ? DefaultColors.dashboardBlue
                : DefaultColors.dashboardBlue.withAlpha(51),
            foregroundColor: isSelected
                ? DefaultColors.white
                : DefaultColors.blueT1,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.036,
              vertical: screenHeight * 0.01,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.036,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildFilterButton('Beneficiaries'),
          SizedBox(width: screenWidth * 0.04),
          buildFilterButton('Contacts'),
        ],
      ),
    );
  }
}
