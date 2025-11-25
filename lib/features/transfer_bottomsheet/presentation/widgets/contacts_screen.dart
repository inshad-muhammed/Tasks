import 'package:flutter/material.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/constants/contacts.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/contact_tile.dart';

import '../../../../core/constants/colors.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteContacts = contacts.where((c) => c.isFavorite).toList();
    final otherContacts = contacts.where((c) => !c.isFavorite).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ⭐ Favourite Contacts Container
          if (favouriteContacts.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: DefaultColors.white_700),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favouriteContacts.length,
                separatorBuilder: (_, __) =>
                    const Divider(color: Colors.grey, height: 1),
                itemBuilder: (_, index) {
                  return ContactTile(contact: favouriteContacts[index]);
                },
              ),
            ),

          if (favouriteContacts.isNotEmpty && otherContacts.isNotEmpty)
            const SizedBox(height: 16),

          // 👥 Other Contacts Container
          if (otherContacts.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: DefaultColors.white_700),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: otherContacts.length,
                separatorBuilder: (_, __) =>
                    const Divider(color: Colors.grey, height: 1),
                itemBuilder: (_, index) {
                  return ContactTile(contact: otherContacts[index]);
                },
              ),
            ),
        ],
      ),
    );
  }
}
