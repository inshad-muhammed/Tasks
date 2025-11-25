import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../controllers/selection_provider.dart';

class SelectionBarSection extends ConsumerWidget {
  const SelectionBarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                : DefaultColors.blueLight2,
            foregroundColor: isSelected
                ? DefaultColors.white
                : DefaultColors.dashboarddarkBlue,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildFilterButton('Beneficiaries'),
          const SizedBox(width: 16),
          buildFilterButton('Contacts'),
        ],
      ),
    );
  }
}
