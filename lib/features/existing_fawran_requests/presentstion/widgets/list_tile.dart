import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/colors.dart';

class RequestListTile extends StatelessWidget {
  final String name;
  final String alias;
  final String expiresIn;
  final String amount;
  final String status;
  final bool isRecieved;
  final VoidCallback? onTap;

  const RequestListTile({
    super.key,
    required this.name,
    required this.alias,
    required this.expiresIn,
    required this.amount,
    required this.status,
    required this.isRecieved,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListTile(
      leading: CircleAvatar(
        radius: screenWidth * 0.06,
        backgroundColor: DefaultColors.dashboardBlue.withAlpha(51),
        child: SvgPicture.asset(
          'assets/fawran_icons/down_arrow.svg',
          height: screenWidth * 0.03,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          color: DefaultColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            alias,
            style: TextStyle(
              color: DefaultColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          Text(
            'Expires $expiresIn',
            style: TextStyle(
              color: DefaultColors.gray102,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isRecieved
              ? Text(
                  '- $amount',
                  style: TextStyle(
                    color: DefaultColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                )
              : Text(
                  amount,
                  style: TextStyle(
                    color: DefaultColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
          Text(
            status,
            style: TextStyle(
              color: DefaultColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
