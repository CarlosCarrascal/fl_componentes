import 'package:fl_componentes/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Componentes en Flutter',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(menuOptions[index].icon, color: Colors.indigo),
            title: Text(menuOptions[index].name),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.indigo),
            onTap: () {
              Navigator.pushNamed(context, menuOptions[index].route);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(), 
        itemCount: menuOptions.length,
      ),
    );
  }
}
