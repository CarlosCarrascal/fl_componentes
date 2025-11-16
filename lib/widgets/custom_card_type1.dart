import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Hola soy un título'),
            subtitle: Text('Este es una descripción del título'),	
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed:(){},  
                child: Text('Cancelar')
                ),
                TextButton(onPressed:(){},  
                child: Text('Ok')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}