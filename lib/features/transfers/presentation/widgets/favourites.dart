import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../constants/favourite_list.dart';
import 'dashed_add_button.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.26,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: DefaultColors.blueLight2,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            // Add Button with dashed circular border
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashedAddButton(
                  radius: screenWidth * 0.064,
                  dashLength: 6,
                  gapLength: 6,
                  color: DefaultColors.blueLight3,
                  onTap: () {},
                  child: CircleAvatar(
                    radius: screenWidth * 0.058,
                    backgroundColor: DefaultColors.white_1000,
                    child: Icon(
                      Icons.add,
                      color: DefaultColors.blueLight3,
                      size: screenWidth * 0.1,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),

          ...favouriteList.map((favourite) {
            final name = (favourite['name'] ?? '') as String;
            final dp = favourite['dp'] as String?;
            Widget avatar;

            if (dp != null && dp.isNotEmpty) {
              avatar = CircleAvatar(
                radius: screenWidth * 0.064,
                backgroundImage: NetworkImage(dp),
              );
            } else {
              // Show initials when no image provided
              final initials = name.isNotEmpty
                  ? name
                        .trim()
                        .split(' ')
                        .map((e) => e.isNotEmpty ? e[0] : '')
                        .take(2)
                        .join()
                  : '';
              avatar = CircleAvatar(
                backgroundColor: DefaultColors.white,
                radius: screenWidth * 0.064,
                child: CircleAvatar(
                  radius: screenWidth * 0.06,
                  backgroundColor: DefaultColors.blueLight1,
                  child: Text(
                    initials,
                    style: const TextStyle(
                      color: DefaultColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  avatar,
                  SizedBox(
                    width: 58,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.black,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
