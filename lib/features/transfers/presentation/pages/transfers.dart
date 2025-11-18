import 'package:flutter/material.dart';
import 'package:tasks/features/transfers/presentation/widgets/beneficiaries.dart';
import 'package:tasks/features/transfers/presentation/widgets/favourites.dart';
import 'package:tasks/features/transfers/presentation/widgets/recent_transaction.dart';
import 'package:tasks/features/transfers/presentation/widgets/section_header.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/tranfer_money_card.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transfers',
          style: TextStyle(
            color: DefaultColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: DefaultColors.black),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: DefaultColors.black),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Column(
              children: [
                SectionHeader(title: 'Favourites', showButton: true),
                const SizedBox(height: 16),
                Favourites(),
                const SizedBox(height: 32),
                TransferMoneyCard(),
                const SizedBox(height: 32),
                SectionHeader(title: "Recent Transactions", showButton: true),
                const SizedBox(height: 16),
                RecentTransactionSection(),
                const SizedBox(height: 32),
                SectionHeader(title: "Beneficiaries", showButton: true),
                const SizedBox(height: 16),
                BeneficiariesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
