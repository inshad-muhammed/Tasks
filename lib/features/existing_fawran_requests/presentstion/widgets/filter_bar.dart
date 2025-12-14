import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/filter_button.dart';

import '../constants/requests_data.dart';
import '../controllers/filter_provider.dart';

class FilterBar extends ConsumerWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(requestFilterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterButton(
          label: "Received (${receivedRequests.length})",
          value: "received",
          selectedFilter: filter,
          onTap: () {
            ref.read(requestFilterProvider.notifier).state = "received";
          },
        ),

        FilterButton(
          label: "Sent (${sentRequests.length})",
          value: "sent",
          selectedFilter: filter,
          onTap: () {
            ref.read(requestFilterProvider.notifier).state = "sent";
          },
        ),
      ],
    );
  }
}
