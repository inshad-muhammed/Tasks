import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/menu/presentation/controller/theme_provider.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final notifier = ref.read(themeNotifierProvider.notifier);

    return Column(
      children: [
        Container(
          height: SizeConfig.screenWidth * 0.15,
          width: SizeConfig.screenWidth * 0.3,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.05),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Stack(
            children: [
              // Sliding background
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: themeMode == ThemeMode.light
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: SizeConfig.screenWidth * 0.15,
                  height: SizeConfig.screenWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenWidth * 0.05,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),

              // Icon row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: notifier.toggleTheme,
                        child: Icon(
                          Icons.dark_mode_outlined,
                          color: themeMode == ThemeMode.dark
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: notifier.toggleTheme,
                        child: Icon(
                          Icons.light_mode_outlined,
                          color: themeMode == ThemeMode.light
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Theme',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
