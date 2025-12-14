import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class RequestDetailCard extends StatelessWidget {
  final String name;
  final String amount;
  final String date;
  final String status;
  final bool isReceived;
  const RequestDetailCard({
    super.key,
    required this.name,
    required this.amount,
    required this.date,
    required this.status,
    required this.isReceived,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.034),
          decoration: BoxDecoration(
            color: DefaultColors.blueLightBase.withAlpha(51),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isReceived
                  ? Column(
                      children: [
                        Text(
                          '${name.toUpperCase()} Requested',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.black,
                          ),
                        ),
                        Text(
                          amount,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.black,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          '${amount.toUpperCase()} Requested',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.black,
                          ),
                        ),
                        Text(
                          'to $name',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.black,
                          ),
                        ),
                      ],
                    ),

              Text(
                date,
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                  color: DefaultColors.black,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -15,
          child: Container(
            decoration: BoxDecoration(
              color: DefaultColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: isReceived
                  ? Text(
                      '$status. Approval'.toUpperCase(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.blueLightBase,
                      ),
                    )
                  : Text(
                      '$status. Request'.toUpperCase(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.036,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.blueLightBase,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
