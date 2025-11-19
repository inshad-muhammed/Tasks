import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../providers/transaction_filter_provider.dart';

class FilterBarTransactions extends ConsumerWidget {
  const FilterBarTransactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final selected = ref.watch(selectedFilterProvider);

    Widget buildFilterButton(String text, String value) {
      final isSelected = selected == value;
      return ElevatedButton(
        onPressed: () {
          // clear selection if tapping the same button and show all
          ref.read(selectedFilterProvider.notifier).state = isSelected
              ? null
              : value;
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.2),
          ),
          backgroundColor: isSelected
              ? DefaultColors.dashboarddarkBlue
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
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildFilterButton('Western Union', 'Western Union'),
          const SizedBox(width: 8),
          buildFilterButton('Within Dukhan', 'Within Dukhan'),
          const SizedBox(width: 8),
          buildFilterButton('Within Qatar', 'Within Qatar'),
          const SizedBox(width: 8),
          buildFilterButton('International', 'International'),
        ],
      ),
    );
  }
}
