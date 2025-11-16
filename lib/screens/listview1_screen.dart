import 'package:flutter/material.dart';
import 'package:fl_componentes/themes/app_theme.dart'; // Agrega esta línea

class Listview extends StatelessWidget {
  final opciones = const ['Korn', 'Slipknot', 'Limp Bizkit', 'System of a Down'];
   
  const Listview({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listview',
          style: TextStyle(color: AppTheme.textosBlancos)
        )
      ),
      body: ListView(
        children: [
          ...opciones.map(
            (v) => ListTile(
              leading: Icon(Icons.check),
              title: Text(v),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            )
          )
        ],
      ),
    );
  }
}
