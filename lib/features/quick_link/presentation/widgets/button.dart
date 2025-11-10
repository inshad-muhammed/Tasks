import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              DefaultColors.dashboarddarkBlue,
            ),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Done",
              style: TextStyle(color: DefaultColors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
