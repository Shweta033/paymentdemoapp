import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';

enum OtpMode { login, registration }

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({
    super.key,
    this.repository,
    this.mode,
    this.email = '',
    this.contactDisplay,
  });

  final Object? repository;
  final Object? mode;
  final String email;
  final String? contactDisplay;

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  static const int _countdownSeconds = 32;

  Timer? _timer;
  String _otp = '';
  int _remainingSeconds = _countdownSeconds;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() => _remainingSeconds = _countdownSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() => _remainingSeconds = 0);
      } else {
        setState(() => _remainingSeconds -= 1);
      }
    });
  }

  void _addDigit(String value) {
    if (_otp.length >= 6) return;
    setState(() => _otp += value);
  }

  void _removeDigit() {
    if (_otp.isEmpty) return;
    setState(() => _otp = _otp.substring(0, _otp.length - 1));
  }

  void _submit() {
    if (_otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 6-digit OTP')),
      );
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('UI only: entered OTP $_otp')));
  }

  @override
  Widget build(BuildContext context) {
    final contact = widget.contactDisplay ?? widget.email;
    final isEmailContact = contact.contains('@');
    final displayText = _formattedCode();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 88,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new, size: 16),
          label: const Text('Back'),
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF2E62CC),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Tap'nPay",
          style: TextStyle(
            color: Color(0xFF5A35C0),
            fontWeight: FontWeight.w700,
            fontSize: 34,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      Text(
                        isEmailContact
                            ? 'An OTP sent to your email'
                            : 'An SMS sent to your mobile number',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF161616),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        contact,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF161616),
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Enter six-digit code',
                        style: TextStyle(
                          color: Color(0xFF768293),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              displayText,
                              style: const TextStyle(
                                color: Color(0xFFADB6BF),
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: 180,
                        child: Divider(
                          height: 0,
                          thickness: 4,
                          color: Color(0xFF6035C8),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Resend code',
                            style: TextStyle(
                              color: _remainingSeconds == 0
                                  ? const Color(0xFF2E62CC)
                                  : const Color(0xFF768293),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Text(
                            _remainingSeconds == 0
                                ? '00:00'
                                : _formatTime(_remainingSeconds),
                            style: const TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: const Color(0xFFF2F2F2),
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      _KeypadButton(label: '1', onTap: _addDigit),
                      _KeypadButton(label: '2', onTap: _addDigit),
                      _KeypadButton(label: '3', onTap: _addDigit),
                    ],
                  ),
                  Row(
                    children: [
                      _KeypadButton(label: '4', onTap: _addDigit),
                      _KeypadButton(label: '5', onTap: _addDigit),
                      _KeypadButton(label: '6', onTap: _addDigit),
                    ],
                  ),
                  Row(
                    children: [
                      _KeypadButton(label: '7', onTap: _addDigit),
                      _KeypadButton(label: '8', onTap: _addDigit),
                      _KeypadButton(label: '9', onTap: _addDigit),
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(child: SizedBox(height: 72)),
                      _KeypadButton(label: '0', onTap: _addDigit),
                      Expanded(
                        child: InkWell(
                          onTap: _removeDigit,
                          borderRadius: BorderRadius.circular(36),
                          child: const SizedBox(
                            height: 72,
                            child: Center(
                              child: Icon(
                                Icons.backspace_outlined,
                                size: 26,
                                color: Color(0xFF222222),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.dashboardView);
                      },
                      // _submit,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF6035C8),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Done',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formattedCode() {
    final chars = List<String>.generate(
      6,
      (index) => index < _otp.length ? _otp[index] : 'X',
    );
    return '${chars[0]}${chars[1]}${chars[2]}-${chars[3]}${chars[4]}${chars[5]}';
  }

  String _formatTime(int totalSeconds) {
    final seconds = totalSeconds % 60;
    return '00:${seconds.toString().padLeft(2, '0')}';
  }
}

class _KeypadButton extends StatelessWidget {
  const _KeypadButton({required this.label, required this.onTap});

  final String label;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(label),
        borderRadius: BorderRadius.circular(36),
        child: SizedBox(
          height: 65,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
