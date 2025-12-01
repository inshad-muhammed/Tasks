import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/features/dashbord/presentation/constants/select_action_list.dart';
import 'package:tasks/features/dashbord/presentation/widgets/custom_bottom_sheet.dart';

class BottomSheetTriggerPage extends StatelessWidget {
  const BottomSheetTriggerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return CustomBottomSheet(
                  title: "Select an action",
                  itemList: selectActionItems,
                );
              },
            );
          },
          child: SvgPicture.asset("assets/images/transfer_icon.svg"),
        ),
      ),
    );
  }
}
