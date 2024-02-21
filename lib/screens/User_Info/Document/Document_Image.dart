import 'package:flutter/material.dart';

class Document_Image extends StatelessWidget {
  final String imageUrl;
  //  final String documentName;

  const Document_Image({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
