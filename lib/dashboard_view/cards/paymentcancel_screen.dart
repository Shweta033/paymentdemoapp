import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_rotes.dart';


class PaymentCancelView extends StatelessWidget {
  const PaymentCancelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0F2),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
              child: Row(
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      color: Color(0xFF1F2329),
                      fontSize: 36 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.signal_cellular_alt, size: 16),
                  const SizedBox(width: 6),
                  const Icon(Icons.wifi, size: 16),
                  const SizedBox(width: 6),
                  Container(
                    width: 28,
                    height: 14,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF1F2329),
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 126,
                          height: 126,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE25555),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          top: 6,
                          left: 6,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1C5C5),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 8,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1C5C5),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          left: -8,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1C5C5),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 18,
                          right: -8,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF1C5C5),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Container(
                          width: 72,
                          height: 86,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F4F7),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.close,
                                color: Color(0xFFE25555),
                                size: 38 / 2,
                              ),
                              SizedBox(height: 8),
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
                    const SizedBox(height: 18),
                    const Text(
                      'Transfer Failed:(',
                      style: TextStyle(
                        color: Color(0xFF1F2329),
                        fontSize: 40 / 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your transfer has been declined\ndue to a technical issue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF596472),
                        fontSize: 17 / 1.2,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.addCardScreen),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A35CC),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size.fromHeight(46),
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
