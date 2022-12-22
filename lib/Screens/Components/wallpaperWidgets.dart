import 'package:besic/Models/wallpaperModel.dart';
import 'package:besic/Screens/SingleScreen.dart';
import 'package:besic/constant.dart';
import 'package:flutter/material.dart';
import "package:cached_network_image/cached_network_image.dart";
import 'package:get/get.dart';

Widget wallPapersWidget({required List<WallPaperModel> listOfPhotos, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 0.6,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      children: listOfPhotos.map((wallpaper) {
        return GridTile(
          child: InkWell(
            onTap: () => {Get.to(ImageDisplay(url: wallpaper.src!.portrait))},
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(179, 243, 241, 241),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "${wallpaper.src!.portrait}",
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
          ),
        );
      }).toList(),
    ),
  );
}
