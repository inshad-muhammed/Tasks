import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/quick_link/presentation/controller/quick_link_provider.dart';
import 'package:tasks/features/quick_link/presentation/controller/selection_provider.dart';
import 'package:tasks/features/quick_link/presentation/controller/show_message_provider.dart';
import 'package:tasks/features/quick_link/presentation/widgets/animation_widget.dart';
import 'package:tasks/features/quick_link/presentation/widgets/shimmer_effect.dart';

class IconWidget extends ConsumerWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLimitMessage = ref.watch(showLimitMessageProvider);
    final selectedIndexes = ref.watch(selectedIndexesProvider);
    final asyncQuickLinks = ref.watch(quickLinksProvider);
    final theme = Theme.of(context);

    return asyncQuickLinks.when(
      loading: () => Shimmer.fromColors(
        baseColor: theme.colorScheme.onPrimaryContainer,
        highlightColor: theme.colorScheme.inversePrimary,
        child: ShimmerEffect(),
      ),
      error: (error, stack) => Center(child: Text("Error: $error")),
      data: (labels) => Expanded(
        child: SizedBox(
          child: Column(
            children: [
              Wrap(
                spacing: SizeConfig.screenWidth * 0.03,
                runSpacing: SizeConfig.screenHeight * 0.03,
                children: List.generate(labels.length, (index) {
                  final item = labels[index];
                  final isSelected = selectedIndexes.contains(index);

                  return GestureDetector(
                    onTap: () {
                      ref.read(selectedIndexesProvider.notifier).update((
                        state,
                      ) {
                        final newState = {...state};
                        if (newState.contains(index)) {
                          newState.remove(index); // Unselect
                          ref.read(showLimitMessageProvider.notifier).state =
                              false;
                        } else {
                          if (newState.length < 4) {
                            newState.add(index); // Select only if < 4
                          } else {
                            ref.read(showLimitMessageProvider.notifier).state =
                                true;
                          }
                        }
                        return newState;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.15,
                          height: SizeConfig.screenWidth * 0.15,
                          child: AnimatedIconWidget(
                            child: Stack(
                              children: [
                                Container(
                                  height: SizeConfig.screenWidth * 0.13,
                                  width: SizeConfig.screenWidth * 0.13,
                                  decoration: BoxDecoration(
                                    color: theme.scaffoldBackgroundColor,
                                    border: Border.all(
                                      color: theme.colorScheme.outline,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      SizeConfig.screenWidth * 0.04,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      SizeConfig.screenWidth * 0.026,
                                    ),
                                    child: SvgPicture.asset(
                                      item.imagePath,
                                      height: SizeConfig.screenWidth * 0.01,
                                      width: SizeConfig.screenWidth * 0.01,
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(
                                        theme.colorScheme.secondary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: SizeConfig.screenWidth * 0.046,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenWidth * 0.02),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.2,
                          child: Text(
                            item.label,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.screenWidth * 0.028,
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Spacer(),
              if (showLimitMessage)
                Text(
                  "Deselect a selected option to select a new one",
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.w900,
                    fontSize: SizeConfig.screenWidth * 0.036,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
