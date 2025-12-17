import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/colors.dart';
import '../controllers/toggle_provider.dart';

class ToggleWidget extends StatelessWidget {
  final String? iconPath;
  final String label;

  const ToggleWidget({super.key, this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      width: double.infinity,
      decoration: BoxDecoration(
        color: DefaultColors.blueLightBase.withAlpha(51),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (iconPath != null)
            SvgPicture.asset(
              iconPath!,
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
            ),
          SizedBox(width: iconPath != null ? screenWidth * 0.03 : 0),
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500,
              color: DefaultColors.black,
            ),
          ),
          Spacer(),
          Switch(),
        ],
      ),
    );
  }
}

class Switch extends ConsumerWidget {
  const Switch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOn = ref.watch(toggleProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        ref.read(toggleProvider.notifier).state = !isOn;
      },
      child: Container(
        width: screenWidth * 0.08,
        height: screenWidth * 0.05,
        padding: EdgeInsets.all(screenWidth * 0.002),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: DefaultColors.blueT1),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: screenWidth * 0.04,
            height: screenWidth * 0.04,
            decoration: BoxDecoration(
              color: isOn
                  ? DefaultColors.blueT1
                  : DefaultColors.blueT1.withAlpha(102),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
