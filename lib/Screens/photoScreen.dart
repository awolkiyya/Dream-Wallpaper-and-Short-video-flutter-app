import 'dart:convert';

import 'package:besic/Controllers/Controllersone.dart';
import 'package:besic/Models/wallPaperCollectionModel.dart';
import 'package:besic/Models/wallpaperModel.dart';
import 'package:besic/Screens/Components/categoresWidget.dart';
import 'package:besic/Screens/Components/wallpaperWidgets.dart';
import 'package:besic/Screens/SearchWallpaper.dart';
import 'package:besic/constant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class PhothoScreen extends StatefulWidget {
  final int dropdownvalue;
  const PhothoScreen({super.key, required this.dropdownvalue});

  @override
  State<PhothoScreen> createState() => _PhothoScreenState();
}

class _PhothoScreenState extends State<PhothoScreen> {
  // now dependency injection
  List<WallPaperCollectionModel> wallpapers = [];
  List<WallPaperModel> listOfPhoto = [];
  Controllerone one = Get.put(Controllerone());
  bool _isdatafetched = false;
  var url;
  String present = "https://api.pexels.com/v1/curated?per_page=50";
  String next = "";
  TextEditingController search = new TextEditingController();
  @override
  void initState() {
    getWallPaperCollections();
    getWallpeper(present);
    // TODO: implement initState
    super.initState();
  }

  getWallPaperCollections() {
    wallpapers = one.getCollection();
  }

  getWallpeper(String present) async {
    url = Uri.parse(present);
    var response = await http.get(url, headers: {
      "Authorization": one.ApiKey.value,
    });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((singlephoto) {
      WallPaperModel wallpaperModel = new WallPaperModel();
      wallpaperModel = WallPaperModel.fromMap(singlephoto);
      listOfPhoto.add(wallpaperModel);
      setState(() {
        next = jsonData['next_page'];
      });
      setState(() {
        _isdatafetched = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          // Advertized
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              color: ConstantColors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  width: 500,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE-NWpLkMwiaXpJFzTgPKTkfTV4n-1RvQmtw&usqp=CAU"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.dribbble.com/users/607129/screenshots/10374763/media/e09480e6f275245a0518396659ff4c1e.png?compress=1&resize=400x300"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQprJ3lBq8vanjsY0o5oHta9mwF0MvgKR36DCyxk-SpFhsB-TgIRX8g5QKpXatLJ5LuBnQ&usqp=CAU"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://www.graphicmania.net/wp-content/uploads/img01/2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
          SizedBox(
            height: 15,
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
                      hintText: "search wallpaper",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => {
                    Get.to(WallPaperSearchScreen(
                        search: search.text,
                        dropdownvalue: widget.dropdownvalue)),
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
                          text: "  Photos Collaction ",
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: ConstantColors.white,
            child: ListView.builder(
              itemCount: wallpapers.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return CategoriesWidget(
                    wallpapers[index].url, wallpapers[index].title);
              }),
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
                    text: "Popular",
                    style: TextStyle(color: Color.fromARGB(255, 151, 147, 147)),
                    children: [
                      TextSpan(
                          text: "  Photos",
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
          _isdatafetched
              ? wallPapersWidget(listOfPhotos: listOfPhoto, context: context)
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
    );
  }
}
