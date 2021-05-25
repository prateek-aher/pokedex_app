import 'package:flutter/material.dart';

class ListProperties extends ChangeNotifier {
  bool isListMode;
  bool isSortAtoZ;

  ListProperties({this.isListMode, this.isSortAtoZ});

  // bool get viewMode => isListMode;
  // bool get order => isSortAtoZ;
  void changeViewMode() {
    isListMode = !isListMode;
    notifyListeners();
  }

  void changeOrder() {
    isSortAtoZ = !isSortAtoZ;
    notifyListeners();
  }
}
