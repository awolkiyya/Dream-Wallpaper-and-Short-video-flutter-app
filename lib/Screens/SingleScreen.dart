// views/image_view
import 'package:besic/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:get/get.dart";
// import 'wallpaper_manager.dart';
// import 'package:wallpaperapps/views/wallpaper_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDisplay extends StatefulWidget {
  // pass image url
  final String url;
  ImageDisplay({required this.url});

  @override
  _ImageDisplayState createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.url,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: ConstantColors.white2,
                    alignment: Alignment.center,
                    child: const Image(
                      image: AssetImage(
                          "assets/ImpracticalNextFossa-size_restricted.gif"),
                      width: 30,
                    ),
                  );
                },
              ),
            ),
          ),

          // set wallpaper button
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {},
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff1C1B1B).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(30)),
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Color(0x36FFFFFF),
                              Color(0x0FFFFFFF)
                            ])),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Set As Wallpaper",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white70),
                            ),
                            Text(
                              "Image Will be Save at Galery",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                // cancel vutton handler
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
