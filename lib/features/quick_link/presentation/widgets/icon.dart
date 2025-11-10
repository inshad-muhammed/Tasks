import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks/features/quick_link/presentation/controller/selection_provider.dart';
import 'package:tasks/features/quick_link/presentation/controller/show_message_provider.dart';
import 'package:tasks/features/quick_link/presentation/widgets/animation_widget.dart';
import 'package:tasks/features/quick_link/presentation/widgets/button.dart';
import '../../../../core/constants/colors.dart';
import '../constants/quick_link_icons.dart';

class IconWidget extends ConsumerWidget {
  const IconWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLimitMessage = ref.watch(showLimitMessageProvider);
    final selectedIndexes = ref.watch(selectedIndexesProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,

                runAlignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
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
                          width: screenWidth * 0.15,
                          height: screenWidth * 0.15,
                          child: AnimatedIconWidget(
                            child: Stack(
                              children: [
                                Container(
                                  height: screenWidth * 0.13,
                                  width: screenWidth * 0.13,
                                  decoration: BoxDecoration(
                                    color: DefaultColors.white,
                                    border: Border.all(
                                      color: DefaultColors.grayD4,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      item['imagePath'] as String,
                                      height: screenWidth * 0.01,
                                      width: screenWidth * 0.01,
                                      fit: BoxFit.contain,
                                      colorFilter: ColorFilter.mode(
                                        DefaultColors.black,
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
                                      color: DefaultColors.greenBase,
                                      size: screenWidth * 0.046,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 70,
                          child: Text(
                            item['label'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: DefaultColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Spacer(),
            if (showLimitMessage)
              Text(
                "Deselect a selected option to select a new one",
                style: TextStyle(
                  color: DefaultColors.redBase,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
            Button(),
          ],
        ),
      ),
    );
  }
}
