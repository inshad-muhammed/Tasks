import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/transfers/domain/models/transaction.dart';
import 'package:tasks/features/transfers/presentation/constants/transaction_list.dart';
import 'package:tasks/features/transfers/presentation/widgets/empty_state_widgets/empty_transactions_card.dart';
import 'package:tasks/features/transfers/presentation/widgets/recent_transaction_tile.dart';

class RecentTransactionSection extends ConsumerWidget {
  const RecentTransactionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Original transaction list
    final List<TransactionModel> transactions = transactionList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        transactions.isEmpty
            ? RecentTransactionsCard()
            : Container(
                decoration: BoxDecoration(
                  border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.028),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return RecentTransactionTile(transaction: transaction);
                    },
                    separatorBuilder: (context, index) =>
                        Divider(color: DefaultColors.grayTB.withAlpha(51)),
                  ),
                ),
              ),
      ],
    );
  }
}
