import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_rotes.dart';

class PaymentCodeView extends StatefulWidget {
  const PaymentCodeView({super.key});

  @override
  State<PaymentCodeView> createState() => _PaymentCodeViewState();
}

class _PaymentCodeViewState extends State<PaymentCodeView> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    final args = (Get.arguments as Map?)?.cast<String, dynamic>() ?? {};
    final name = (args['name'] as String?) ?? 'Ali Ahmed';
    final phone = (args['phone'] as String?) ?? '+1-300-555-0161';
    final emoji = (args['emoji'] as String?) ?? '🤠';
    final bgColor = (args['bgColor'] as Color?) ?? const Color(0xFFF5E4C6);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
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
            const SizedBox(height: 22),
            const Text(
              'Transfer to',
              style: TextStyle(
                color: Color(0xFF1F2329),
                fontSize: 56 / 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 22),
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
            const SizedBox(height: 22),
            const Text(
              'Enter Amount',
              style: TextStyle(color: Color(0xFF7C8796), fontSize: 16 / 1.2),
            ),
            const SizedBox(height: 8),
            Text(
              _displayAmount(),
              style: TextStyle(
                color: _input.isEmpty
                    ? const Color(0xFFA7B0BA)
                    : const Color(0xFF8D97A4),
                fontSize: 74 / 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(width: 150, height: 2, color: const Color(0xFF5A35CC)),
            const SizedBox(height: 18),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 14),
                    _keyRow(['1', '2', '3']),
                    _keyRow(['4', '5', '6']),
                    _keyRow(['7', '8', '9']),
                    _keyRow(['.', '0', '⌫']),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _canSubmit()
                              ? () => Get.toNamed(AppRoutes.codeSubmitView)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF5A35CC),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(0xFFB8A9E8),
                            elevation: 0,
                            minimumSize: const Size.fromHeight(44),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18 / 1.2,
                            ),
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
      ),
    );
  }

  Widget _keyRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: keys
            .map(
              (k) => Expanded(
                child: InkWell(
                  onTap: () => _onKeyTap(k),
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: k == '⌫'
                          ? const Icon(
                              Icons.backspace_outlined,
                              color: Color(0xFF2A2E33),
                              size: 24,
                            )
                          : Text(
                              k,
                              style: const TextStyle(
                                color: Color(0xFF2A2E33),
                                fontSize: 42 / 2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  void _onKeyTap(String key) {
    setState(() {
      if (key == '⌫') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
        return;
      }

      if (key == '.') {
        if (_input.isEmpty) {
          _input = '0.';
          return;
        }
        if (!_input.contains('.')) {
          _input = '$_input.';
        }
        return;
      }

      if (_input.contains('.')) {
        final decimals = _input.split('.').last;
        if (decimals.length >= 2) return;
      }

      if (_input.length >= 5) return;
      _input = '$_input$key';
    });
  }

  String _displayAmount() => ' \$${_input.isEmpty ? '00.00' : _input}';

  bool _canSubmit() {
    final value = double.tryParse(_input) ?? 0;
    return value > 0;
  }
}
