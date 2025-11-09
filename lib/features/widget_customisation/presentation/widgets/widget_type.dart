import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tasks/core/utils/size_config.dart';

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
    final iconChange = ref.watch(provider);
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: function,
            child: Container(
              // height: SizeConfig.screenWidth * 0.086,
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.onPrimaryContainer),
                borderRadius: BorderRadius.circular(
                  SizeConfig.screenWidth * 0.02,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.screenWidth * 0.02),
                child: Row(
                  spacing: SizeConfig.screenWidth * 0.02,
                  children: [
                    Image.asset(
                      "assets/pin.png",
                      height: SizeConfig.screenWidth * 0.05,
                    ),
                    Text(
                      cardType,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: SizeConfig.screenWidth * 0.04,
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
        SizedBox(width: SizeConfig.screenWidth * 0.01),
        Image.asset("assets/drag.png", color: theme.colorScheme.secondary),
      ],
    );
  }
}
