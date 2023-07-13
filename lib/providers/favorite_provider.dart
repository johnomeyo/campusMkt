import 'package:flutter/material.dart';

class FavIcon extends ChangeNotifier {
  final List<String> _favorites = [];
  void get favorites => _favorites;
  void addToFavorites(
    String name,
  ) {
    _favorites.add(name);
    notifyListeners();
  }
}
