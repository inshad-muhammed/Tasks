import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/features/fawran_alias/presentation/controllers/toggle_provider.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/account_selector_field.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/buttons.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/custom_popup.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/delete_success_popup.dart';
import 'package:tasks/features/fawran_alias/presentation/widgets/drag_handle.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/account_selector_bottomsheet.dart';
import '../widgets/toggle_widget.dart';

class AliasDetailsPage extends ConsumerWidget {
  final Map<String, dynamic> aliasData;
  const AliasDetailsPage({super.key, required this.aliasData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleState = ref.watch(toggleProvider);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: DefaultColors.blueT1,
      appBar: AppBar(
        backgroundColor: DefaultColors.blueT1,
        foregroundColor: DefaultColors.white,
        leadingWidth: screenWidth * 0.05,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: screenWidth * 0.05),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Alias Details',
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: DefaultColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.05,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            bottom: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.086,
                backgroundColor: DefaultColors.dashboardBlue.withAlpha(51),
                child: CircleAvatar(
                  radius: screenWidth * 0.076,
                  backgroundColor: DefaultColors.dashboardBlue.withAlpha(51),
                  child: SvgPicture.asset(
                    aliasData['iconPath'],
                    height: screenWidth * 0.05,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.02),
              Text(
                aliasData['alias'],
                style: TextStyle(
                  fontSize: screenWidth * 0.046,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Text(
                'Created on ${aliasData['createdAt']}',
                style: TextStyle(
                  fontSize: screenWidth * 0.036,
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.gray102,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              AccountSelectorField(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [DragHandle(), AccountSelectorBottomsheet()],
                      );
                    },
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              ToggleWidget(label: 'Active'),
              SizedBox(height: screenHeight * 0.02),
              ToggleWidget(
                label: "Pay with QPay",
                iconPath: "assets/fawran_icons/info.svg",
              ),
              Spacer(),
              toggleState == true
                  ? TextButtonWidget(
                      label: "De-Register Alias",
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DragHandle(),
                                CustomPopup(
                                  title: "Deactivate alias?",
                                  message:
                                      "Once deactivated, you will not be able to send and receive money using this alias.",
                                  mainButtonText: "Deactivate alias",
                                  subButtonText: "Close",
                                  mainFunction: () {
                                    ref.watch(toggleProvider.notifier).state =
                                        false;
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    )
                  : TextButtonWidget(
                      label: "Delete Alias",
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DragHandle(),
                                CustomPopup(
                                  title: "Delete alias?",
                                  message:
                                      "This will permanently delete your alias. You can also temporarily disable the alias.",
                                  mainButtonText: "Delete alias",
                                  subButtonText: "Close",
                                  mainFunction: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: screenHeight,
                                          child: DeleteSuccessPopup(
                                            aliasData: aliasData,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),

              SizedBox(height: screenHeight * 0.01),
              ElevatedButtonWidget(
                label: "Close",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
