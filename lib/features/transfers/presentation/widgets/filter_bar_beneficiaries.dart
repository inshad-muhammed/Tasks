import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../providers/beneficiaries_filter_provider.dart';

class FilterBarBeneficiaries extends ConsumerWidget {
  const FilterBarBeneficiaries({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedFilterProviderBeneficiaries);

    Widget buildFilterButton(String text, List<String> values) {
      final sel = selected;
      final isSelected =
          sel != null &&
          sel.length == values.length &&
          Set.from(sel).containsAll(values);
      return ElevatedButton(
        onPressed: () {
          // clear selection if tapping the same button and shows full list
          ref
              .read(selectedFilterProviderBeneficiaries.notifier)
              .update((_) => isSelected ? null : List<String>.from(values));
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
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
          Row(
            children: [
              Icon(Icons.add, color: DefaultColors.dashboarddarkBlue),
              Text(
                "New",
                style: TextStyle(
                  fontSize: 16,
                  color: DefaultColors.dashboarddarkBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          buildFilterButton('Western Union', ['Attijari Bank']),
          const SizedBox(width: 8),
          buildFilterButton('Within Dukhan', ['Dukhan Bank (QA)']),
          const SizedBox(width: 8),
          buildFilterButton('Within Qatar', [
            'Dukhan Bank (QA)',
            'Attijari Bank',
          ]),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
