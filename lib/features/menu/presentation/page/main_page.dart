import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasks/core/constants/app_strings/default_string.dart';
import 'package:tasks/core/constants/app_strings/parts/menu_page.dart';
import 'package:tasks/core/utils/size_config.dart';
import 'package:tasks/features/menu/presentation/controller/bottom_navbar_provider.dart';
import 'package:tasks/features/menu/presentation/page/menu_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    final s = DefaultStrings.instance;
    final bottomNavbarIndex = ref.watch(bottomNavbarProvider);
    final List<Widget> pages = [
      Center(child: Text("Home Page")),
      Center(child: Text("Offers Page")),
      Center(child: Text("Pay Page")),
      Center(child: Text("Wallet Page")),
      MenuPage(),
    ];
    return Scaffold(
      body: pages[bottomNavbarIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade400, width: 2),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenWidth * 0.02),
          child: BottomNavigationBar(
            currentIndex: bottomNavbarIndex,
            onTap: (index) {
              ref.read(bottomNavbarProvider.notifier).state = index;
            },
            selectedIconTheme: IconThemeData(color: Colors.black),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.screenWidth * 0.02,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.screenWidth * 0.02,
            ),
            showUnselectedLabels: true,

            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/menu_icons/home.svg"),
                label: s.botttomNavBarItem1,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/menu_icons/offers.svg"),
                label: s.botttomNavBarItem2,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/menu_icons/pay.svg"),
                label: s.botttomNavBarItem3,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/menu_icons/wallet.svg"),
                label: s.botttomNavBarItem4,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.close),
                label: s.botttomNavBarItem5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
