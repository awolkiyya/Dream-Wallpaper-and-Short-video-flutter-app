class WallPaperModel {
  int? photographer_id;
  SrcModel? src;
  WallPaperModel({this.photographer_id, this.src});
  factory WallPaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallPaperModel(
      photographer_id: jsonData["photographer_id"],
      src: SrcModel.fromMap(jsonData['src']),
    );
  }
}

class SrcModel {
  String portrait;
  SrcModel({required this.portrait});
  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      portrait: jsonData['portrait'],
    );
  }
}
