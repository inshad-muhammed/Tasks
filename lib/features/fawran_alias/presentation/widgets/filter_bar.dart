import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/filter_button.dart';

import '../controllers/filter_provider.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final filter = ref.watch(aliasFilterProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Row(
          spacing: screenWidth * 0.02,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterButton(
              label: "Alias name",
              value: "name",
              selectedFilter: filter,
              onTap: () {
                if (filter != "name") {
                  ref.read(aliasFilterProvider.notifier).state = "name";
                } else {
                  ref.read(aliasFilterProvider.notifier).state = "";
                }
              },
            ),

            FilterButton(
              label: "Mobile number",
              value: "number",
              selectedFilter: filter,
              onTap: () {
                if (filter != "number") {
                  ref.read(aliasFilterProvider.notifier).state = "number";
                } else {
                  ref.read(aliasFilterProvider.notifier).state = "";
                }
              },
            ),

            FilterButton(
              label: "IBAN alias",
              value: "iban",
              selectedFilter: filter,
              onTap: () {
                if (filter != "iban") {
                  ref.read(aliasFilterProvider.notifier).state = "iban";
                } else {
                  ref.read(aliasFilterProvider.notifier).state = "";
                }
              },
            ),
            FilterButton(
              label: "Corporate IBAN",
              value: "corporate_iban",
              selectedFilter: filter,
              onTap: () {
                if (filter != "corporate_iban") {
                  ref.read(aliasFilterProvider.notifier).state =
                      "corporate_iban";
                } else {
                  ref.read(aliasFilterProvider.notifier).state = "";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
