import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullscreenPhotoPage extends StatelessWidget {
  final String imageUrl;

  // Constructor to accept the image URL
  FullscreenPhotoPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:
      // Center(
      //   child: InteractiveViewer(
      //     minScale: 0.5, // Minimum zoom-out scale
      //     maxScale: 4.0, // Maximum zoom-in scale
      //     boundaryMargin: EdgeInsets.all(20), // Allow movement beyond the image boundary
      //     panEnabled: true, // Enable panning
      //     scaleEnabled: true, // Enable scaling/zooming
      //     child: Image.network(imageUrl),
      //   ),
      // )
      Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl), // Use imageUrl here
        ),
      ),
    );
  }
}