import 'package:flutter/material.dart';

class FavIcon extends ChangeNotifier {
  bool isFav = false;
  bool changeisFav() {
    isFav = !isFav;
    notifyListeners();
    return isFav;
    
  }
}
