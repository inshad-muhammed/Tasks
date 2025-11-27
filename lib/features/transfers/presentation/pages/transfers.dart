import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/features/transfers/presentation/widgets/shimmer_effect.dart';
import '../../../../core/constants/colors.dart';
import '../providers/loading_provider.dart';
import '../widgets/beneficiaries.dart';
import '../widgets/favourites.dart';
import '../widgets/recent_transaction.dart';
import '../widgets/section_header.dart';
import '../widgets/tranfer_money_card.dart';

class TransferPage extends ConsumerWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isLoading = ref.watch(loadingProvider);
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
      body: isLoading
          ? Shimmer.fromColors(
              baseColor: DefaultColors.white_500,
              highlightColor: DefaultColors.white_600,
              child: ShimmerEffect(),
            )
          : Container(
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
                      SectionHeader(title: 'Favourites'),
                      SizedBox(height: screenHeight * 0.02),
                      Favourites(),
                      SizedBox(height: screenHeight * 0.028),
                      TransferMoneyCard(),
                      SizedBox(height: screenHeight * 0.028),
                      SectionHeader(
                        title: "Beneficiaries",
                        showAddButton: true,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      BeneficiariesSection(),
                      SizedBox(height: screenHeight * 0.028),
                      SectionHeader(title: "Recent Transactions"),
                      SizedBox(height: screenHeight * 0.02),
                      RecentTransactionSection(),
                      SizedBox(height: screenHeight * 0.08),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
