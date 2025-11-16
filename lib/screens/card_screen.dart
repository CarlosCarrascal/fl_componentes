import 'package:fl_componentes/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Widget',
        style: TextStyle(
          color: AppTheme.textosBlancos
        ),
        ),
      ),
      body: ListView(
         children: [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(),
          SizedBox(height: 10),
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType3(imageUrl: 'assets/the-strokes.jpg', titulo: 'Imagen desde assets'),
         ],
      ),
    );
  }
}



