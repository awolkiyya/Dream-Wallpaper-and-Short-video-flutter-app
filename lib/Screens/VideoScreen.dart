import 'dart:convert';

import 'package:besic/Controllers/Controllersone.dart';
import 'package:besic/Models/videoListModel.dart';
import 'package:besic/Screens/Components/VideoCollectionWidget.dart';
import 'package:besic/Screens/SarchVideo.dart';
import 'package:besic/constant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoScreen extends StatefulWidget {
  final int dropdownvalue;
  const VideoScreen({super.key, required this.dropdownvalue});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  TextEditingController search = new TextEditingController();
  List<VideoListModel> videoList = [];
  Controllerone one = Get.put(Controllerone());
  String present = "https://api.pexels.com/videos/popular?per_page=80";
  List imageUrl = [];
  bool _isdatafetched = false;
  @override
  void initState() {
    print(widget.dropdownvalue);
    getVideoData(present);
    // TODO: implement initState
    super.initState();
  }

  getVideoData(String present) async {
    var url = Uri.parse(present);
    var response = await http.get(url, headers: {
      "Authorization": one.ApiKey.value,
    });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["videos"].forEach((singlevideos) {
      VideoListModel videoListModel = new VideoListModel();
      videoListModel = VideoListModel.fromMap(singlevideos);
      videoList.add(videoListModel);
    });
    print("all data stored${videoList}");
    setState(() {
      _isdatafetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(horizontal: 25),
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: BoxDecoration(
            color: ConstantColors.white2,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "search Videos",
                  ),
                ),
              ),
              IconButton(
                onPressed: () => {
                  Get.to(SerachVideoScreen(
                      serachResult: search.text,
                      dropdownvalue: widget.dropdownvalue))
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: ConstantColors.gold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text.rich(TextSpan(
                  text: "Best",
                  style: TextStyle(color: Color.fromARGB(255, 151, 147, 147)),
                  children: [
                    TextSpan(
                        text: "  Videos Collaction ",
                        style: TextStyle(
                            color: ConstantColors.gold,
                            fontWeight: FontWeight.w800))
                  ]))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // videoCollectionWidget(collectionVideo: videoList, context: context),
        _isdatafetched
            ? videoCollectionWidget(
                collectionVideo: videoList, context: context)
            : Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          "assets/ImpracticalNextFossa-size_restricted.gif"),
                    ]),
              ),
        SizedBox(
          height: 10,
        ),
        // Column(
        //   children: videoList.map((e) => {}),
        // ),

        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 20),
        //   width: 800,
        //   height: 200,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: NetworkImage(
        //             "https://images.pexels.com/videos/1526909/free-video-1526909.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200"),
        //         fit: BoxFit.cover),
        //     color: ConstantColors.white2,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Stack(
        //         children: [
        //           Positioned(
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(30),
        //                   ),
        //                   child: IconButton(
        //                     color: ConstantColors.black,
        //                     onPressed: () => {},
        //                     icon: Icon(
        //                       Icons.play_arrow,
        //                       size: 50,
        //                       color: ConstantColors.gold,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 20),
        //   width: 800,
        //   height: 200,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: NetworkImage(
        //             "https://images.pexels.com/videos/1526909/free-video-1526909.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200"),
        //         fit: BoxFit.cover),
        //     color: ConstantColors.white2,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Stack(
        //         children: [
        //           Positioned(
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(30),
        //                   ),
        //                   child: IconButton(
        //                     color: ConstantColors.black,
        //                     onPressed: () => {},
        //                     icon: Icon(
        //                       Icons.play_arrow,
        //                       size: 50,
        //                       color: Colors.red,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 20),
        //   width: 800,
        //   height: 200,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: NetworkImage(
        //             "https://images.pexels.com/videos/1526909/free-video-1526909.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200"),
        //         fit: BoxFit.cover),
        //     color: ConstantColors.white2,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Stack(
        //         children: [
        //           Positioned(
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(30),
        //                   ),
        //                   child: IconButton(
        //                     color: ConstantColors.black,
        //                     onPressed: () => {},
        //                     icon: Icon(
        //                       Icons.play_arrow,
        //                       size: 50,
        //                       color: Colors.red,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),

        // Container(
        //   width: 200,
        //   height: 300,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: NetworkImage(
        //             "https://images.pexels.com/videos/1526909/free-video-1526909.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200"),
        //         fit: BoxFit.cover),
        //     color: ConstantColors.white2,
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   child: Container(
        //     width: 50,
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        //     child: IconButton(
        //       padding: EdgeInsets.all(40),
        //       color: ConstantColors.black,
        //       onPressed: () => {},
        //       icon: Icon(
        //         Icons.play_arrow,
        //         size: 50,
        //         color: Colors.red,
        //       ),
        //     ),
        //   ),
      ]),
    );
  }
}
