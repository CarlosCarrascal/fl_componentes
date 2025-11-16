import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carlos Carrascal'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.amberAccent,
              child: Text('CC', style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
      body: Center(
        child: CircleAvatar(
          maxRadius: 150,
          backgroundImage: NetworkImage('https://tse4.mm.bing.net/th/id/OIP.4AH3KxYYcH_uHIWfszznQgHaHa?cb=ucfimgc2&rs=1&pid=ImgDetMain&o=7&rm=3'),
        ),
      ),
    );
  }
}