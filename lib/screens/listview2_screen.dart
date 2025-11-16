import 'package:flutter/material.dart';

class Listview2 extends StatelessWidget {
  final opciones = const [
    'Korn',
    'Slipknot',
    'Limp Bizkit',
    'System of a Down',
    'Mudvayne',
    'Deftones'
  ];

  const Listview2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview2'),
        backgroundColor: Colors.amber,
        ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.check),
          title: Text(opciones[index]),
          trailing: Icon(Icons.arrow_forward_ios_outlined, color: Color.fromARGB(100, 218, 140, 6)),
          onTap: () {
            final opt = opciones[index];
            print(opt);
          },
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: opciones.length,
      ),
    );
  }
}
