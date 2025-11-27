import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../data/models/contact_model.dart';

class ContactTile extends StatelessWidget {
  final ContactModel contact;

  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Pick dp or initials
    Widget avatar;
    if (contact.dp != null && contact.dp!.isNotEmpty) {
      avatar = CircleAvatar(
        radius: screenWidth * 0.064,
        backgroundImage: NetworkImage(contact.dp!),
      );
    } else {
      final initials = contact.name
          .trim()
          .split(' ')
          .map((e) => e[0])
          .take(2)
          .join();

      avatar = CircleAvatar(
        radius: screenWidth * 0.06,
        backgroundColor: DefaultColors.dashboardBlue.withAlpha(26),
        child: Center(
          child: Text(
            initials,
            style: TextStyle(
              color: DefaultColors.blueT1,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth * 0.04,
        horizontal: screenWidth * 0.036,
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            avatar,
            SizedBox(width: screenWidth * 0.036),

            // Text info
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: DefaultColors.blackT,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    contact.accountNo,
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      color: DefaultColors.grayTB.withAlpha(153),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    contact.bank,
                    style: TextStyle(
                      fontSize: screenWidth * 0.038,
                      color: DefaultColors.grayTB.withAlpha(153),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star_outline,
                color: contact.isFavorite
                    ? DefaultColors.blueT1
                    : DefaultColors.blackT.withAlpha(51),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
