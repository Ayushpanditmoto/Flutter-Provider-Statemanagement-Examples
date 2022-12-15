// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  final List<int> _favouriteList = [];

  List<int> get favouriteList => _favouriteList;

  void addFavourite(int index) {
    _favouriteList.add(index);
    notifyListeners();
  }

  void removeFavourite(int index) {
    _favouriteList.remove(index);
    notifyListeners();
  }
}
