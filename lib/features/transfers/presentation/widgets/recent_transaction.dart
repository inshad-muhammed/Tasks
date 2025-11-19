import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/transfers/domain/models/transaction.dart';
import 'package:tasks/features/transfers/presentation/widgets/filter_bar_transactions.dart';
import '../providers/transaction_filter_provider.dart';

class RecentTransactionSection extends ConsumerWidget {
  const RecentTransactionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final filtered = ref.watch(filteredTransactionsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterBarTransactions(),
        SizedBox(height: screenHeight * 0.018),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.02),
          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            border: Border.all(color: DefaultColors.grayD4, width: 1),
          ),

          child: ListView.separated(
            shrinkWrap: true,
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final TransactionModel transaction = filtered[index];
              final name = transaction.name;
              final time = transaction.time;
              final dp = transaction.dp;
              final amount = transaction.amount;
              final Widget avatar;
              if (dp != null && dp.isNotEmpty) {
                avatar = CircleAvatar(
                  radius: screenWidth * 0.064,
                  backgroundImage: NetworkImage(dp),
                );
              } else {
                // Show initials when no image provided
                final initials = name.isNotEmpty
                    ? name
                          .trim()
                          .split(' ')
                          .map((e) => e.isNotEmpty ? e[0] : '')
                          .take(2)
                          .join()
                    : '';
                avatar = CircleAvatar(
                  backgroundColor: DefaultColors.white,
                  radius: screenWidth * 0.064,
                  child: CircleAvatar(
                    radius: screenWidth * 0.06,
                    backgroundColor: DefaultColors.blueLight1,
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: DefaultColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }
              return ListTile(
                leading: avatar,
                title: Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: DefaultColors.black,
                  ),
                ),
                subtitle: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: DefaultColors.grayBase,
                  ),
                ),
                trailing: Text(
                  amount,
                  style: TextStyle(
                    color: amount.startsWith('+')
                        ? DefaultColors.greenBase
                        : DefaultColors.redBase,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: const Divider(height: 1, color: DefaultColors.grayD4),
            ),
          ),
        ),
      ],
    );
  }
}
