import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';

import 'package:tasks/features/quick_link/presentation/controller/selection_provider.dart';
import 'package:tasks/features/quick_link/presentation/widgets/animation_widget.dart';
import 'package:tasks/features/quick_link/presentation/widgets/button.dart';
import 'package:tasks/features/quick_link/presentation/widgets/icon.dart';

class QuickLinkPage extends ConsumerWidget {
  const QuickLinkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    final selectedIndex = ref.watch(selectedIndexesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back, size: SizeConfig.screenWidth * 0.06),
        leadingWidth: SizeConfig.screenWidth * 0.15,
        titleSpacing: 0,
        title: Text(
          "Customize Quick Links",
          style: TextStyle(
            color: const Color(0xff0D3E7F),
            fontSize: SizeConfig.screenWidth * 0.05,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
          vertical: SizeConfig.screenWidth * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select upto 4 Options",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.screenWidth * 0.06,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "You want have quick acces to",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.screenWidth * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Wrap(
              spacing: SizeConfig.screenWidth * 0.032,
              runSpacing: SizeConfig.screenWidth * 0.035,

              children: List.generate(16, (index) {
                final isSelected = selectedIndex.contains(index);

                return GestureDetector(
                  onTap: () {
                    ref.read(selectedIndexesProvider.notifier).update((state) {
                      final newState = {...state};
                      if (newState.contains(index)) {
                        newState.remove(index); //unselect
                      } else {
                        if (newState.length < 4) {
                          newState.add(index); //add only if < 4
                        }
                      }
                      return newState;
                    });
                  },
                  child: Column(
                    children: [
                      AnimatedIconWidget(
                        child: SizedBox(
                          height: SizeConfig.screenWidth * 0.15,
                          width: SizeConfig.screenWidth * 0.15,
                          child: Stack(
                            children: [
                              IconWidget(),
                              if (isSelected)
                                Positioned(
                                  bottom: 1,
                                  right: 1,
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
                      SizedBox(height: SizeConfig.screenWidth * 0.01),

                      SizedBox(
                        width: SizeConfig.screenWidth * 0.2,
                        child: Text(
                          "Quick Link Label",
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
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.screenWidth * 0.02),
              child: Button(),
            ),
          ],
        ),
      ),
    );
  }
}
