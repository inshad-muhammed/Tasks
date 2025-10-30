import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/quick_link/presentation/controller/quick_link_provider.dart';
import 'package:tasks/features/quick_link/presentation/controller/selection_provider.dart';
import 'package:tasks/features/quick_link/presentation/widgets/animation_widget.dart';
import 'package:tasks/features/quick_link/presentation/widgets/shimmer_effect.dart';

class IconWidget extends ConsumerWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var showLimitMessage = false;
    final selectedIndexes = ref.watch(selectedIndexesProvider);
    final asyncQuickLinks = ref.watch(quickLinksProvider);

    return asyncQuickLinks.when(
      loading: () => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ShimmerEffect(),
      ),
      error: (error, stack) => Center(child: Text("Error: $error")),
      data: (labels) => Column(
        children: [
          Wrap(
            spacing: SizeConfig.screenWidth * 0.03,
            runSpacing: SizeConfig.screenWidth * 0.05,
            children: List.generate(labels.length, (index) {
              final item = labels[index];
              final isSelected = selectedIndexes.contains(index);

              return GestureDetector(
                onTap: () {
                  ref.read(selectedIndexesProvider.notifier).update((state) {
                    final newState = {...state};
                    if (newState.contains(index)) {
                      newState.remove(index); // Unselect
                    } else {
                      if (newState.length < 4) {
                        newState.add(index); // Select only if < 4
                      } else {
                        showLimitMessage = true;
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
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey.withAlpha(100),
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
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          showLimitMessage
              ? Text(
                  "Deselect a selected option to select a new one",
                  style: TextStyle(
                    color: Color(0xffC65851),
                    fontWeight: FontWeight.bold,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
