import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/account_selection_content.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/contacts_screen.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/deactivate_visibilty_state_screen.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/initial_content.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/search_bar_section.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/selection_section.dart';

import '../controllers/content_step_provider.dart';

class TransferBottomSheetWidget extends ConsumerWidget {
  const TransferBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(contentStepProvider);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 16,
          right: 16,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Header
            const Text(
              "Select Beneficiary/Contact",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            //Search bar
            const SearchBarSection(),
            const SizedBox(height: 24),
            //Benefeciries/Contacts filter section
            const SelectionBarSection(),
            const SizedBox(height: 24),
            //Before pressing continue InitialContent is displayed
            //After pressing continue hides InitialContent
            if (step == 0) const InitialContent(),
            if (step == 1) const AccountSelectionContent(),
            if (step == 2) const DeactivateVisibiltyStateScreen(),
            if (step == 3) const ContactsScreen(),
          ],
        ),
      ),
    );
  }
}
