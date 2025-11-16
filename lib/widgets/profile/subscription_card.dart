import 'package:flutter/material.dart';
import '../../themes/profile_colors.dart';
import '../../themes/theme_helper.dart';

class SubscriptionCard extends StatelessWidget {
  final bool isDarkMode;
  const SubscriptionCard({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final t = T(isDarkMode);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: t.box(),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: t.pb,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.workspace_premium_rounded,
              size: 32,
              color: C.pg,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '1 year of unlimited moviez',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: t.t1,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),
          _s(Icons.check_circle_rounded, C.s, 'USD 50.00 / 1 year'),
          const SizedBox(height: 8),
          _s(Icons.schedule_rounded, C.e, 'Expired on 05/08/2025'),
        ],
      ),
    );
  }

  Widget _s(IconData ic, Color col, String txt) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(ic, color: col, size: 18),
      const SizedBox(width: 6),
      Text(
        txt,
        style: TextStyle(
          fontSize: txt.contains('USD') ? 15 : 14,
          fontWeight: FontWeight.w600,
          color: col,
        ),
      ),
    ],
  );
}
