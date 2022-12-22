import 'package:besic/constant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:besic/Screens/SearchWallpaper.dart';

Widget CategoriesWidget(String? url, String? title) {
  return InkWell(
    onTap: () => {Get.snackbar("", "message")},
    child: InkWell(
      onTap: () => {
        Get.to(WallPaperSearchScreen(search: "${title}", dropdownvalue: 50)),
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: ConstantColors.white2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              // used the CachedNetworkImage used for best results
              child: CachedNetworkImage(
                imageUrl: "${url}",
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "${title}",
                style: TextStyle(
                    fontSize: 20,
                    color: ConstantColors.white,
                    fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
