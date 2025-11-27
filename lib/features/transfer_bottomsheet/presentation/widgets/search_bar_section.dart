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
            border: Border.all(color: DefaultColors.grayTB.withAlpha(102)),
            borderRadius: BorderRadius.circular(30),
          ),
          width: screenWidth * 0.74,
          height: screenWidth * 0.13,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: DefaultColors.blueT1,
                    size: screenWidth * 0.04,
                  ),
                  Text(
                    "Type to Search",
                    style: TextStyle(
                      color: DefaultColors.grayTB.withAlpha(135),
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ],
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
