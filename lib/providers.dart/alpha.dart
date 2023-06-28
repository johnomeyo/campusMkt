import 'package:flutter/material.dart';

class FavIcon extends ChangeNotifier {
  bool isFav = false;
  void changeisFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
