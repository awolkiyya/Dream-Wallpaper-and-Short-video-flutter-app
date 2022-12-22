import 'dart:convert';

import 'package:besic/Controllers/Controllersone.dart';
import 'package:besic/Models/wallpaperModel.dart';
import 'package:besic/Screens/Components/appBarWidget.dart';
import 'package:besic/Screens/Components/wallpaperWidgets.dart';
import 'package:besic/constant.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:http/http.dart' as http;

class WallPaperSearchScreen extends StatefulWidget {
  String search;
  int dropdownvalue;
  WallPaperSearchScreen(
      {super.key, required this.search, required this.dropdownvalue});

  @override
  State<WallPaperSearchScreen> createState() => _WallPaperSearchScreenState();
}

class _WallPaperSearchScreenState extends State<WallPaperSearchScreen> {
  List<WallPaperModel> wallpapers = [];
  String present = "";
  String next = "";
  Controllerone one = Get.put(Controllerone());
  bool _isdatafetched = false;
  @override
  void initState() {
    present =
        "https://api.pexels.com/v1/search?query=${widget.search}&per_page=${widget.dropdownvalue}";
    getWallpeper(present);
    // TODO: implement initState
    super.initState();
  }

  getWallpeper(String present) async {
    var url = Uri.parse(present);
    var response = await http.get(url, headers: {
      "Authorization": one.ApiKey.value,
    });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((singlephoto) {
      WallPaperModel wallpaperModel = new WallPaperModel();
      wallpaperModel = WallPaperModel.fromMap(singlephoto);
      wallpapers.add(wallpaperModel);
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ConstantColors.black,
            size: 30,
          ),
          onPressed: () => {
            Get.back(),
          },
        ),
        backgroundColor: ConstantColors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "${widget.search} Search Results",
          style: TextStyle(color: ConstantColors.gold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _isdatafetched
                  ? wallPapersWidget(listOfPhotos: wallpapers, context: context)
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: Image.asset(
                            "assets/ImpracticalNextFossa-size_restricted.gif"),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: next != ""
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () async => {
                              await getWallpeper(next),
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 10,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
