import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/quick_link/presentation/widgets/button.dart';
import 'package:tasks/features/quick_link/presentation/widgets/icon.dart';

class QuickLinkPage extends StatelessWidget {
  const QuickLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, size: SizeConfig.screenWidth * 0.06),
        leadingWidth: SizeConfig.screenWidth * 0.15,
        titleSpacing: 0,
        title: Text(
          "Customize Quick Links",
          style: TextStyle(
            color: const Color(0xff0D3E7F),
            fontSize: SizeConfig.screenWidth * 0.046,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
          vertical: SizeConfig.screenWidth * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select upto 4 Options",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.screenWidth * 0.056,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "You want have quick acces to",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.screenWidth * 0.036,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            IconWidget(),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.screenWidth * 0.02),
              child: Button(),
            ),
          ],
        ),
      ),
    );
  }
}
