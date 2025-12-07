import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/new_beneficiary/presentation/widgets/info_text.dart';
import 'package:tasks/features/new_beneficiary/presentation/widgets/transfer_button.dart';

import '../../../../core/constants/colors.dart';
import '../controllers/add_beneficiary_providers.dart';

class SuccesBottomsheet extends ConsumerWidget {
  const SuccesBottomsheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nickName = ref.watch(nicknameProvider);
    final accountNumber = ref.watch(accountNumberProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/task_success.gif", height: screenWidth * 0.32),
          SizedBox(height: screenHeight * 0.02),
          Text(
            "Beneficiary Added Successfully !",
            style: TextStyle(
              color: DefaultColors.blackT,
              fontSize: screenWidth * 0.056,

              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            width: screenWidth,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: DefaultColors.grayTB.withAlpha(170)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailColumn(label: "Beneficiary Name", detail: "MD Ahtiyat"),
                Divider(),
                DetailColumn(label: "Nickname", detail: nickName),
                Divider(),
                DetailColumn(label: "Account Number", detail: accountNumber),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          InfoText(
            message:
                "For your safety, transfers to new beneficiaries will be enabled after XX hours.",
          ),
          SizedBox(height: screenHeight * 0.02),
          TransferButton(),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}

class DetailColumn extends StatelessWidget {
  final String label;
  final String detail;

  const DetailColumn({super.key, required this.label, required this.detail});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenWidth * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.028,
              fontWeight: FontWeight.w500,
              color: DefaultColors.grayTB.withAlpha(170),
            ),
          ),
          Text(
            detail,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: DefaultColors.blackT,
            ),
          ),
        ],
      ),
    );
  }
}
