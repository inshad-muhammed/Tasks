import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../domain/models/transaction.dart';

class RecentTransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  const RecentTransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final Widget avatar;
    if (transaction.dp != null && transaction.dp!.isNotEmpty) {
      avatar = CircleAvatar(
        radius: screenWidth * 0.064,
        backgroundImage: NetworkImage(transaction.dp!),
      );
    } else {
      // Show initials when no image provided
      final initials = transaction.name.isNotEmpty
          ? transaction.name
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
        transaction.name,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: DefaultColors.black,
        ),
      ),
      subtitle: Text(
        transaction.time,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: DefaultColors.grayBase,
        ),
      ),
      trailing: Text(
        transaction.amount,
        style: TextStyle(
          color: transaction.amount.startsWith('+')
              ? DefaultColors.greenBase
              : DefaultColors.redBase,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
