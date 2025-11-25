import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/controllers/account_selection_provider.dart';
import '../../../../core/constants/colors.dart';

class AccountSelector extends ConsumerWidget {
  const AccountSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final selected = ref.watch(accountSelectionProvider);

    Widget buildAccountTile({
      required String id,
      required String title,
      required String accountNumber,
      required String balance,
    }) {
      final bool isSelected = selected == id;

      return GestureDetector(
        onTap: () {
          ref.read(accountSelectionProvider.notifier).state = id;
        },
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? DefaultColors.dashboardBlue
                  : DefaultColors.white_700,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      accountNumber,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.white_700,
                      ),
                    ),
                  ],
                ),
                Text(
                  balance,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        buildAccountTile(
          id: "savings",
          title: "Savings Account",
          accountNumber: "xxxx2088",
          balance: "889,200.00 QAR",
        ),
        const SizedBox(height: 12),
        buildAccountTile(
          id: "current",
          title: "Current Account",
          accountNumber: "xxxx6238",
          balance: "7,540.00 QAR",
        ),
      ],
    );
  }
}
