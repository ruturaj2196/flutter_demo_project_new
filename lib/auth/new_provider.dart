import 'package:flutter/material.dart';

class NumbersProvider extends ChangeNotifier {
  List<int> number = [0, 1, 2, 3, 4, 5];

  void add() {
    int num = number.last;
    number.add(num + 1);
    notifyListeners();
  }

  void remove() {
    int num = number.last;
    number.remove(num);
    notifyListeners();
  }
}
