import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_rotes.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  static const Color _textDark = Color(0xFF1F2329);
  static const Color _line = Color(0xFFDDE2EA);

  List<_MoreEntry> get _items => [
    _MoreEntry(
      title: 'Pay bills',
      icon: Icons.tips_and_updates_outlined,
      iconColor: const Color(0xFF5B39C9),
      iconBg: const Color(0xFFE2DAFB),
      onTap: () => Get.toNamed(AppRoutes.payBillsScreen),
    ),
    _MoreEntry(
      title: 'Transfer',
      icon: Icons.sync_alt,
      iconColor: const Color(0xFF1F67CC),
      iconBg: const Color(0xFFDCE7F8),
      onTap: () => ('Transfer'),
    ),
    _MoreEntry(
      title: 'Topup',
      icon: Icons.arrow_upward,
      iconColor: const Color(0xFF1D9B48),
      iconBg: const Color(0xFFDCEFE4),
      onTap: () => ('Topup'),
    ),
    _MoreEntry(
      title: 'Withdraw',
      icon: Icons.arrow_downward,
      iconColor: const Color(0xFFD34040),
      iconBg: const Color(0xFFF7DEDE),
      onTap: () => ('Withdraw'),
    ),
    _MoreEntry(
      title: 'Analytics',
      icon: Icons.pie_chart_outline,
      iconColor: const Color(0xFF9B47A5),
      iconBg: const Color(0xFFEEDCEF),
      onTap: () => ('Analytics'),
    ),
    // const _MoreEntry.divider(),
    _MoreEntry(
      title: 'Help',
      icon: Icons.help_outline,
      iconColor: const Color(0xFF9E6B08),
      iconBg: const Color(0xFFF7E5B7),
      onTap: () => ('Help'),
    ),
    _MoreEntry(
      title: 'Contact us',
      icon: Icons.support_agent,
      iconColor: const Color(0xFF2A9E8A),
      iconBg: const Color(0xFFD2EEE8),
      onTap: () => ('Contact us'),
    ),
    _MoreEntry(
      title: 'About',
      icon: Icons.info_outline,
      iconColor: const Color(0xFF6042CB),
      iconBg: const Color(0xFFDFD7FA),
      onTap: () => ('About'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _items.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Text(
                  'More',
                  style: TextStyle(
                    color: _textDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 42 / 2,
                  ),
                ),
              );
            }

            final item = _items[index - 1];
            if (item.isDivider) {
              return const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(
                  height: 4,
                  thickness: 4,
                  color: Color(0xFFE0E4EA),
                ),
              );
            }

            return InkWell(
              onTap: () => _onItemTap(item.title),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: _line)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: item.iconBg,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      alignment: Alignment.center,
                      child: Icon(item.icon, color: item.iconColor, size: 25),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          color: _textDark,
                          fontSize: 30 / 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 25,
                      color: Color(0xFF677482),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onItemTap(String title) {
    Get.snackbar(
      'More',
      '$title clicked',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      backgroundColor: Colors.white,
      colorText: _textDark,
      borderColor: const Color(0xFFDDE2EA),
      borderWidth: 1,
    );
  }
}

class _MoreEntry {
  const _MoreEntry({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.onTap,
  }) : isDivider = false;

  const _MoreEntry.divider(this.onTap)
    : title = '',
      icon = Icons.circle,
      iconColor = Colors.transparent,
      iconBg = Colors.transparent,
      isDivider = true;

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final bool isDivider;

  final dynamic onTap;
}
