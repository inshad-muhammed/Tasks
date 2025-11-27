import 'package:flutter/material.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/constants/contacts.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/contact_tile.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/continue_button.dart';

import '../../../../core/constants/colors.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final favouriteContacts = contacts.where((c) => c.isFavorite).toList();
    final otherContacts = contacts.where((c) => !c.isFavorite).toList();

    return SizedBox(
      height: screenHeight * 0.56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Favourite Contacts Container
          if (favouriteContacts.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favouriteContacts.length,
                separatorBuilder: (_, __) => Divider(
                  color: DefaultColors.grayTB.withAlpha(51),
                  height: 1,
                ),
                itemBuilder: (_, index) {
                  return ContactTile(contact: favouriteContacts[index]);
                },
              ),
            ),

          SizedBox(height: screenHeight * 0.03),

          //  Other Contacts Container
          if (otherContacts.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.04),
                border: Border.all(color: DefaultColors.grayTB.withAlpha(51)),
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherContacts.length,
                separatorBuilder: (_, __) => Divider(
                  color: DefaultColors.grayTB.withAlpha(51),
                  height: 1,
                ),
                itemBuilder: (_, index) {
                  return ContactTile(contact: otherContacts[index]);
                },
              ),
            ),
          Spacer(),
          ContinueButton(onPressed: () {}),
        ],
      ),
    );
  }
}
