import 'package:besic/Models/videoListModel.dart';
import 'package:besic/Screens/VideoPlayerScreen.dart';
import 'package:besic/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget videoCollectionWidget(
    {required List<VideoListModel> collectionVideo, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      children: collectionVideo.map((wallpaper) {
        return GridTile(
          child: InkWell(
            onTap: () => {
              Get.to(SingleVideoPlayerScreen(
                url: wallpaper.video!.hdvideoModel!.hdurl,
                duration: wallpaper.duration,
                username: wallpaper.user!.username,
              ))
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(179, 243, 241, 241),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.network(
                        "${wallpaper.imageUrl}",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
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
                      Positioned(
                        top: MediaQuery.of(context).size.height / 6,
                        left: MediaQuery.of(context).size.width / 6,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: ConstantColors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(children: [
                            IconButton(
                                onPressed: () => {
                                      Get.to(SingleVideoPlayerScreen(
                                        url: wallpaper
                                            .video!.hdvideoModel!.hdurl,
                                        duration: wallpaper.duration,
                                        username: wallpaper.user!.username,
                                      ))
                                    },
                                icon: Icon(
                                  Icons.play_arrow_rounded,
                                  color: ConstantColors.gold,
                                  size: 30,
                                )),
                          ]),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
