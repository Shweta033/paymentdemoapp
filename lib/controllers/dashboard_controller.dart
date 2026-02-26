import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymentdemoapp/dashboard_view/history_screen.dart';
import 'package:paymentdemoapp/dashboard_view/home_screen.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;

  static const Color selectedColor = Color(0xFFF4C430);
  static const Color unselectedColor = Colors.white;
  static final navItems = <BottomNavItem>[
    BottomNavItem(icon: Icons.home, label: 'Home'),
    BottomNavItem(icon: Icons.history, label: 'History'),
    BottomNavItem(icon: Icons.credit_card, label: 'Cards'),
    BottomNavItem(icon: Icons.more, label: 'Reports'),
  ];

  List<Widget> get tabs => const [
    HomeScreen(),
    HistoryView(),

    // BillingView(),
  ];
}

class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}
