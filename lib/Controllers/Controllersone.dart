import 'package:besic/Models/wallPaperCollectionModel.dart';
import 'package:besic/Models/wallpaperModel.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Controllerone extends GetxController {
//   to get the api key you can contact me sorry for every thing i am waiting you
  RxInt index = 0.obs;
  List<WallPaperCollectionModel> wallPaperCollectionList = [];
  List<WallPaperModel> wallpapers = []; // the storage of the list of photo
  final RxBool _isloading = false.obs;
  bool cheching() {
    if (index.value == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool chechingloading() {
    if (_isloading.value == true) {
      return true;
    } else {
      return false;
    }
  }

  List<WallPaperCollectionModel> getCollection() {
    WallPaperCollectionModel categoriesModel = new WallPaperCollectionModel();
    categoriesModel.url =
        "https://images.pexels.com/photos/15286/pexels-photo.jpg";
    categoriesModel.title = "Nature";
    wallPaperCollectionList.add(categoriesModel);
    WallPaperCollectionModel categoriesModel1 = new WallPaperCollectionModel();
    categoriesModel1.url =
        "https://images.pexels.com/photos/1767434/pexels-photo-1767434.jpeg";
    categoriesModel1.title = "Love";
    wallPaperCollectionList.add(categoriesModel1);
    WallPaperCollectionModel categoriesModel2 = new WallPaperCollectionModel();
    categoriesModel2.url =
        "https://images.pexels.com/photos/546819/pexels-photo-546819.jpeg";
    categoriesModel2.title = "Code";
    wallPaperCollectionList.add(categoriesModel2);
    WallPaperCollectionModel categoriesModel3 = new WallPaperCollectionModel();
    categoriesModel3.url =
        "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg";
    categoriesModel3.title = "Food";
    wallPaperCollectionList.add(categoriesModel3);
    WallPaperCollectionModel categoriesModel4 = new WallPaperCollectionModel();
    categoriesModel4.url =
        "https://images.pexels.com/photos/338713/pexels-photo-338713.jpeg";
    categoriesModel4.title = "Drink";
    wallPaperCollectionList.add(categoriesModel4);
    WallPaperCollectionModel categoriesModel5 = new WallPaperCollectionModel();
    categoriesModel5.url =
        "https://images.pexels.com/photos/1105666/pexels-photo-1105666.jpeg";
    categoriesModel5.title = "Music";
    wallPaperCollectionList.add(categoriesModel5);
    WallPaperCollectionModel categoriesModel10 = new WallPaperCollectionModel();
    categoriesModel10.url =
        "https://images.pexels.com/photos/2087954/pexels-photo-2087954.png";
    categoriesModel10.title = "Life";
    wallPaperCollectionList.add(categoriesModel10);
    // WallPaperCollectionModel categoriesModel6 = new WallPaperCollectionModel();
    // categoriesModel6.url =
    //     "https://images.pexels.com/photos/248148/pexels-photo-248148.jpeg";
    // categoriesModel6.title = "Sex";
    // wallPaperCollectionList.add(categoriesModel6);
    WallPaperCollectionModel categoriesModel7 = new WallPaperCollectionModel();
    categoriesModel7.url =
        "https://images.pexels.com/photos/6764088/pexels-photo-6764088.jpeg";
    categoriesModel7.title = "Cry";
    wallPaperCollectionList.add(categoriesModel7);
    WallPaperCollectionModel categoriesModel9 = new WallPaperCollectionModel();
    categoriesModel9.url =
        "https://images.pexels.com/photos/1210273/pexels-photo-1210273.jpeg";
    categoriesModel9.title = "Heart";
    wallPaperCollectionList.add(categoriesModel9);
    WallPaperCollectionModel categoriesModel8 = new WallPaperCollectionModel();
    categoriesModel8.url =
        "https://images.pexels.com/photos/3123980/pexels-photo-3123980.jpeg";
    categoriesModel8.title = "Broken";
    wallPaperCollectionList.add(categoriesModel8);
    return wallPaperCollectionList;
  }
}
