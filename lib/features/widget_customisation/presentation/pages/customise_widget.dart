import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

import 'package:tasks/features/widget_customisation/presentation/controllers/loading_provider.dart';
import 'package:tasks/features/widget_customisation/presentation/controllers/show_state_providers.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/active_billers.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/card_spend.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/credit_card_bills.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/shimmer_effect.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/widget_type.dart';

import '../../../../core/constants/colors.dart';

class CustomiseWidgetPage extends ConsumerWidget {
  const CustomiseWidgetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeBillState = ref.watch(activeBillProvider);
    final cardSpendState = ref.watch(cardSpendProvider);
    final creditCardBillState = ref.watch(creditCardProvider);
    final isLoading = ref.watch(loadingProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: DefaultColors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Icon(Icons.arrow_back_ios, size: 20),

        titleSpacing: 0,
        title: Text(
          "Customise Widgets",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: DefaultColors.blueDarkBase,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [DefaultColors.blue_200, DefaultColors.white],
            ),
          ),
        ),
      ),
      body: isLoading
          ? Shimmer.fromColors(
              baseColor: DefaultColors.white_500,
              highlightColor: DefaultColors.white_600,
              child: ShimmerEffectWidgetCustomisation(),
            )
          : Container(
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                border: Border(
                  top: BorderSide(color: DefaultColors.dashboardLightBlue),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 24,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenWidth * 0.08),
                      Text(
                        "Pinned",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: DefaultColors.black,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      WidgetType(
                        activeBillProvider,
                        cardType: "Your Active Billers",
                        function: () {
                          ref.read(activeBillProvider.notifier).state =
                              !activeBillState;
                        },
                      ),
                      activeBillState
                          ? Column(
                              children: [
                                SizedBox(height: 4),
                                BillerCard(),
                                SizedBox(height: 10),
                              ],
                            )
                          : SizedBox(height: 10),

                      WidgetType(
                        cardSpendProvider,
                        cardType: "Card Spends",
                        function: () {
                          ref.read(cardSpendProvider.notifier).state =
                              !cardSpendState;
                        },
                      ),
                      cardSpendState
                          ? Column(
                              children: [
                                SizedBox(height: 4),
                                CardSpend(),
                                SizedBox(height: 10),
                              ],
                            )
                          : SizedBox(height: 10),

                      WidgetType(
                        creditCardProvider,
                        cardType: "Credit Card Bills",
                        function: () {
                          ref.read(creditCardProvider.notifier).state =
                              !creditCardBillState;
                        },
                      ),
                      creditCardBillState
                          ? Column(
                              children: [
                                SizedBox(height: 4),
                                CreditCardBills(),
                              ],
                            )
                          : SizedBox(height: 10),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
