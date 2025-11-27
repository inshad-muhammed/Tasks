import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../constants/favourite_list.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.26,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        color: DefaultColors.blueLight2,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
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
              padding: const EdgeInsets.all(18),
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
