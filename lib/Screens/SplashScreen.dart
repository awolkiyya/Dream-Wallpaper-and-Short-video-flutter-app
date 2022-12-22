import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:besic/Screens/HomeScreen.dart';
import 'package:besic/constant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: ConstantColors.white,
      splashIconSize: MediaQuery.of(context).size.height,
      duration: 5600,
      splash: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ConstantColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Wall",
                    style: TextStyle(
                        fontSize: 20,
                        color: ConstantColors.blue,
                        fontWeight: FontWeight.w900),
                  ),
                  TextSpan(
                    text: "Paper",
                    style: TextStyle(
                        color: ConstantColors.gold,
                        fontWeight: FontWeight.w800),
                  )
                ],
                text: "Dream ",
                style: TextStyle(
                    color: ConstantColors.black, fontWeight: FontWeight.w500),
              ),
            ),
            Image.asset(
              "assets/125039-download-wallpaper.gif",
              width: 250,
            ),
            Column(
              children: [
                Text.rich(
                  TextSpan(
                      children: [],
                      text: "Welcome To Dream Wallpaper Mobile App"),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: " Dream Vally",
                          style: TextStyle(
                              fontSize: 18,
                              color: ConstantColors.blue,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                        text: " Team 2022",
                        style: TextStyle(
                            color: ConstantColors.gold,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                    text: "Designed By:",
                    style: TextStyle(
                        fontSize: 12,
                        color: ConstantColors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      nextScreen: HomeScreen(),
    );
  }
}
