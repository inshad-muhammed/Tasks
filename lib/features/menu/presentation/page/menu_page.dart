import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/menu/presentation/controller/toggle_state_provider.dart';
import 'package:tasks/features/menu/presentation/widget/icons.dart';
import 'package:tasks/features/menu/presentation/widget/item_card.dart';
import 'package:tasks/features/menu/presentation/widget/refer_card.dart';
import 'package:tasks/features/menu/presentation/widget/toggle.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    final themeIndex = ref.watch(themeToggleProvider);
    final languageIndex = ref.watch(languageToggleProvider);
    return Scaffold(
      body: SafeArea(
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
                          "Alqabiadi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenWidth * 0.046,
                          ),
                        ),
                        Text(
                          "View Profile",
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
                  children: [
                    ItemCard(
                      image: "assets/images/accounts.png",
                      title: 'Accounts',
                    ),
                    ItemCard(
                      image: "assets/images/credit1.png",
                      title: 'Credit Cards',
                    ),
                    ItemCard(
                      image: "assets/images/deposits.png",
                      title: 'Deposits',
                    ),
                    ItemCard(
                      image: "assets/images/finance.png",
                      title: 'Finance',
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWidget(
                      title: 'Requests',
                      icon: 'assets/menu_icons/request.svg',
                      function: () {},
                    ),
                    IconWidget(
                      title: 'Reach Us',
                      icon: 'assets/menu_icons/reachus.svg',
                      function: () {},
                    ),

                    IconWidget(
                      title: 'Offer',
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
                          ref.read(themeToggleProvider.notifier).state = index,
                      title: 'Themes',
                    ),

                    SegmentedToggle(
                      options: const [
                        Text(
                          "عربي",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "English",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                      selectedIndex: languageIndex,
                      activeColor: Colors.blue.shade200,
                      onChanged: (index) =>
                          ref.read(languageToggleProvider.notifier).state =
                              index,
                      title: 'Language',
                    ),
                    IconWidget(
                      title: "Logout",
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
    );
  }
}
