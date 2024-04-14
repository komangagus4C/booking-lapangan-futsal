import 'package:flutter/material.dart';

class AssetImageWidget extends StatelessWidget {
  final String imagePath;

  AssetImageWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 234,
        height: 132,
        fit: BoxFit.cover,
      // Anda dapat menambahkan properti lain untuk menyesuaikan tampilan gambar
      // contoh: width, height, fit, dll.
    );
  }
}
