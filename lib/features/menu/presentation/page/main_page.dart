import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/features/menu/presentation/controller/bottom_navbar_provider.dart';
import 'package:tasks/features/menu/presentation/page/menu_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavbarIndex = ref.watch(bottomNavbarProvider);
    final List<Widget> pages = [
      Center(child: Text("Home Page")),
      Center(child: Text("Bills Page")),
      Center(child: Text("Transfer Page")),
      Center(child: Text("Wallet Page")),
      MenuPage(),
    ];
    return Scaffold(
      body: pages[bottomNavbarIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: bottomNavbarIndex,
          onTap: (index) {
            ref.read(bottomNavbarProvider.notifier).state = index;
          },
          selectedIconTheme: IconThemeData(color: Colors.black),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          showUnselectedLabels: true,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.tab), label: "Bills"),
            BottomNavigationBarItem(
              icon: Icon(Icons.ios_share_outlined),
              label: "Transfers",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          ],
        ),
      ),
    );
  }
}
