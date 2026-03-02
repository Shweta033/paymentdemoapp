import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';

class PaymentDoneView extends StatelessWidget {
  const PaymentDoneView({
    super.key,
    required this.billerName,
    required this.amount,
    required this.transactionNo,
  });

  final String billerName;
  final String amount;
  final String transactionNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 122,
                          height: 122,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4EAC6D),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD0E9D9),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 14,
                          right: 6,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD0E9D9),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          left: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD0E9D9),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          right: 6,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD0E9D9),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F4F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.check,
                                color: Color(0xFF4EAC6D),
                                size: 34,
                              ),
                              SizedBox(height: 3),
                              Icon(
                                Icons.drag_handle,
                                color: Color(0xFFA2ABB8),
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Payment done!',
                      style: TextStyle(
                        color: Color(0xFF1F2329),
                        fontSize: 40 / 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Bill payment has been done\nsuccessfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF596472),
                        fontSize: 17 / 1.2,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 68),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Payment details',
                        style: TextStyle(
                          color: Color(0xFF1F2329),
                          fontSize: 34 / 2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    _InfoCard(title: 'Biller', value: billerName),
                    const SizedBox(height: 12),
                    _InfoCard(title: 'Amount', value: amount),
                    const SizedBox(height: 12),
                    _InfoCard(
                      title: 'Transaction no.',
                      value: transactionNo,
                      trailing: const Icon(
                        Icons.copy_outlined,
                        color: Color(0xFF646F7F),
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.outlined_flag,
                          color: Color(0xFFC33838),
                          size: 23,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Report a problem',
                          style: TextStyle(
                            color: Color(0xFFC33838),
                            fontWeight: FontWeight.w700,
                            fontSize: 30 / 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.paymentToView);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A35CC),
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(48),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    'Back to wallet',
                    style: TextStyle(
                      fontSize: 19 / 1.2,
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

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.value, this.trailing});

  final String title;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD9DFE8)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF7A8595),
                    fontSize: 16 / 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF4B5666),
                    fontSize: 20 / 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
