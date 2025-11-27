import 'package:flutter/material.dart';

class Beneficiaries extends StatelessWidget {
  const Beneficiaries({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.56,
      child: Center(
        child: Text(
          "On Developing Mode !!!",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
