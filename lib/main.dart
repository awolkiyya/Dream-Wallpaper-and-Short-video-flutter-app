import 'package:besic/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:animated_splash_screen/animated_splash_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "practice one",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
