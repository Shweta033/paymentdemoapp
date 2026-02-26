import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'My Cards',
                      style: TextStyle(
                        color: Color(0xFF1E2228),
                        fontSize: 42 / 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.addCardScreen);
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Add card',
                          style: TextStyle(
                            color: Color(0xFF1D63D6),
                            fontWeight: FontWeight.w700,
                            fontSize: 16 / 1.2,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.add, color: Color(0xFF1D63D6), size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: 300,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: _miniCard(
                        color: const Color(0xFFD9CEF8),
                        name: 'Abdullah Ghatasheh',
                        number: '**** 2312',
                        height: 98,
                      ),
                    ),
                    Positioned(
                      top: 44,
                      left: 0,
                      right: 0,
                      child: _miniCard(
                        color: const Color(0xFF7144EA),
                        textColor: Colors.white,
                        name: 'Abdullah Ghatasheh',
                        number: '**** 5432',
                        height: 112,
                      ),
                    ),
                    Positioned(top: 88, left: 0, right: 0, child: _mainCard()),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget _miniCard({
    required Color color,
    required String name,
    required String number,
    Color textColor = const Color(0xFF2A2D42),
    required double height,
  }) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 22 / 2,
              ),
            ),
          ),
          Text(
            number,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 22 / 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainCard() {
    return Container(
      height: 196,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2F0E96),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: -52,
            top: -18,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF5D4AE7), width: 1.2),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            right: -44,
            bottom: -54,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: const Color(0xFF4E2AC0),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            right: -40,
            bottom: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFFC227), width: 1.2),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Abdullah Ghatasheh',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 22 / 2,
                      ),
                    ),
                  ),
                  Text(
                    '**** 3245',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22 / 2,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Balance',
                style: TextStyle(color: Color(0xFFD8D3FF), fontSize: 15 / 1.2),
              ),
              SizedBox(height: 3),
              Text(
                '\$2,354',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 47 / 2,
                  height: 1,
                ),
              ),
            ],
          ),
          const Positioned(
            right: 8,
            bottom: 12,
            child: Icon(Icons.wifi, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }
}
