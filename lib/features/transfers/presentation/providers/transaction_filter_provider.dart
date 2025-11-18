import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../constants/transaction_list.dart';

/// Holds the currently selected transaction type filter (null = all).
final selectedFilterProvider = StateProvider<String?>((ref) => null);

/// Computes the filtered transaction list based on selectedFilterProvider.
final filteredTransactionsProvider = Provider<List<Map<String, dynamic>>>((
  ref,
) {
  final selected = ref.watch(selectedFilterProvider);
  if (selected == null) return transactionList;
  return transactionList
      .where((t) => (t['type'] as String) == selected)
      .toList();
});
