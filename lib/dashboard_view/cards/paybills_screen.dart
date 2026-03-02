import 'package:flutter/material.dart';
import 'package:paymentdemoapp/dashboard_view/cards/paymentdone_screen.dart';

class PayBillsScreen extends StatelessWidget {
  const PayBillsScreen({super.key});

  static const Color _line = Color(0xFFDDE2EA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Navigator.of(context).maybePop(),
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
            const SizedBox(height: 56),
            const Text(
              'Pay to',
              style: TextStyle(
                color: Color(0xFF1F2329),
                fontSize: 56 / 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(36),
                  onTap: () => _openBillerSheet(
                    context,
                    const _Biller(
                      title: 'New biller',
                      subtitle: 'Due: \$0.00',
                      icon: Icons.add,
                      iconColor: Color(0xFF5B39C9),
                      iconBg: Color(0xFFD9CEF8),
                    ),
                  ),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9CEF8),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF5B39C9),
                      size: 36,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                const Text(
                  'New biller',
                  style: TextStyle(
                    color: Color(0xFF1F2329),
                    fontSize: 20 / 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Row(
              children: [
                Expanded(
                  child: Divider(color: _line, thickness: 1.2, endIndent: 16),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    color: Color(0xFF7C8796),
                    fontSize: 18 / 1.2,
                  ),
                ),
                Expanded(
                  child: Divider(color: _line, thickness: 1.2, indent: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FC),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFD3D9E3)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: const Row(
                children: [
                  Icon(Icons.search, size: 34, color: Color(0xFF1F2328)),
                  SizedBox(width: 10),
                  Text(
                    'Search biller',
                    style: TextStyle(
                      color: Color(0xFFB4BCC8),
                      fontSize: 36 / 2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Saved billers',
              style: TextStyle(
                color: Color(0xFF515D6D),
                fontSize: 19 / 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            _billerRow(
              context,
              title: 'Electricity',
              subtitle: 'Due: \$132.32',
              icon: Icons.tips_and_updates_outlined,
              iconColor: const Color(0xFF5B39C9),
              iconBg: const Color(0xFFE2DAFB),
            ),
            _billerRow(
              context,
              title: 'Water',
              subtitle: 'Due: \$32.21',
              icon: Icons.water_drop_outlined,
              iconColor: const Color(0xFF1F67CC),
              iconBg: const Color(0xFFDCE7F8),
            ),
            _billerRow(
              context,
              title: 'Phone',
              subtitle: 'All paid',
              icon: Icons.podcasts,
              iconColor: const Color(0xFF1D9B48),
              iconBg: const Color(0xFFDCEFE4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _billerRow(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required Color iconColor,
        required Color iconBg,
      }) {
    return InkWell(
      onTap: () => _openBillerSheet(
        context,
        _Biller(
          title: title,
          subtitle: subtitle,
          icon: icon,
          iconColor: iconColor,
          iconBg: iconBg,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: _line)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(13),
              ),
              alignment: Alignment.center,
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF1F2329),
                      fontWeight: FontWeight.w700,
                      fontSize: 36 / 2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF5A6574),
                      fontWeight: FontWeight.w500,
                      fontSize: 20 / 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 26, color: Color(0xFF677482)),
          ],
        ),
      ),
    );
  }

  Future<void> _openBillerSheet(BuildContext context, _Biller biller) async {
    final dueText = biller.subtitle.startsWith('Due:')
        ? biller.subtitle
        : biller.subtitle;
    final dueColor = biller.subtitle.toLowerCase().contains('all paid')
        ? const Color(0xFF1D9B48)
        : const Color(0xFFC33838);

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: const Color(0x99000000),
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 18, 14, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: biller.iconBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Icon(biller.icon, color: biller.iconColor, size: 26),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            biller.title,
                            style: const TextStyle(
                              color: Color(0xFF1F2329),
                              fontWeight: FontWeight.w700,
                              fontSize: 20 / 1.2,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Utility',
                            style: TextStyle(
                              color: Color(0xFF7B8796),
                              fontSize: 16 / 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(sheetContext).pop(),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Color(0xFF1D63D6),
                            fontSize: 19 / 1.2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8ECEC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    dueText,
                    style: TextStyle(
                      color: dueColor,
                      fontSize: 41 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _sheetInfoCard(
                  title: 'Due date',
                  value: 'December 29, 2022 - 12:32',
                ),
                const SizedBox(height: 8),
                _sheetInfoCard(
                  title: 'Registration no.',
                  value: '23010412432431',
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(sheetContext).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => PaymentDoneView(
                            billerName:
                            '${biller.title.toLowerCase()} company inc.',
                            amount: _extractAmount(biller.subtitle),
                            transactionNo: '23010412432431',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6C129),
                      foregroundColor: const Color(0xFF250A7F),
                      elevation: 0,
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    icon: const Icon(Icons.verified_user_outlined, size: 18),
                    label: const Text(
                      'Secure payment',
                      style: TextStyle(
                        fontSize: 18 / 1.2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sheetInfoCard({required String title, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDEE3EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF8A94A2),
              fontSize: 15 / 1.2,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF46515E),
              fontWeight: FontWeight.w600,
              fontSize: 18 / 1.2,
            ),
          ),
        ],
      ),
    );
  }

  String _extractAmount(String subtitle) {
    if (subtitle.toLowerCase().contains('all paid')) {
      return '\$0.00';
    }
    final clean = subtitle.replaceFirst('Due: ', '').trim();
    return clean.isEmpty ? '\$0.00' : clean;
  }
}

class _Biller {
  const _Biller({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
}
