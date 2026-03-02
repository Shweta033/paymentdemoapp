import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';

class PaymentToView extends StatelessWidget {
  const PaymentToView({super.key});

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
              'Transfer to',
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
                  'New contact',
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
                    'Search contact',
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
              'Frequent contacts',
              style: TextStyle(
                color: Color(0xFF515D6D),
                fontSize: 19 / 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            _contactRow(name: 'Ali Ahmed', phone: '+1-300-555-0161', emoji: '🤠', bg: const Color(0xFFF5E4C6)),
            _contactRow(name: 'Steve Gates', phone: '+1-300-555-0119', emoji: '🧔', bg: const Color(0xFFE4A6C6)),
            _contactRow(name: 'Elon Jobs', phone: '+1-202-555-0171', emoji: '🧑🏽', bg: const Color(0xFFFF5B28)),
            const SizedBox(height: 10),
            const Text(
              'All contacts',
              style: TextStyle(
                color: Color(0xFF515D6D),
                fontSize: 19 / 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            _contactRow(name: 'Ali Ahmed', phone: '+1-300-555-0161', emoji: '🤠', bg: const Color(0xFFF5E4C6)),
            _contactRow(name: 'Steve Gates', phone: '+1-300-555-0119', emoji: '🧔', bg: const Color(0xFFE4A6C6)),
          ],
        ),
      ),
    );
  }

  Widget _contactRow({
    required String name,
    required String phone,
    required String emoji,
    required Color bg,
  }) {
    return InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.paymentCodeView);
      },
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
                color: bg,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 26)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xFF1F2329),
                      fontWeight: FontWeight.w700,
                      fontSize: 36 / 2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    phone,
                    style: const TextStyle(
                      color: Color(0xFF7C8796),
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
