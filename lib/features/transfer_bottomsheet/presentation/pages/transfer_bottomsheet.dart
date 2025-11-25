import 'package:flutter/material.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/bottom_sheet.dart';

class TransferBottomsheet extends StatelessWidget {
  const TransferBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return TransferBottomSheetWidget();
              },
            );
          },
          child: Text("Transfer"),
        ),
      ),
    );
  }
}
