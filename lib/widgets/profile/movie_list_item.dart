import 'package:flutter/material.dart';
import '../../themes/profile_colors.dart';
import '../../themes/theme_helper.dart';

class MovieListItem extends StatelessWidget {
  final String title;
  final String description;
  final String? imageUrl; 
  final bool isDarkMode;

  const MovieListItem({
    super.key,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final t = T(isDarkMode);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: t.box(r: 14, i: true),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageUrl != null
                  ? Image.asset(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: t.s,
                        child: Icon(
                          Icons.movie_rounded,
                          color: isDarkMode
                              ? Colors.white.withValues(alpha: 0.3)
                              : Colors.black.withValues(alpha: 0.3),
                          size: 28,
                        ),
                      ),
                    )
                  : Container(
                      color: t.s,
                      child: Icon(
                        Icons.movie_rounded,
                        color: isDarkMode
                            ? Colors.white.withValues(alpha: 0.3)
                            : Colors.black.withValues(alpha: 0.3),
                        size: 28,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: t.t1,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: t.t2,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: C.a,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: C.a.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}