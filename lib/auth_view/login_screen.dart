import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mobileController = TextEditingController();
  _CountryOption _selectedCountry = _countryOptions.first;

  static const Color _topBackground = Color(0xFFEDE8F7);
  static const Color _bottomBackground = Color(0xFFF4F5F8);
  static const Color _primary = Color(0xFF5B35C2);
  static const Color _titleText = Color(0xFF1E2025);
  static const Color _labelText = Color(0xFF25272D);
  static const Color _hintText = Color(0xFFB3B8C3);
  static const Color _border = Color(0xFFD9DDE6);

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter your mobile number',
                        style: TextStyle(
                          color: _titleText,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 22),
                      const Text(
                        'Mobile number',
                        style: TextStyle(
                          color: _labelText,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
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
                                      (
                                        country,
                                      ) => DropdownMenuItem<_CountryOption>(
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
                                controller: _mobileController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter 10 digit number',
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
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: FilledButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.passwordScreen);
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: _primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const _DividerText(label: 'or continue using'),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: _SocialButton(type: _SocialType.facebook),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: _SocialButton(
                              type: _SocialType.google,
                              onTap: _openGoogleAuth,
                            ),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: _SocialButton(type: _SocialType.apple),
                          ),
                        ],
                      ),
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

  Future<void> _openGoogleAuth() async {
    final uri = Uri.parse('https://accounts.google.com');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open Google at the moment')),
      );
    }
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

class _DividerText extends StatelessWidget {
  const _DividerText({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFDDE1EA), thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF7A8395), fontSize: 14),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFDDE1EA), thickness: 1)),
      ],
    );
  }
}

enum _SocialType { facebook, google, apple }

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.type, this.onTap});

  final _SocialType type;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget icon;
    if (type == _SocialType.facebook) {
      icon = const Text(
        'f',
        style: TextStyle(
          color: Color(0xFF1877F2),
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),
      );
    } else if (type == _SocialType.google) {
      icon = const Text(
        'G',
        style: TextStyle(
          color: Color(0xFFDB4437),
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),
      );
    } else {
      icon = const Icon(Icons.apple, color: Colors.black, size: 38);
    }

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE2E5ED), width: 1.2),
          ),
          child: icon,
        ),
      ),
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
