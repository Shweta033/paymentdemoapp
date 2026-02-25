import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';
import 'package:paymentdemoapp/utills/colors_file.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordSheetController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  bool _obscurePassword = true;
  _CountryOption _selectedCountry = _countryOptions.first;

  static const Color _topBackground = Color(0xFFEDE8F7);
  static const Color _bottomBackground = Color(0xFFF4F5F8);
  static const Color _primary = Color(0xFF5732BF);
  static const Color _labelText = Color(0xFF25272D);
  static const Color _border = Color(0xFFD9DDE6);
  static const Color _hintText = Color(0xFFB3B8C3);

  @override
  void dispose() {
    passwordController.dispose();
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
                padding: const EdgeInsets.fromLTRB(26, 12, 26, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Icon(
                                CupertinoIcons.back,
                                color: AppColors.buttonColo,
                                size: 25,
                              ),
                              const Text(
                                'Back',
                                style: TextStyle(
                                  color: AppColors.buttonColo,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
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
                      ],
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
                                // maxLength: 10,
                                maxLines: 1,
                                minLines: 1,
                                controller: passwordController,
                                obscureText: _obscurePassword,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  hintText: 'Enter your password',
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),

                              // TextField(
                              //   controller: _mobileController,
                              //   keyboardType: TextInputType.visiblePassword,
                              //   inputFormatters: [
                              //     FilteringTextInputFormatter.digitsOnly,
                              //     LengthLimitingTextInputFormatter(10),
                              //   ],
                              //   decoration: const InputDecoration(
                              //     border: InputBorder.none,
                              //     hintText: 'Enter your password',
                              //     hintStyle: TextStyle(
                              //       color: _hintText,
                              //       fontSize: 18,
                              //     ),
                              //   ),
                              // ),
                            ),
                          ],
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _showForgotPasswordSheet,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.buttonColo,
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
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

  Future<void> _showForgotPasswordSheet() async {
    final emailController = TextEditingController();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF8F8FA),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        final viewInsets = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 18 + viewInsets),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: Color(0xFF202226),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Color(0xFF2163C9),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Email',
                style: TextStyle(
                  color: Color(0xFF202226),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'e.g. email@example.com',
                  hintStyle: const TextStyle(color: Color(0xFFA6ADB8)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFD3D7DF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFD3D7DF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF5B35C2)),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(this.context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Reset link sent to ${emailController.text.trim().isEmpty ? "your email" : emailController.text.trim()}',
                        ),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF5B35C2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send reset link',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: _showForgotMobileSheet,

                  child: const Text(
                    'Use mobile instead',
                    style: TextStyle(
                      color: Color(0xFF2163C9),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    emailController.dispose();
  }

  Future<void> _showForgotMobileSheet() async {
    final emailController = TextEditingController();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF8F8FA),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (context) {
        final viewInsets = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 18, 20, 18 + viewInsets),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: Color(0xFF202226),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Color(0xFF2163C9),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Mobile number',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: _border, width: 1.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<_CountryOption>(
                        value: _selectedCountry,
                        items: _countryOptions
                            .map(
                              (country) => DropdownMenuItem<_CountryOption>(
                                value: country,
                                child: Text(
                                  '${country.flag} ${country.dialCode}',
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedCountry = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter 10 digit number',
                          hintStyle: TextStyle(color: _hintText, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.signupView);
                  },
                  // onPressed: () {
                  //   Navigator.of(context).pop();
                  //   ScaffoldMessenger.of(this.context).showSnackBar(
                  //     SnackBar(
                  //       content: Text(
                  //         'Reset link sent to ${emailController.text.trim().isEmpty ? "your email" : emailController.text.trim()}',
                  //       ),
                  //     ),
                  //   );
                  // },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF5B35C2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send reset link',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Use mobile instead',
                    style: TextStyle(
                      color: Color(0xFF2163C9),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    emailController.dispose();
  }
}

class _PhoneIllustration extends StatelessWidget {
  const _PhoneIllustration();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.asset("assets/images/lockscreen.png", scale: 2)],
    );
  }
}

class _CountryOption {
  const _CountryOption({
    required this.name,
    required this.dialCode,
    required this.flag,
  });

  final String name;
  final String dialCode;
  final String flag;
}

const List<_CountryOption> _countryOptions = [
  _CountryOption(name: 'Jordan', dialCode: '+962', flag: '🇯🇴'),
  _CountryOption(name: 'India', dialCode: '+91', flag: '🇮🇳'),
  _CountryOption(name: 'UAE', dialCode: '+971', flag: '🇦🇪'),
  _CountryOption(name: 'USA', dialCode: '+1', flag: '🇺🇸'),
  _CountryOption(name: 'UK', dialCode: '+44', flag: '🇬🇧'),
  _CountryOption(name: 'Pakistan', dialCode: '+92', flag: '🇵🇰'),
  _CountryOption(name: 'Bangladesh', dialCode: '+880', flag: '🇧🇩'),
  _CountryOption(name: 'Nepal', dialCode: '+977', flag: '🇳🇵'),
  _CountryOption(name: 'Saudi Arabia', dialCode: '+966', flag: '🇸🇦'),
  _CountryOption(name: 'Qatar', dialCode: '+974', flag: '🇶🇦'),
  _CountryOption(name: 'Kuwait', dialCode: '+965', flag: '🇰🇼'),
  _CountryOption(name: 'Oman', dialCode: '+968', flag: '🇴🇲'),
  _CountryOption(name: 'Bahrain', dialCode: '+973', flag: '🇧🇭'),
  _CountryOption(name: 'Egypt', dialCode: '+20', flag: '🇪🇬'),
  _CountryOption(name: 'Canada', dialCode: '+1', flag: '🇨🇦'),
];
