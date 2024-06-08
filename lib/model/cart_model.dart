import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List<List<dynamic>> _shopItems = [
   
    ["Champanhe", "4.00", "lib/images/festillant.png",Colors.green],
    ["Espumante", "2.50", "lib/images/festy.png", Colors.yellow],
    ["Gin", "12.80", "lib/images/gin.png",Colors.brown],
    ["Cerveja", "1.00", "lib/images/heineken.jpg", Colors.blue],
  ];

  // list of cart items
  final List<List<dynamic>> _cartItems = [];

  List<List<dynamic>> get cartItems => _cartItems;

  List<List<dynamic>> get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}