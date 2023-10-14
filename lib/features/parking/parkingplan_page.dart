import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ParkingPlan extends StatelessWidget {
  final String imageUrl;

  const ParkingPlan({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoView(
          backgroundDecoration: const BoxDecoration(color: Colors.white),
          imageProvider: const NetworkImage(
              'http://mieszkaniajaworze.pl/images/2022/05/04/pzt.jpg'),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
        ),
      ),
    );
  }
}
