import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/button.dart';
import '../widgets/icon.dart';

class QuickLinkPage extends StatelessWidget {
  const QuickLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.dashboardGray,
      appBar: AppBar(
        toolbarHeight: 64,
        leading: Icon(Icons.arrow_back_ios, size: 20),

        titleSpacing: 0,
        title: Text(
          "Customize Quick Links",
          style: TextStyle(
            color: DefaultColors.dashboarddarkBlue,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select upto 4 Options",
              style: TextStyle(
                color: DefaultColors.black,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "You want have quick access to",
              style: TextStyle(
                color: DefaultColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            IconWidget(),
            Button(),
          ],
        ),
      ),
    );
  }
}
