import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routes/app_rotes.dart';
import '../utills/colors_file.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _obscurePassword = true;
  bool _accepted = false;

  static const Color _background = Color(0xFFF4F4F6);
  static const Color _primary = Color(0xFF5B35C2);
  static const Color _labelText = Color(0xFF1F2126);
  static const Color _hintText = Color(0xFFAEB5C0);
  static const Color _border = Color(0xFFD5DAE3);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
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

            const SizedBox(height: 30),
            const Text(
              'Create Account',
              style: TextStyle(
                color: _labelText,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Name',
              style: TextStyle(
                color: _labelText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            _buildField(
              controller: _nameController,
              hint: 'e.g. John Doe',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 8),
            const Text(
              'Email',
              style: TextStyle(
                color: _labelText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            _buildField(
              controller: _emailController,
              hint: 'e.g. email@example.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            const Text(
              'Password',
              style: TextStyle(
                color: _labelText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            _buildField(
              controller: _passwordController,
              hint: 'Enter Confirm password',
              obscure: _obscurePassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFF636C77),
                ),
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              ' Confirm Password',
              style: TextStyle(
                color: _labelText,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),

            _buildField(
              controller: _confirmPassController,
              hint: 'Enter your password',
              obscure: _obscurePassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFF636C77),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Checkbox(
                    value: _accepted,
                    onChanged: (value) {
                      setState(() {
                        _accepted = value ?? false;
                      });
                    },
                    side: const BorderSide(color: Color(0xFF6A727D), width: 2),
                    activeColor: _primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: _labelText,
                        fontSize: 15,
                        height: 1.35,
                      ),
                      children: [
                        TextSpan(text: 'I accept '),
                        TextSpan(
                          text: 'terms and conditions',
                          style: TextStyle(color: Color(0xFF205FC4)),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(color: Color(0xFF205FC4)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: FilledButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.otpVerifyScreen);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: _primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Create a new account',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const _DividerText(label: 'or continue using'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _SocialButton(
                    type: _SocialType.facebook,
                    onTap: () => _openUrl('https://www.facebook.com/login'),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _SocialButton(
                    type: _SocialType.google,
                    onTap: () => _openUrl('https://accounts.google.com'),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _SocialButton(
                    type: _SocialType.apple,
                    onTap: () => _openUrl('https://appleid.apple.com/sign-in'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
  }) {
    return SizedBox(
      height: 58,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscure,
        inputFormatters: keyboardType == TextInputType.emailAddress
            ? null
            : [FilteringTextInputFormatter.singleLineFormatter],
        style: const TextStyle(color: _labelText, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: _hintText, fontSize: 20),
          suffixIcon: suffix,
          filled: true,
          fillColor: const Color(0xFFF4F4F6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: _border, width: 1.6),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: _border, width: 1.6),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: _primary, width: 1.8),
          ),
        ),
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Unable to open link')));
    }
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
