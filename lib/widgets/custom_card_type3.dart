import 'package:flutter/material.dart';

class CustomCardType3 extends StatelessWidget {
  // Variables
  final String imageUrl;
  final String? titulo; 
  final String defaultTitulo;

  const CustomCardType3({
    super.key, 
    required this.imageUrl,
    this.titulo, // Opcional
    this.defaultTitulo = 'Sin dato',
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
          FadeInImage(
            fadeInDuration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/banana-loading.gif'),
            image: AssetImage(imageUrl),
            // Manejo de errores de imagen
            imageErrorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey[300],
                child: const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                ),
              );
            },
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
            child: Text(titulo ?? defaultTitulo),
          )
        ],
      ),
    );
  }
}
