import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayBillsScreen extends StatelessWidget {
  const PayBillsScreen({super.key});

  static const Color _line = Color(0xFFDDE2EA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: Get.back,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 17,
                      color: Color(0xFF1D63D6),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: Color(0xFF1D63D6),
                        fontWeight: FontWeight.w700,
                        fontSize: 16 / 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56),
            const Text(
              'Pay to',
              style: TextStyle(
                color: Color(0xFF1F2329),
                fontSize: 56 / 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9CEF8),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF5B39C9),
                    size: 36,
                  ),
                ),
                const SizedBox(width: 14),
                const Text(
                  'New biller',
                  style: TextStyle(
                    color: Color(0xFF1F2329),
                    fontSize: 20 / 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Row(
              children: [
                Expanded(
                  child: Divider(color: _line, thickness: 1.2, endIndent: 16),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    color: Color(0xFF7C8796),
                    fontSize: 18 / 1.2,
                  ),
                ),
                Expanded(
                  child: Divider(color: _line, thickness: 1.2, indent: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FC),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFD3D9E3)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 34, color: Color(0xFF1F2328)),
                  SizedBox(width: 10),
                  Text(
                    'Search biller',
                    style: TextStyle(
                      color: Color(0xFFB4BCC8),
                      fontSize: 36 / 2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Saved billers',
              style: TextStyle(
                color: Color(0xFF515D6D),
                fontSize: 19 / 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            _billerRow(
              title: 'Electricity',
              subtitle: 'Due: \$132.32',
              icon: Icons.tips_and_updates_outlined,
              iconColor: const Color(0xFF5B39C9),
              iconBg: const Color(0xFFE2DAFB),
            ),
            _billerRow(
              title: 'Water',
              subtitle: 'Due: \$32.21',
              icon: Icons.water_drop_outlined,
              iconColor: const Color(0xFF1F67CC),
              iconBg: const Color(0xFFDCE7F8),
            ),
            _billerRow(
              title: 'Phone',
              subtitle: 'All paid',
              icon: Icons.podcasts,
              iconColor: const Color(0xFF1D9B48),
              iconBg: const Color(0xFFDCEFE4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _billerRow({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: _line)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(13),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF1F2329),
                      fontWeight: FontWeight.w700,
                      fontSize: 36 / 2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF5A6574),
                      fontWeight: FontWeight.w500,
                      fontSize: 20 / 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 26, color: Color(0xFF677482)),
          ],
        ),
      ),
    );
  }
}
