import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/features/transfers/presentation/constants/beneficiaries.dart';

/// Holds the currently selected transaction type filter (null = all).
final selectedFilterProviderBeneficiaries = StateProvider<List<String>?>(
  (ref) => null,
);

/// Computes the filtered transaction list based on selectedFilterProvider.
final filteredBeneficiariesProvider = Provider<List<Map<String, dynamic>>>((
  ref,
) {
  final selected = ref.watch(selectedFilterProviderBeneficiaries);
  if (selected == null) return beneficiariesList;
  final selectedSet = Set<String>.from(selected);
  return beneficiariesList
      .where((t) => selectedSet.contains((t['bank'] as String)))
      .toList();
});
