import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_rotes.dart';
import '../utills/colors_file.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF270685), Color(0xFF270685)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEE0C6),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text('🤠', style: TextStyle(fontSize: 27)),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Hello,\nAbdullah!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Color(0xFF3610A8), Color(0xFF4E2BD2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Main balance',
                    style: TextStyle(
                      color: Color(0xFFD5CCFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    r'$14,235.34',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(
                        child: _QuickAction(
                          icon: Icons.arrow_upward,
                          label: 'Top up',
                        ),
                      ),
                      _Divider(),
                      Expanded(
                        child: _QuickAction(
                          icon: Icons.arrow_downward,
                          label: 'Withdraw',
                        ),
                      ),
                      _Divider(),
                      Expanded(
                        child: _QuickAction(icon: Icons.sync, label: 'Transfer'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  Widget _buildLatestTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Latest Transactions',
              style: TextStyle(
                color: Color(0xFF222326),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.historyView);
              },
              child: const Text(
                'View all',
                style: TextStyle(color: Color(0xFF787E87), fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const _TransactionTile(
          logo: '✳️',
          title: 'Walmart',
          subtitle: 'Today 12:32',
          amount: '-\$35.23',
          amountColor: AppColors.dollers,
        ),
        const _TransactionTile(
          logo: '↥',
          title: 'Top up',
          subtitle: 'Yesterday 02:12',
          amount: '+\$430.00',
          amountColor: Color(0xFF2AA566),
        ),
        const _TransactionTile(
          logo: 'N',
          title: 'Netflix',
          subtitle: 'Dec 24 13:53',
          amount: '-\$13.00',
          amountColor: Color(0xFFD84848),
          logoTextColor: Color(0xFFE62D2D),
          logoBackground: Colors.black,
        ),
      ],
    );
  }

}class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 28, color: const Color(0xFF6F4CDF));
  }
}




class _TransferAvatar extends StatelessWidget {
  const _TransferAvatar({
    required this.emoji,
    required this.name,
    required this.bgColor,
  });

  final String emoji;
  final String name;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 14, color: Color(0xFF292C30)),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.logo,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    this.logoTextColor = Colors.white,
    this.logoBackground = const Color(0xFF2D7DD9),
  });

  final String logo;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final Color logoTextColor;
  final Color logoBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE3E7ED))),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: logoBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              logo,
              style: TextStyle(
                color: logoTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF222326),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF747C86),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.chevron_right, color: Color(0xFF7A808A)),
        ],
      ),
    );
  }
}


