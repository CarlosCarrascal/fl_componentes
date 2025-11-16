import 'package:flutter/material.dart';
import '../../themes/profile_colors.dart';
import '../../themes/theme_helper.dart';

class TabSelector extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;
  final bool isDarkMode;

  const TabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final t = T(isDarkMode);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: t.s,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: t.b),
        ),
        child: Row(
          children: [
            _tab('Watch History', Icons.history_rounded, 0, t),
            _tab('Downloaded', Icons.download_rounded, 1, t),
          ],
        ),
      ),
    );
  }

  Widget _tab(String lbl, IconData ic, int idx, T t) {
    final sel = selectedTab == idx;
    final col = sel ? Colors.white : t.t2;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(idx),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: sel ? C.a : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(ic, size: 18, color: col),
              const SizedBox(width: 6),
              Text(
                lbl,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: sel ? FontWeight.w600 : FontWeight.w500,
                  color: col,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
