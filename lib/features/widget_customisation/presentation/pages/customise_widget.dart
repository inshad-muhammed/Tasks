import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/widget_customisation.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/widget_customisation/presentation/controllers/loading_provider.dart';
import 'package:tasks/features/widget_customisation/presentation/controllers/show_state_providers.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/active_billers.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/card_spend.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/credit_card_bills.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/shimmer_effect.dart';
import 'package:tasks/features/widget_customisation/presentation/widgets/widget_type.dart';

class CustomiseWidgetPage extends ConsumerWidget {
  const CustomiseWidgetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = DefaultStrings.instance;
    final activeBillState = ref.watch(activeBillProvider);
    final cardSpendState = ref.watch(cardSpendProvider);
    final creditCardBillState = ref.watch(creditCardProvider);
    final isLoading = ref.watch(loadingProvider);
    final theme = Theme.of(context);
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Icon(Icons.arrow_back, size: SizeConfig.screenWidth * 0.06),
        leadingWidth: SizeConfig.screenWidth * 0.15,
        titleSpacing: 0,
        title: Text(
          s.widgetCustomisationTitle,
          style: TextStyle(
            fontSize: SizeConfig.screenWidth * 0.05,
            fontWeight: FontWeight.w900,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.surfaceContainerHigh,
                theme.scaffoldBackgroundColor,
              ],
            ),
          ),
        ),
      ),
      body: isLoading
          ? Shimmer.fromColors(
              baseColor: theme.colorScheme.onPrimaryContainer,
              highlightColor: theme.colorScheme.inversePrimary,
              child: ShimmerEffectWidgetCustomisation(),
            )
          : Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.screenWidth * 0.07),
                  topRight: Radius.circular(SizeConfig.screenWidth * 0.07),
                ),
                border: Border(
                  top: BorderSide(color: theme.colorScheme.inverseSurface),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.06,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.screenWidth * 0.08),
                      Text(
                        s.header,
                        style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.044,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenWidth * 0.04),
                      WidgetType(
                        activeBillProvider,
                        cardType: s.pinnedItem1,
                        function: () {
                          ref.read(activeBillProvider.notifier).state =
                              !activeBillState;
                        },
                      ),
                      activeBillState
                          ? Column(
                              children: [
                                SizedBox(height: SizeConfig.screenWidth * 0.01),
                                BillerCard(),
                                SizedBox(
                                  height: SizeConfig.screenWidth * 0.042,
                                ),
                              ],
                            )
                          : SizedBox(height: SizeConfig.screenWidth * 0.02),

                      WidgetType(
                        cardSpendProvider,
                        cardType: s.cardSpendTitle,
                        function: () {
                          ref.read(cardSpendProvider.notifier).state =
                              !cardSpendState;
                        },
                      ),
                      cardSpendState
                          ? Column(
                              children: [
                                SizedBox(height: SizeConfig.screenWidth * 0.01),
                                CardSpend(),
                                SizedBox(
                                  height: SizeConfig.screenWidth * 0.042,
                                ),
                              ],
                            )
                          : SizedBox(height: SizeConfig.screenWidth * 0.02),

                      WidgetType(
                        creditCardProvider,
                        cardType: s.creditCardbillDescription,
                        function: () {
                          ref.read(creditCardProvider.notifier).state =
                              !creditCardBillState;
                        },
                      ),
                      creditCardBillState
                          ? Column(
                              children: [
                                SizedBox(height: SizeConfig.screenWidth * 0.01),
                                CreditCardBills(),
                              ],
                            )
                          : SizedBox(height: SizeConfig.screenWidth * 0.02),
                      SizedBox(height: SizeConfig.screenWidth * 0.042),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
