import 'package:besic/Screens/Components/videoPlayer.dart';
import 'package:flutter/material.dart';

class SingleVideoPlayerScreen extends StatelessWidget {
  String? url;
  int? duration;
  String username;
  SingleVideoPlayerScreen(
      {super.key, required this.url, this.duration, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 1,
        controller: PageController(initialPage: 0, viewportFraction: 1.0),
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return Stack(
            children: [
              VideoPlayerItem(
                videoUrl: url,
              ),
            ],
          );
        }),
      ),
    );
  }
}
