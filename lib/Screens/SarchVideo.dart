import 'dart:convert';
import 'package:besic/Controllers/Controllersone.dart';
import 'package:besic/Models/videoListModel.dart';
import 'package:besic/Screens/Components/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:besic/constant.dart';
import "package:get/get.dart";
import 'package:http/http.dart' as http;

class SerachVideoScreen extends StatefulWidget {
  final String? serachResult;
  final int dropdownvalue;
  const SerachVideoScreen(
      {super.key, required this.serachResult, required this.dropdownvalue});

  @override
  State<SerachVideoScreen> createState() => _SerachVideoScreenState();
}

class _SerachVideoScreenState extends State<SerachVideoScreen> {
  List<VideoListModel> videoList = [];
  String present = "";
  String next = "";
  Controllerone one = Get.put(Controllerone());
  bool _isdatafetched = false;
  @override
  void initState() {
    present =
        "https://api.pexels.com/videos/search?query=${widget.serachResult}&per_page=${widget.dropdownvalue}";
    getVideoList(present);
    // TODO: implement initState
    super.initState();
  }

  getVideoList(String pr) async {
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
    setState(() {
      next = jsonData['next_page'];
    });
    setState(() {
      _isdatafetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoList.length,
        itemBuilder: ((context, index) {
          bool checking = false;
          final data = videoList[index];
          if (videoList.length == index + 1) {
            checking = true;
            print("i am here ${widget.serachResult}");
          }
          return Stack(
            children: [
              Container(
                // margin: EdgeInsets.only(top: 100),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/ImpracticalNextFossa-size_restricted.gif",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child:
                    VideoPlayerItem(videoUrl: data.video!.hdvideoModel!.hdurl),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height - 110,
                  child: Container(
                    // color: ConstantColors.gold,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 255, 255, 255)),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          checking
                              ? Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ConstantColors.gold,
                                  ),
                                  child: IconButton(
                                      onPressed: () => {
                                            Get.snackbar("Adding",
                                                "Some Videos are adding to your pages",
                                                backgroundColor:
                                                    ConstantColors.white2,
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                icon: Icon(Icons.add)),
                                            setState(
                                              () => {
                                                present = next,
                                              },
                                            )
                                          },
                                      icon: Icon(
                                        Icons.add,
                                        color: ConstantColors.white,
                                      )),
                                )
                              : Text(""),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Photographer:",
                              style: TextStyle(
                                  color: ConstantColors.black,
                                  fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(text: "${data.user!.username}"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text.rich(
                            TextSpan(
                              text: "Duration :",
                              style: TextStyle(color: ConstantColors.black),
                              children: [TextSpan(text: "${data.duration} s")],
                            ),
                          ),
                        ]),
                  ))
            ],
          );
        }),
      ),
    );
  }
}
