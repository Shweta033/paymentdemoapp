import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymentdemoapp/dashboard_view/cards/paymentdone_screen.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';

class CodeSubmitView extends StatelessWidget {
  const CodeSubmitView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (Get.arguments as Map?)?.cast<String, dynamic>() ?? {};
    final name = (args['name'] as String?) ?? 'Ali Ahmed';
    final phone = (args['phone'] as String?) ?? '+1-300-555-0161';
    final emoji = (args['emoji'] as String?) ?? '🤠';
    final bgColor = (args['bgColor'] as Color?) ?? const Color(0xFFF5E4C6);
    final amount = (args['amount'] as String?) ?? '\$1,252.00';

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
              child: Align(
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
            ),
            const SizedBox(height: 48),
            const Text(
              'Transfer to',
              style: TextStyle(
                color: Color(0xFF1F2329),
                fontSize: 56 / 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 62,
                  height: 62,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(emoji, style: const TextStyle(fontSize: 31 / 2)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF1F2329),
                        fontWeight: FontWeight.w700,
                        fontSize: 34 / 2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      phone,
                      style: const TextStyle(
                        color: Color(0xFF7C8796),
                        fontWeight: FontWeight.w500,
                        fontSize: 18 / 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Enter Amount',
              style: TextStyle(color: Color(0xFF7C8796), fontSize: 16 / 1.2),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: const TextStyle(
                color: Color(0xFF262B31),
                fontSize: 74 / 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Container(width: 170, height: 2, color: const Color(0xFF6B7280)),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed(AppRoutes.paymentCancelView);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute<void>(
                    //     builder: (_) => PaymentDoneView(
                    //       billerName: '${name.toLowerCase()} company inc.',
                    //       amount: amount,
                    //       transactionNo: '23010412432431',
                    //     ),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6C129),
                    foregroundColor: const Color(0xFF250A7F),
                    elevation: 0,
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  icon: const Icon(Icons.verified_user_outlined, size: 18),
                  label: const Text(
                    'Secure payment',
                    style: TextStyle(
                      fontSize: 18 / 1.2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
