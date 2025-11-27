import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/account_selection_content.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/beneficiaries.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/contacts_screen.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/deactivate_visibilty_state_screen.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/enable_visibility_state_screen.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/initial_content.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/search_bar_section.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/selection_section.dart';
import '../controllers/content_step_provider.dart';
import '../controllers/selection_provider.dart';

class TransferBottomSheetWidget extends ConsumerWidget {
  const TransferBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final step = ref.watch(contentStepProvider);
    final filter = ref.watch(selectionProvider);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.048, //40
          left: screenWidth * 0.04, //16
          right: screenWidth * 0.04,
          bottom: screenHeight * 0.048,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //Header
            Text(
              "Select Beneficiary/Contact",
              style: TextStyle(
                fontSize: screenWidth * 0.058, //24
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.028), //24
            //Search bar
            const SearchBarSection(),
            SizedBox(height: screenHeight * 0.028),
            //Benefeciries/Contacts filter section
            const SelectionBarSection(),
            SizedBox(height: screenHeight * 0.028),
            //Before pressing continue InitialContent is displayed
            //After pressing continue hides InitialContent
            if (filter == 'Beneficiaries') const Beneficiaries(),
            if (filter == 'Contacts')
              if (step == 0) const InitialContent(),
            if (step == 1) const AccountSelectionContent(),
            if (step == 2) const DeactivateVisibiltyStateScreen(),
            if (step == 3) const ContactsScreen(),
            if (step == 4) const EnableVisibilityStateScreen(),
          ],
        ),
      ),
    );
  }
}
