import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_rotes.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F7),
      body: SafeArea(
        child: Column(
          children: [
            const _HistoryHeader(),
            const Expanded(child: _HistoryContent()),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 1,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: const Color(0xFF6B46F2),
      //   unselectedItemColor: const Color(0xFF66707D),
      //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      //   onTap: (index) {
      //     if (index == 0) {
      //       Get.offNamed(AppRoutes.dashboardView);
      //       return;
      //     }
      //     if (index == 1) return;
      //     Get.snackbar(
      //       'Coming soon',
      //       index == 2
      //           ? 'Cards screen not added yet.'
      //           : 'More screen not added yet.',
      //       snackPosition: SnackPosition.BOTTOM,
      //       margin: const EdgeInsets.all(16),
      //     );
      //   },
      //
      // ),
    );
  }
}

class _HistoryHeader extends StatelessWidget {
  const _HistoryHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'History',
            style: TextStyle(
              color: Color(0xFF1E2229),
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFC),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xFFD3D9E3)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, size: 20, color: Color(0xFF1F2228)),
                      SizedBox(width: 8),
                      Text(
                        'Value goes here',
                        style: TextStyle(
                          color: Color(0xFFB4BCC8),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 40,
                width: 102,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFC),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFD3D9E3)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.tune, color: Color(0xFF1F2228), size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: Color(0xFF1F2228),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HistoryContent extends StatelessWidget {
  const _HistoryContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        _HistorySection(
          title: 'Today',
          rows: [
            _HistoryRowData(
              icon: _BrandIcon.walmart,
              title: 'Walmart',
              subtitle: 'Today 12:32',
              amount: '-\$35.23',
              amountColor: Color(0xFFD64545),
            ),
            _HistoryRowData(
              icon: _BrandIcon.topUp,
              title: 'Top up',
              subtitle: 'Yesterday 02:12',
              amount: '+\$430.00',
              amountColor: Color(0xFF25A25B),
            ),
            _HistoryRowData(
              icon: _BrandIcon.netflix,
              title: 'Netflix',
              subtitle: 'Dec 24 12:32',
              amount: '-\$13.00',
              amountColor: Color(0xFFD64545),
            ),
          ],
        ),
        _BlockDivider(),
        _HistorySection(
          title: 'Yesterday',
          rows: [
            _HistoryRowData(
              icon: _BrandIcon.amazon,
              title: 'Amazon',
              subtitle: 'Today 12:32',
              amount: '-\$12.23',
              amountColor: Color(0xFFD64545),
            ),
            _HistoryRowData(
              icon: _BrandIcon.nike,
              title: 'Nike',
              subtitle: 'Yesterday 02:12',
              amount: '-\$50.23',
              amountColor: Color(0xFFD64545),
            ),
            _HistoryRowData(
              icon: _BrandIcon.homeDepot,
              title: 'The Home Depot',
              subtitle: 'Dec 24 13:53',
              amount: '-\$129.00',
              amountColor: Color(0xFFD64545),
            ),
          ],
        ),
        _BlockDivider(),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: Text(
            'Thursday',
            style: TextStyle(
              color: Color(0xFF737E8D),
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Text(
            'December 29, 2022',
            style: TextStyle(
              color: Color(0xFF4E5A69),
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _HistorySection(
          compactTop: true,
          rows: [
            _HistoryRowData(
              icon: _BrandIcon.amazon,
              title: 'Amazon',
              subtitle: 'Today 12:32',
              amount: '-\$35.23',
              amountColor: Color(0xFFD64545),
            ),
          ],
        ),
      ],
    );
  }
}

class _HistorySection extends StatelessWidget {
  const _HistorySection({
    this.title,
    required this.rows,
    this.compactTop = false,
  });

  final String? title;
  final List<_HistoryRowData> rows;
  final bool compactTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, compactTop ? 0 : 8, 12, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: const TextStyle(
                color: Color(0xFF4F5866),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
          ],
          for (final row in rows) _HistoryRow(data: row),
        ],
      ),
    );
  }
}

class _HistoryRowData {
  const _HistoryRowData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
  });

  final _BrandIcon icon;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.data});

  final _HistoryRowData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showTransactionBottomSheet(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFDDE2E9))),
        ),
        child: Row(
          children: [
            _BrandAvatar(icon: data.icon),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      color: Color(0xFF1E2228),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    data.subtitle,
                    style: const TextStyle(
                      color: Color(0xFF75808F),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              data.amount,
              style: TextStyle(
                color: data.amountColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 2),
            const Icon(Icons.chevron_right, size: 17, color: Color(0xFF687483)),
          ],
        ),
      ),
    );
  }

  Future<void> _showTransactionBottomSheet(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black45,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _BrandAvatar(icon: data.icon),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: const TextStyle(
                              color: Color(0xFF1F2630),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Retailer corporation',
                            style: TextStyle(
                              color: Color(0xFF798491),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(sheetContext).pop(),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: Color(0xFF1D63D6),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    data.amount,
                    style: const TextStyle(
                      color: Color(0xFFC13A3A),
                      fontSize: 40 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _detailCard(title: 'Today', value: 'December 29, 2022 - 12:32'),
                const SizedBox(height: 10),
                _detailCard(
                  title: 'Transaction no.',
                  value: '23010412432431',
                  trailing: const Icon(
                    Icons.copy_outlined,
                    color: Color(0xFF6C7785),
                    size: 22,
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.flag_outlined,
                        color: Color(0xFFC33F3F),
                        size: 20,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'Report a problem',
                        style: TextStyle(
                          color: Color(0xFFC33F3F),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _detailCard({
    required String title,
    required String value,
    Widget? trailing,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFE),
        border: Border.all(color: const Color(0xFFE2E7EE)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF7A8693),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF4D5967),
                    fontSize: 16 / 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}

enum _BrandIcon { walmart, topUp, netflix, amazon, nike, homeDepot }

class _BrandAvatar extends StatelessWidget {
  const _BrandAvatar({required this.icon});

  final _BrandIcon icon;

  @override
  Widget build(BuildContext context) {
    switch (icon) {
      case _BrandIcon.walmart:
        return _iconBox(
          color: const Color(0xFF2A7CDA),
          child: const Text(
            '✶',
            style: TextStyle(
              color: Color(0xFFFFC227),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      case _BrandIcon.topUp:
        return _iconBox(
          color: const Color(0xFFE8DDFB),
          child: const Icon(
            Icons.arrow_upward,
            size: 19,
            color: Color(0xFF1E2228),
          ),
        );
      case _BrandIcon.netflix:
        return _iconBox(
          color: Colors.black,
          child: const Text(
            'N',
            style: TextStyle(
              color: Color(0xFFE6242D),
              fontSize: 29,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      case _BrandIcon.amazon:
        return _iconBox(
          color: const Color(0xFFFB6A2B),
          child: const Text(
            'a',
            style: TextStyle(
              color: Colors.white,
              fontSize: 31,
              fontWeight: FontWeight.w700,
              height: 0.8,
            ),
          ),
        );
      case _BrandIcon.nike:
        return _iconBox(
          color: Colors.black,
          child: const Text(
            '✓',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      case _BrandIcon.homeDepot:
        return _iconBox(
          color: const Color(0xFFFC7C2D),
          child: const Text(
            'HD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
    }
  }

  Widget _iconBox({required Color color, required Widget child}) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class _BlockDivider extends StatelessWidget {
  const _BlockDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 4, thickness: 4, color: Color(0xFFE0E4EA));
  }
}
