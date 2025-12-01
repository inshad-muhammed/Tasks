import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/colors.dart';

class EmptyStateCard extends StatelessWidget {
  final String message;
  final String? actionText;
  final String buttonText;
  final String imageAsset;

  const EmptyStateCard({
    super.key,
    required this.message,
    this.actionText,
    required this.imageAsset,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: DefaultColors.dashboardBlue.withAlpha(51),
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        border: Border.all(color: DefaultColors.grayE5, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(imageAsset, width: screenWidth * 0.09),
          SizedBox(width: 0.02),
          SizedBox(
            width: screenWidth * 0.45,
            child: Text(
              message,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: DefaultColors.gray7D,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.w600,
                color: DefaultColors.blueLightBase,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Backwards-compatible specific empty transactions widget using [EmptyStateCard].
class RecentTransactionsCard extends StatelessWidget {
  final VoidCallback? onMakeTransaction;
  const RecentTransactionsCard({super.key, this.onMakeTransaction});

  @override
  Widget build(BuildContext context) {
    return EmptyStateCard(
      imageAsset: 'assets/images/Add.svg',
      message: 'Your most recent Transfers will appear here.',
      buttonText: 'New Transfer',
    );
  }
}

class BeneficariesCard extends StatelessWidget {
  final VoidCallback? onMakeTransaction;
  const BeneficariesCard({super.key, this.onMakeTransaction});

  @override
  Widget build(BuildContext context) {
    return EmptyStateCard(
      imageAsset: 'assets/images/Add (1).svg',
      message: 'Your most recent Beneficiaries will appear here.',
      buttonText: 'Add Beneficiaries',
    );
  }
}
