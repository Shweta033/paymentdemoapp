import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: Get.back,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                        color: Color(0xFF1D63D6),
                      ),
                      SizedBox(width: 4),
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
            const SizedBox(height: 58),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _mainCard(),
            ),
            const Spacer(),
            Column(
              children: const [
                Icon(Icons.wifi_rounded, color: Color(0xFF8D97A6), size: 34),
                SizedBox(height: 10),
                Text(
                  'Move near a device to pay',
                  style: TextStyle(
                    color: Color(0xFF738091),
                    fontSize: 35 / 2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E38C4),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    '⬡ QR Pay',
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
