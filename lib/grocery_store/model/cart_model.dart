import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avacado', '40', 'lib/grocery_store/images/avocado.png', Colors.green],
    ['Banana', '35', 'lib/grocery_store/images/banana.png', Colors.yellow],
    ['Chicken', '180', 'lib/grocery_store/images/chicken.png', Colors.brown],
    ['Water', '25', 'lib/grocery_store/images/water.png', Colors.blue],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCArt(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
