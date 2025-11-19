import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../domain/models/beneficiary.dart';
import '../constants/beneficiaries_static_data.dart';

/// Holds the currently selected transaction type filter (null = all).
final selectedFilterProviderBeneficiaries = StateProvider<String?>(
  (ref) => null,
);

/// Computes the filtered transaction list based on selectedFilterProvider.
final filteredBeneficiariesProvider = Provider<List<Beneficiary>>((ref) {
  final selected = ref.watch(selectedFilterProviderBeneficiaries);
  if (selected == null) {
    return beneficiariesStatic.values
        .expand((list) => list)
        .toList(growable: false);
  }
  return List<Beneficiary>.unmodifiable(
    beneficiariesStatic[selected] ?? const [],
  );
});
