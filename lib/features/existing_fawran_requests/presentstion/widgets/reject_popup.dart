import 'package:flutter/material.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/features/existing_fawran_requests/presentstion/widgets/buttons.dart';

class RejectPopup extends StatelessWidget {
  final Map<String, dynamic> request;
  const RejectPopup({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Reject Request?",
            style: TextStyle(
              color: DefaultColors.black,
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.05,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "This will reject the request to pay ${request['amount']} from ${request['name']}?",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: DefaultColors.gray102,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.032),
          TextButtonWidget(
            label: "Close",
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButtonWidget(label: "Reject", onPressed: () {}),
        ],
      ),
    );
  }
}
