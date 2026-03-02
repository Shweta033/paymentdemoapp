import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          color: const Color(0xFFF2F2F2),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 2, 20, 18),
                color: const Color(0xFF341199),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          '9:41',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38 / 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.signal_cellular_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.wifi, color: Colors.white, size: 16),
                        const SizedBox(width: 6),
                        Container(
                          width: 32,
                          height: 16,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEAD7B6),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            '🤠',
                            style: TextStyle(fontSize: 38 / 2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Hello,\nAbdullah!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28 / 2,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3F1CAE), Color(0xFF5A35CC)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Main balance',
                            style: TextStyle(
                              color: Color(0xFFC8BCFF),
                              fontSize: 20 / 2,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: const TextSpan(
                              text: r'$14,235',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 76 / 2,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: '.34',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28 / 2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Row(
                            children: [
                              Expanded(
                                child: _QuickAction(
                                  icon: Icons.arrow_upward,
                                  label: 'Top up',
                                ),
                              ),
                              _QuickActionDivider(),
                              Expanded(
                                child: _QuickAction(
                                  icon: Icons.arrow_downward,
                                  label: 'Withdraw',
                                ),
                              ),
                              _QuickActionDivider(),
                              Expanded(
                                child: _QuickAction(
                                  icon: Icons.sync_alt,
                                  label: 'Transfer',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent Transfers',
                        style: TextStyle(
                          color: Color(0xFF202226),
                          fontSize: 25 / 1.2,
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
                              bgColor: Color(0xFFE2D8FF),
                            ),
                            _TransferAvatar(
                              emoji: '🤠',
                              name: 'Ali',
                              bgColor: Color(0xFFF5E4C6),
                            ),
                            _TransferAvatar(
                              emoji: '🧔',
                              name: 'Steve',
                              bgColor: Color(0xFFE4A6C6),
                            ),
                            _TransferAvatar(
                              emoji: '🧑🏽',
                              name: 'Ahmed',
                              bgColor: Color(0xFFFF5B28),
                            ),
                            _TransferAvatar(
                              emoji: '👩',
                              name: 'Maria',
                              bgColor: Color(0xFFF4C434),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Latest Transactions',
                              style: TextStyle(
                                color: Color(0xFF202226),
                                fontSize: 25 / 1.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'View all',
                            style: TextStyle(
                              color: Color(0xFF8B8F97),
                              fontSize: 20 / 1.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const _TransactionTile(
                        iconBg: Color(0xFF1976D2),
                        iconText: '✳',
                        title: 'Walmart',
                        subtitle: 'Today 12:32',
                        amount: '-\$35.23',
                        amountColor: Color(0xFFE44747),
                      ),
                      const Divider(height: 1, color: Color(0xFFE0E0E0)),
                      const _TransactionTile(
                        iconBg: Color(0xFFD9CFF0),
                        iconText: '↥',
                        title: 'Top up',
                        subtitle: 'Yesterday 02:12',
                        amount: '+\$430.00',
                        amountColor: Color(0xFF20A954),
                      ),
                      const Divider(height: 1, color: Color(0xFFE0E0E0)),
                      const _TransactionTile(
                        iconBg: Color(0xFF000000),
                        iconText: 'N',
                        title: 'Netflix',
                        subtitle: 'Dec 24 13:53',
                        amount: '-\$13.00',
                        amountColor: Color(0xFFE44747),
                      ),
                      const Divider(height: 1, color: Color(0xFFE0E0E0)),

                      const _TransactionTile(
                        iconBg: Color(0xFFD9CFF0),
                        iconText: '↥',
                        title: 'Top up',
                        subtitle: 'Yesterday 02:12',
                        amount: '+\$430.00',
                        amountColor: Color(0xFF20A954),
                      ),
                      const Divider(height: 1, color: Color(0xFFE0E0E0)),

                      const _TransactionTile(
                        iconBg: Color(0xFF1976D2),
                        iconText: '✳',
                        title: 'Walmart',
                        subtitle: 'Today 12:32',
                        amount: '-\$35.23',
                        amountColor: Color(0xFFE44747),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18 / 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _QuickActionDivider extends StatelessWidget {
  const _QuickActionDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 36 / 2, color: const Color(0xFF7A64D8));
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
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              emoji,
              style: const TextStyle(
                fontSize: 31 / 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 25 / 2, color: Color(0xFF292C30)),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.iconBg,
    required this.iconText,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
  });

  final Color iconBg;
  final String iconText;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              iconText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 25 / 1.4,
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
                    color: Color(0xFF202226),
                    fontSize: 20 / 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8A8E97),
                    fontSize: 20 / 1.4,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 20 / 1.4,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.chevron_right, size: 30, color: Color(0xFFA5A9B0)),
        ],
      ),
    );
  }
}
