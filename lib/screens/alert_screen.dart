import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertScreen extends StatelessWidget {
  
  const AlertScreen({super.key});

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        title: Text('Alerta de Proceso'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Esto es el contenido de mi alerta')
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar', style: TextStyle(fontSize: 17),)
          )
        ],
      ),
    );
  }

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Alerta de Proceso'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Esto es el contenido de mi alerta'),
            SizedBox(height: 15,),
            FlutterLogo(size: 80,),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar')
          )
        ],
      ),
    );
  }

  void displayDialog(BuildContext context) {
    if (Platform.isIOS) {
      displayDialogIOS(context);
    } else {
      displayDialogAndroid(context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => displayDialog(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text('PROCESAR', style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.cloud, color: Colors.white),
      ),
    );
  }
}
