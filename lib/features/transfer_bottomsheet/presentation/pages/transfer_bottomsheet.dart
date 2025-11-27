import 'package:flutter/material.dart';
import 'package:tasks/features/transfer_bottomsheet/presentation/widgets/bottom_sheet.dart';
import '../widgets/drag_handle.dart';

class TransferBottomsheet extends StatelessWidget {
  const TransferBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [DragHandle(), TransferBottomSheetWidget()],
                );
              },
            );
          },
          child: Text("Transfer"),
        ),
      ),
    );
  }
}
