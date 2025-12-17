import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/fawran_alias/presentation/controllers/account_selector_provider.dart';

class AccountSelectorBottomsheet extends ConsumerWidget {
  const AccountSelectorBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeigth = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeigth * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Select from account",
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Choose the account you\'d like to transfer from.',
            style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey),
          ),
          SizedBox(height: screenHeigth * 0.014),
          accountSelectorTile(
            () {
              ref.read(accountSelectorprovider.notifier).state =
                  "Savings Account xxxx2088";
              Navigator.pop(context);
            },
            "Savings Account",
            "xxxx2088",
            "889,200.00 QAR",
          ),
          Divider(),
          accountSelectorTile(
            () {
              ref.read(accountSelectorprovider.notifier).state =
                  "Current Account xxxx6238";
              Navigator.pop(context);
            },
            "Current Account",
            "xxxx6238",
            "7,540.00 QAR",
          ),
        ],
      ),
    );
  }
}

Widget accountSelectorTile(
  Function() onTap,
  String accountType,
  String accountNo,
  String balance,
) {
  final screenWidth = MediaQueryData.fromView(
    WidgetsBinding.instance.window,
  ).size.width;
  return ListTile(
    title: Text(
      accountType,
      style: TextStyle(
        fontSize: screenWidth * 0.04,
        fontWeight: FontWeight.w500,
      ),
    ),
    subtitle: Text(
      accountNo,
      style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.grey),
    ),
    trailing: Text(
      balance,
      style: TextStyle(
        fontSize: screenWidth * 0.03,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    ),
    onTap: onTap,
  );
}
