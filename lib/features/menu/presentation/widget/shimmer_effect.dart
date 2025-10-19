import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class ShimmerEffectMenuPage extends StatelessWidget {
  const ShimmerEffectMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.12,
                height: SizeConfig.screenWidth * 0.12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.06,
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenWidth * 0.2,
                    height: SizeConfig.screenWidth * 0.01,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  SizedBox(height: SizeConfig.screenWidth * 0.02),
                  Container(
                    width: SizeConfig.screenWidth * 0.2,
                    height: SizeConfig.screenWidth * 0.01,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: SizeConfig.screenWidth * 0.1,
                width: SizeConfig.screenWidth * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: SizeConfig.screenWidth * 0.05),

          Wrap(
            spacing: SizeConfig.screenWidth * 0.035,
            runSpacing: SizeConfig.screenWidth * 0.035,
            children: List.generate(4, (index) {
              return Container(
                width: SizeConfig.screenWidth * 0.432,
                height: SizeConfig.screenWidth * 0.295,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.screenWidth * 0.15,
                width: SizeConfig.screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenWidth * 0.15,
                width: SizeConfig.screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenWidth * 0.15,
                width: SizeConfig.screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenWidth * 0.15,
                width: SizeConfig.screenWidth * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Container(
            height: SizeConfig.screenHeight * 0.3,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                SizeConfig.screenWidth * 0.05,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenWidth * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: SizeConfig.screenWidth * 0.2,
                width: SizeConfig.screenWidth * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.1,
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenWidth * 0.2,
                width: SizeConfig.screenWidth * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenWidth * 0.2,
                width: SizeConfig.screenWidth * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.screenWidth * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
