import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _mobileController = TextEditingController();

  static const Color _topBackground = Color(0xFFEDE8F7);
  static const Color _bottomBackground = Color(0xFFF4F5F8);
  static const Color _primary = Color(0xFF5732BF);
  static const Color _labelText = Color(0xFF25272D);
  static const Color _border = Color(0xFFD9DDE6);
  static const Color _hintText = Color(0xFFB3B8C3);

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _topBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 58,
              child: Container(
                width: double.infinity,
                color: _topBackground,
                padding: const EdgeInsets.fromLTRB(26, 12, 26, 20),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: _primary,
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(text: 'Tap’nPay'),
                          TextSpan(
                            text: '•',
                            style: TextStyle(
                              color: Color(0xFFF2B814),
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const _PhoneIllustration(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 52,
              child: Container(
                width: double.infinity,

                color: _bottomBackground,
                padding: const EdgeInsets.fromLTRB(26, 26, 26, 22),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      const Text(
                        'Enter your password',
                        style: TextStyle(
                          color: _labelText,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15),
                      const Text(
                        'Enter your password',
                        style: TextStyle(
                          color: _labelText,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: _border, width: 1.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: _mobileController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(
                                    color: _hintText,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),

                      Align(
                        alignment: Alignment.topRight,
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: _primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
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

class _PhoneIllustration extends StatelessWidget {
  const _PhoneIllustration();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset("assets/images/phoneimg.png", scale: 2)],
    );
  }
}
