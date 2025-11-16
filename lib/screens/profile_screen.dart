import 'package:flutter/material.dart';
import '../widgets/profile/user_info_card.dart';
import '../widgets/profile/subscription_card.dart';
import '../widgets/profile/tab_selector.dart';
import '../widgets/profile/movie_list_item.dart';
import '../themes/profile_colors.dart';
import '../themes/theme_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _sel = 0;
  bool _d = false;

  static const _watchHistory = [
    {
      't': 'AVATAR: THE WAY OF WATER',
      'd': 'Sci-fi epic sequel - 2022',
      'img': 'assets/images/movies/movie1.jpeg',
    },
    {
      't': 'TAXI DRIVER',
      'd': 'Classic psychological thriller',
      'img': 'assets/images/movies/movie2.webp',
    },
    {
      't': 'KILL BILL: VOL. 1',
      'd': 'Action-packed revenge saga',
      'img': 'assets/images/movies/movie3.webp',
    },
    {
      't': 'TITANIC',
      'd': 'Romantic disaster film',
      'img': 'assets/images/movies/movie4.webp',
    },
  ];

  static const _downloaded = [
    {
      't': 'AVATAR: THE WAY OF WATER',
      'd': 'Downloaded - 4K Ultra HD',
      'img': 'assets/images/movies/movie1.jpeg',
    },
    {
      't': 'KILL BILL: VOL. 1',
      'd': 'Downloaded - 1080p HD',
      'img': 'assets/images/movies/movie3.webp',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final t = T(_d);

    final currentMovies = _sel == 0 ? _watchHistory : _downloaded;

    return Scaffold(
      backgroundColor: t.bg,
      appBar: AppBar(
        title: Text(
          'Mi Perfil',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: t.t1,
          ),
        ),
        centerTitle: true,
        backgroundColor: t.bg,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                Icon(
                  _d ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                  color: t.t1,
                  size: 20,
                ),
                Switch(
                  value: _d,
                  onChanged: (v) => setState(() => _d = v),
                  activeTrackColor: C.a,
                  activeThumbColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: t.b,
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          const SizedBox(height: 8),
          UserInfoCard(isDarkMode: _d),
          const SizedBox(height: 16),
          SubscriptionCard(isDarkMode: _d),
          const SizedBox(height: 20),
          TabSelector(
            selectedTab: _sel,
            onTabChanged: (i) => setState(() => _sel = i),
            isDarkMode: _d,
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: currentMovies.isEmpty
                  ? [_emptyState(t)]
                  : currentMovies
                      .map(
                        (x) => MovieListItem(
                          title: x['t']!,
                          description: x['d']!,
                          imageUrl: x['img'],
                          isDarkMode: _d,
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'editProfile'),
        backgroundColor: C.a,
        tooltip: 'Editar perfil',
        child: const Icon(Icons.edit_rounded, color: Colors.white),
      ),
    );
  }

  Widget _emptyState(T t) => Center(
    child: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            _sel == 0 ? Icons.history_rounded : Icons.download_rounded,
            size: 64,
            color: t.t2.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            _sel == 0 ? 'No hay historial' : 'No hay descargas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: t.t1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _sel == 0
                ? 'Las películas que veas aparecerán aquí'
                : 'Descarga películas para verlas sin conexión',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: t.t2),
          ),
        ],
      ),
    ),
  );
}
