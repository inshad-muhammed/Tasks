import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class CreditCardBills extends StatelessWidget {
  const CreditCardBills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenWidth * 0.24,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300, width: 0.8),
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.02),
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
            child: Row(
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Image.asset("assets/creative.png"),
                    Positioned(
                      bottom: -20,
                      right: -24,
                      child: Image.asset(
                        "assets/image 2923.png",
                        width: SizeConfig.screenWidth * 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: SizeConfig.screenWidth * 0.08),
                Text(
                  "No Bills to show yet.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.screenWidth * 0.03,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
