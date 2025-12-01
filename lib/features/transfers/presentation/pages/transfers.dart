import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/features/dashbord/presentation/widgets/custom_bottom_sheet.dart';
import 'package:tasks/features/transfers/presentation/constants/beneficiary_type_list.dart';
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
      backgroundColor: DefaultColors.blueT1,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: DefaultColors.blueT1,
        foregroundColor: DefaultColors.white,
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transfers',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return CustomBottomSheet(
                    title: "New beneficiary",
                    subTitle: "Choose the account you'd like to transfer from",
                    itemList: beneficiaryTypeList,
                  );
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: DefaultColors.white,
        ),
        child: isLoading
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
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return CustomBottomSheet(
                                  title: "New beneficiary",
                                  subTitle:
                                      "Choose the account you'd like to transfer from",
                                  itemList: beneficiaryTypeList,
                                );
                              },
                            );
                          },
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
      ),
    );
  }
}
