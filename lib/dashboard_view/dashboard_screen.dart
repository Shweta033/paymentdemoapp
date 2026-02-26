import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymentdemoapp/controllers/dashboard_controller.dart';
import 'package:paymentdemoapp/dashboard_view/cards_screen.dart';
import 'package:paymentdemoapp/dashboard_view/moreModule/more_screen.dart';
import 'package:paymentdemoapp/utills/colors_file.dart';

import 'history_screen.dart';
import 'home_screen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  static const Color selectedColor = Color(0xFFF4C430);
  static const Color unselectedColor = Colors.black;
  static final navItems = <BottomNavItem>[
    BottomNavItem(icon: Icons.home_outlined, label: 'Home'),
    BottomNavItem(icon: Icons.history_edu, label: 'History'),
    BottomNavItem(icon: Icons.credit_card, label: 'Cards'),
    BottomNavItem(icon: Icons.more, label: 'Reports'),
  ];

  List<Widget> get tabs => const [
    HomeScreen(),
    HistoryView(),
    CardsScreen(),
    MoreScreen(),

    // BillingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: tabs),
      bottomNavigationBar: Container(
        height: 84,
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final selected = index == _selectedIndex;
              return InkWell(
                onTap: () {
                  if (_selectedIndex == index) return;
                  setState(() => _selectedIndex = index);
                },
                child: SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: selected
                            ? AppColors.primary
                            : unselectedColor.withAlpha(-1),
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: selected
                              ? AppColors.primary
                              : unselectedColor.withAlpha(-1),
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
