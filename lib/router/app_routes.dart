import 'package:fl_componentes/models/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:fl_componentes/screens/screens.dart';

class AppRoutes {
  static const String initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'home',
      icon: Icons.home,
      name: 'Pagina principal',
      screen: const HomeScreen(),
    ),
    MenuOption(
      route: 'listview1',
      icon: Icons.list,
      name: 'Pagina lista tipo 1',
      screen: const Listview(),
    ),
    MenuOption(
      route: 'listview2',
      icon: Icons.list_alt,
      name: 'Pagina lista tipo 2',
      screen: const Listview2(),
    ),
    MenuOption(
      route: 'card',
      icon: Icons.credit_card,
      name: 'Pagina de tarjetas',
      screen: const CardScreen(),
    ),
    MenuOption(
      route: 'alert',
      icon: Icons.warning_amber_outlined,
      name: 'Pagina de Alerta',
      screen: const AlertScreen(),
    ),
    MenuOption(
      route: 'avatar',
      icon: Icons.verified_user_sharp,
      name: 'Pagina de usuario',
      screen: const AvatarScreen(),
    ),
    MenuOption(
      route: 'profile',
      icon: Icons.account_circle,
      name: 'Pagina de Perfil (UI)',
      screen: const ProfileScreen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> get getAppRoutes {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final opciones in menuOptions) {
      appRoutes.addAll({
        opciones.route: (BuildContext context) => opciones.screen,
      });
    }

    appRoutes.addAll({
      'editProfile': (BuildContext context) => const EditProfileScreen(),
    });

    return appRoutes;
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
