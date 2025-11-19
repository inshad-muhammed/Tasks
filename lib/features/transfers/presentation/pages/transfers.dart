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
    final screenHeight = MediaQuery.of(context).size.height;
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
                SizedBox(height: screenHeight * 0.02),
                Favourites(),
                SizedBox(height: screenHeight * 0.028),
                TransferMoneyCard(),
                SizedBox(height: screenHeight * 0.028),
                SectionHeader(title: "Recent Transactions", showButton: true),
                SizedBox(height: screenHeight * 0.02),
                RecentTransactionSection(),
                SizedBox(height: screenHeight * 0.028),
                SectionHeader(title: "Beneficiaries", showButton: true),
                SizedBox(height: screenHeight * 0.02),
                BeneficiariesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
