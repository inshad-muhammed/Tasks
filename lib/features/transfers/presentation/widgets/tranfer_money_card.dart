import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';

class TransferMoneyCard extends StatelessWidget {
  const TransferMoneyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.046),
        gradient: LinearGradient(
          colors: [
            DefaultColors.blueLightBase,
            DefaultColors.dashboardLightBlue,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 20,
          right: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Transfer Money",
                  style: TextStyle(
                    color: DefaultColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Free 5 International Transfers",
                  style: TextStyle(
                    color: DefaultColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SvgPicture.asset("assets/transfer.svg"),
          ],
        ),
      ),
    );
  }
}
