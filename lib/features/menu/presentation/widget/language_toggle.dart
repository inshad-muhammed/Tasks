import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/menu_page.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/menu/presentation/controller/language_provider.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(languageProvider);
    final s = DefaultStrings.instance;

    return Column(
      children: [
        Container(
          height: SizeConfig.screenWidth * 0.15,
          width: SizeConfig.screenWidth * 0.3,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.05),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Stack(
            children: [
              // Sliding background
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                alignment: isEnglish
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: SizeConfig.screenWidth * 0.15,
                  height: SizeConfig.screenWidth * 0.15,

                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(
                      SizeConfig.screenWidth * 0.05,
                    ),
                  ),
                ),
              ),

              // Language labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          ref.read(languageProvider.notifier).state = false,
                      child: Center(
                        child: Text(
                          s.toggleLanguageOption2,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          ref.read(languageProvider.notifier).state = true,
                      child: Center(
                        child: Text(
                          s.toggleLanguageOption1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
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
        const Text(
          'Language',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
