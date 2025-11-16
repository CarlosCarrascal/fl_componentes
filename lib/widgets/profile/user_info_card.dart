import 'package:flutter/material.dart';
import '../../themes/profile_colors.dart';

class UserInfoCard extends StatelessWidget {
  final bool isDarkMode;
  const UserInfoCard({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: isDarkMode ? [C.dg1, C.dg2] : [C.lg1, C.lg2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: isDarkMode ? 0.4 : 0.12),
          blurRadius: isDarkMode ? 20 : 16,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/images/avatars/profile.jpg',
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Pun pun Onodera',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        _i(Icons.phone_rounded, '421345321'),
        const SizedBox(height: 6),
        _i(Icons.email_rounded, 'punpun@gmail.com'),
      ],
    ),
  );

  Widget _i(IconData ic, String txt) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(ic, size: 16, color: Colors.white.withValues(alpha: 0.85)),
      const SizedBox(width: 6),
      Text(
        txt,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white.withValues(alpha: 0.85),
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
