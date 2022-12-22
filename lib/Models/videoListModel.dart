class VideoListModel {
  int? duration;
  String? imageUrl;
  VideoModel? video;
  UserModel? user;
  VideoListModel({this.duration, this.user, this.imageUrl, this.video});
  factory VideoListModel.fromMap(Map<String, dynamic> jsonData) {
    return VideoListModel(
        duration: jsonData["duration"],
        user: UserModel.fromMap(jsonData["user"]),
        imageUrl: jsonData["image"],
        video: VideoModel.fromMap(jsonData['video_files']));
  }
}

class UserModel {
  String username;
  UserModel({required this.username});
  factory UserModel.fromMap(Map<String, dynamic> jsonData) {
    return UserModel(
      username: jsonData['name'],
    );
  }
}

class VideoModel {
  HdvideoModel? hdvideoModel;

  VideoModel({required this.hdvideoModel});
  factory VideoModel.fromMap(List<dynamic> jsonData) {
    return VideoModel(hdvideoModel: HdvideoModel.fromMap(jsonData[0]));
  }
}

class HdvideoModel {
  String? hdurl;
  HdvideoModel({required this.hdurl});
  factory HdvideoModel.fromMap(Map<String, dynamic> jsonData) {
    return HdvideoModel(hdurl: jsonData['link']);
  }
}
