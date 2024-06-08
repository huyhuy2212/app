import 'package:flutter/material.dart';

class LikeProvider extends ChangeNotifier {
  List<int> listLike = [];
  
  void onLike(int id) {
    if (listLike.contains(id)) {
      listLike.remove(id); //neu trung id thi xoa
    } else {
      listLike.add(id);
    }
    print(listLike);
    notifyListeners();
  }

  void deleteItem(int id) {
    listLike.remove(id);
    notifyListeners();
  }

  void deleteAll() {
    listLike = [];
    notifyListeners();
  }
}
