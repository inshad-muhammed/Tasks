import 'package:flutter/material.dart';
import 'package:tasks/core/utils/size_config.dart';

class ItemCard extends StatelessWidget {
  final String image;
  final String title;
  const ItemCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.screenWidth * 0.432,
      height: SizeConfig.screenWidth * 0.295,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.05),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.02,
        ),
        child: Column(
          spacing: 0,

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, height: SizeConfig.screenWidth * 0.2),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: SizeConfig.screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
