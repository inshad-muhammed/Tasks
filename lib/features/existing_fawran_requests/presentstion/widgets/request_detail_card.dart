import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class RequestDetailCard extends StatelessWidget {
  final String name;
  final String amount;
  final String date;
  final String status;
  final bool isRecieved;
  const RequestDetailCard({
    super.key,
    required this.name,
    required this.amount,
    required this.date,
    required this.status,
    required this.isRecieved,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 28),
          decoration: BoxDecoration(
            color: DefaultColors.blueLightBase.withAlpha(51),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isRecieved
                  ? Column(
                      children: [
                        Text(
                          '${name.toUpperCase()} Requested',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.black,
                          ),
                        ),
                        Text(
                          amount,
                          style: const TextStyle(
                            fontSize: 16,
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
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.black,
                          ),
                        ),
                        Text(
                          'to $name',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: DefaultColors.black,
                          ),
                        ),
                      ],
                    ),

              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
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
              padding: const EdgeInsets.all(10),
              child: isRecieved
                  ? Text(
                      '$status. Approval'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: DefaultColors.blueLightBase,
                      ),
                    )
                  : Text(
                      '$status. Request'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
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
