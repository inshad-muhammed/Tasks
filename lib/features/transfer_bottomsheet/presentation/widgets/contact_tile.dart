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
        backgroundColor: Colors.white,
        radius: screenWidth * 0.064,
        child: CircleAvatar(
          radius: screenWidth * 0.06,
          backgroundColor: Colors.blue.shade100,
          child: Text(
            initials,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avatar,
            const SizedBox(width: 12),

            // Text info
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    contact.accountNo,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                  Text(
                    contact.bank,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
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
                    : DefaultColors.white_700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
