import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/constants/colors.dart';

class WidgetType extends ConsumerWidget {
  final String cardType;
  final VoidCallback function;
  final StateProvider<bool> provider;
  const WidgetType(
    this.provider, {
    super.key,
    required this.cardType,
    required this.function,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconChange = ref.watch(provider);

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: function,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: DefaultColors.grayMedBase),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  spacing: 10,
                  children: [
                    Image.asset("assets/pin.png", height: screenWidth * 0.05),
                    Text(
                      cardType,
                      style: TextStyle(
                        color: DefaultColors.grayBase,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    iconChange
                        ? Image.asset("assets/up.png")
                        : Image.asset("assets/down.png"),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.01),
        Image.asset("assets/drag.png", color: DefaultColors.black),
      ],
    );
  }
}
