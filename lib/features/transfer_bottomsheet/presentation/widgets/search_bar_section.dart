import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(30),
          ),
          width: screenWidth * 0.74,
          height: screenWidth * 0.13,
          child: TextFormField(
            decoration: InputDecoration(
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.search), Text("Type to Search")],
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Container(
          height: screenWidth * 0.13,
          width: screenWidth * 0.13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: DefaultColors.blueT1),
          ),
          child: Icon(
            Icons.settings_outlined,
            size: screenWidth * 0.05,
            color: DefaultColors.blueT1,
          ),
        ),
      ],
    );
  }
}
