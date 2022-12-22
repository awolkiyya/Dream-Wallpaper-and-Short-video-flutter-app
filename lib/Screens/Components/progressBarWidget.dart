import 'package:besic/Controllers/Controllersone.dart';
import 'package:besic/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgrressBarWidget extends StatefulWidget {
  ProgrressBarWidget({super.key});

  @override
  State<ProgrressBarWidget> createState() => _ProgrressBarWidgetState();
}

class _ProgrressBarWidgetState extends State<ProgrressBarWidget> {
  Controllerone one = Get.put(Controllerone());
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      items: [
        BottomNavigationBarItem(
          label: "photo",
          icon: Icon(Icons.image),
        ),
        BottomNavigationBarItem(
          label: "video",
          icon: Icon(Icons.video_collection),
        ),
      ],
      currentIndex: one.index.value,
      selectedItemColor: ConstantColors.gold,
      unselectedItemColor: ConstantColors.black,
      onTap: ((value) => {
            setState(
              () => {
                one.index.value = value,
              },
            )
          }),
    );
  }
}
