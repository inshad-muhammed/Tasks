import 'package:flutter/material.dart';

class NotificationShimmerEffect extends StatelessWidget {
  const NotificationShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.05,
                  color: Colors.white,
                ),
                Container(
                  width: screenWidth * 0.28,
                  height: screenWidth * 0.05,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.05),
            Container(
              width: screenWidth * 0.28,
              height: screenWidth * 0.05,
              color: Colors.white,
            ),
            SizedBox(height: screenWidth * 0.02),
            ...List.generate(3, (i) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenWidth * 0.02),
                child: Container(
                  width: double.infinity,
                  height: screenWidth * 0.2,
                  color: Colors.white,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
