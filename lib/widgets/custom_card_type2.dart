import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      

      elevation: 10,
      child: Column(
        children: [
          // Image(
          //   image: NetworkImage('https://picsum.photos/400/200')
          //   ),
          FadeInImage(
            fadeInDuration: Duration(milliseconds: 300),
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/banana-loading.gif'), 
            image: AssetImage('assets/the-strokes.jpg')
            ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: EdgeInsets.only(right: 20, top: 20, bottom: 20),
            child: Text('No tengo idea de que poner' ),
          )
        ],
      ),
    );
  }
}