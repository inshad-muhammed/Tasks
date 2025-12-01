import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class TransferButton extends StatelessWidget {
  const TransferButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.blueT1,
          foregroundColor: DefaultColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text("Transfer"),
      ),
    );
  }
}
