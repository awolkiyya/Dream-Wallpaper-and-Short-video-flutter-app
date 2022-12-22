import 'package:flutter/material.dart';

class FavoritePhotos extends StatefulWidget {
  const FavoritePhotos({super.key});

  @override
  State<FavoritePhotos> createState() => _FavoritePhotosState();
}

class _FavoritePhotosState extends State<FavoritePhotos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.amber,
    );
  }
}
