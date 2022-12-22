import 'package:besic/Controllers/Controllersone.dart';
import 'package:besic/Screens/Components/appBarWidget.dart';
import 'package:besic/Screens/Components/progressBarWidget.dart';
import 'package:besic/Screens/VideoScreen.dart';
import 'package:besic/Screens/photoScreen.dart';
import 'package:besic/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initial Selected Value
  int dropdownvalue = 50;

  // List of items in our dropdown menu
  var items = [
    1,
    10,
    50,
    80,
  ];
  int index = 0;
  // now here add the dependancy injection
  Controllerone one = Get.put(Controllerone());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.white,
      appBar: AppBar(
        actions: [
          DropdownButton(
            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((int items) {
              return DropdownMenuItem(
                value: items,
                child: Text("${items}"),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (int? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ConstantColors.gold,
          ),
          onPressed: () => {},
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0.0,
        backgroundColor: ConstantColors.white,
        title: AppBarWidget(),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return one.cheching()
                ? PhothoScreen(dropdownvalue: dropdownvalue)
                : VideoScreen(dropdownvalue: dropdownvalue);
          },
        ),
      ),
      bottomNavigationBar: ProgrressBarWidget(),
    );
    ;
  }
}
