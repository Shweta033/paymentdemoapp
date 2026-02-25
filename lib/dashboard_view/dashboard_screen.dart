import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:paymentdemoapp/routes/app_rotes.dart';
import 'package:paymentdemoapp/utills/colors_file.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

  static const Color _accentPurple = Color(0xFF6B46F2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        children: [
          _buildTopSection(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRecentTransfers(),
                  const SizedBox(height: 22),
                  _buildLatestTransactions(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _accentPurple,
        unselectedItemColor: const Color(0xFF66707D),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy_outlined),
            label: 'More',
          ),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
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
    );
  }

  Widget _buildRecentTransfers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Transfers',
          style: TextStyle(
            color: Color(0xFF222326),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 106,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _TransferAvatar(
                emoji: '+',
                name: 'Add',
                bgColor: Color(0xFFE3DAFF),
              ),
              _TransferAvatar(
                emoji: '🤠',
                name: 'Ali',
                bgColor: Color(0xFFF5E4C6),
              ),
              _TransferAvatar(
                emoji: '🧔',
                name: 'Steve',
                bgColor: Color(0xFFECBAD4),
              ),
              _TransferAvatar(
                emoji: '🧑🏽',
                name: 'Ahmed',
                bgColor: Color(0xFFFF6A3D),
              ),
              _TransferAvatar(
                emoji: '👩',
                name: 'Maria',
                bgColor: Color(0xFFFFD84C),
              ),
            ],
          ),
        ),
      ],
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
}

class _QuickAction extends StatelessWidget {
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
