import 'package:flutter/material.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: double.infinity,
              height: screenWidth * 0.26,
              color: Colors.grey,
            ),
            SizedBox(height: screenHeight * 0.028),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              spacing: 15,
              children: [
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            ...List.generate(4, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: double.infinity,
                  height: screenWidth * 0.2,
                  color: Colors.grey,
                ),
              );
            }),
            SizedBox(height: screenHeight * 0.028),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              spacing: 15,
              children: [
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
                Container(
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.02,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            ...List.generate(4, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  width: double.infinity,
                  height: screenWidth * 0.2,
                  color: Colors.grey,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
