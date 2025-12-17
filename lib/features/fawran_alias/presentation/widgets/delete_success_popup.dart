import 'package:flutter/material.dart';
import 'package:tasks/features/fawran_alias/presentation/pages/own_alias_page.dart';
import 'buttons.dart';
import 'drag_handle.dart';

class DeleteSuccessPopup extends StatelessWidget {
  final Map<String, dynamic> aliasData;

  const DeleteSuccessPopup({super.key, required this.aliasData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            const DragHandle(),
            const Spacer(),
            Image.asset("assets/task_success.gif", height: screenWidth * 0.28),
            const SizedBox(height: 12),
            Text(
              "Beneficiary deleted successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.052,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: screenWidth * 0.04),
              child: ElevatedButtonWidget(
                label: "Close",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OwnAliasPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
