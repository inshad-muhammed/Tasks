import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/menu_page.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/menu/presentation/controller/main_card_service_provider.dart';
import 'package:tasks/features/menu/presentation/controller/toggle_state_provider.dart';
import 'package:tasks/features/menu/presentation/widget/icons.dart';
import 'package:tasks/features/menu/presentation/widget/item_card.dart';
import 'package:tasks/features/menu/presentation/widget/refer_card.dart';
import 'package:tasks/features/menu/presentation/widget/shimmer_effect.dart';
import 'package:tasks/features/menu/presentation/widget/toggle.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    final s = DefaultStrings.instance;
    final themeIndex = ref.watch(themeToggleProvider);
    final languageIndex = ref.watch(languageToggleProvider);
    final asyncMainCard = ref.watch(mainCardProvider);
    return Scaffold(
      body: asyncMainCard.when(
        loading: () => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ShimmerEffectMenuPage(),
        ),
        error: (error, stack) => Center(child: Text("Error: $error")),

        data: (mainCardItems) => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    spacing: SizeConfig.screenWidth * 0.02,
                    children: [
                      CircleAvatar(
                        radius: SizeConfig.screenWidth * 0.056,
                        backgroundImage: NetworkImage(
                          "https://www.shutterstock.com/image-photo/positive-handsome-arabic-businessman-beard-600nw-2510267591.jpg",
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.userName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.screenWidth * 0.046,
                            ),
                          ),
                          Text(
                            s.viewProfileButtonText,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: SizeConfig.screenWidth * 0.1,
                        width: SizeConfig.screenWidth * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.screenWidth * 0.5,
                          ),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Icon(
                          Icons.settings_outlined,
                          color: const Color(0xff446193),
                          size: SizeConfig.screenWidth * 0.065,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Wrap(
                    spacing: SizeConfig.screenWidth * 0.035,
                    runSpacing: SizeConfig.screenWidth * 0.035,
                    children: List.generate(mainCardItems.length, (index) {
                      final items = mainCardItems[index];
                      return ItemCard(
                        image: items.imagePath,
                        title: items.lable,
                      );
                    }),
                  ),

                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWidget(
                        title: s.requestsIconTitle,
                        icon: 'assets/menu_icons/request.svg',
                        function: () {},
                      ),
                      IconWidget(
                        title: s.reachUsIconTitle,
                        icon: 'assets/menu_icons/reachus.svg',
                        function: () {},
                      ),

                      IconWidget(
                        title: s.offerIconTitle,
                        icon: 'assets/menu_icons/offers.svg',
                        function: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  ReferCard(),
                  SizedBox(height: SizeConfig.screenWidth * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SegmentedToggle(
                        options: const [
                          Icon(
                            Icons.dark_mode_outlined,
                            color: Colors.black,
                          ), // dark
                          Icon(
                            Icons.light_mode_outlined,
                            color: Colors.black,
                          ), // light
                        ],
                        selectedIndex: themeIndex,
                        activeColor: Colors.grey.shade700,
                        onChanged: (index) =>
                            ref.read(themeToggleProvider.notifier).state =
                                index,
                        title: s.segmentedToggleTitle1,
                      ),

                      SegmentedToggle(
                        options: [
                          Text(
                            s.toggleLanguageOption2,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            s.toggleLanguageOption1,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                        selectedIndex: languageIndex,
                        activeColor: Colors.blue.shade200,
                        onChanged: (index) =>
                            ref.read(languageToggleProvider.notifier).state =
                                index,
                        title: s.segmentedToggleTitle2,
                      ),
                      IconWidget(
                        title: s.logoutIconTitle,
                        icon: "assets/menu_icons/logout.svg",
                        function: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenWidth * 0.04),

                  SizedBox(height: SizeConfig.screenWidth * 0.02),
                  // Divider(color: Colors.grey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
