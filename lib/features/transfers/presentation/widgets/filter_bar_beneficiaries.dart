import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../constants/beneficiaries_static_data.dart';
import '../providers/beneficiaries_filter_provider.dart';

class FilterBarBeneficiaries extends ConsumerWidget {
  const FilterBarBeneficiaries({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final selected = ref.watch(selectedFilterProviderBeneficiaries);
    final categories = beneficiariesStatic.keys.toList();

    Widget buildFilterButton(String text) {
      final isSelected = selected == text;
      return ElevatedButton(
        onPressed: () {
          ref
              .read(selectedFilterProviderBeneficiaries.notifier)
              .update((_) => isSelected ? null : text);
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
          ...List.generate(categories.length, (index) {
            final category = categories[index];
            return Row(
              children: [
                buildFilterButton(category),
                if (index != categories.length - 1) const SizedBox(width: 8),
              ],
            );
          }),
        ],
      ),
    );
  }
}
