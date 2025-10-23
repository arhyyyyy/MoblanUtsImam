import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(String name, String price, int quantity, String image) {
    final index = _cartItems.indexWhere((item) => item["name"] == name);
    if (index >= 0) {
      _cartItems[index]["quantity"] += quantity;
    } else {
      _cartItems.add({
        "name": name,
        "price": double.tryParse(price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0,
        "quantity": quantity,
        "image": image,
      });
    }
    notifyListeners();
  }

  void removeFromCart(String name) {
    _cartItems.removeWhere((item) => item["name"] == name);
    notifyListeners();
  }

  void incrementQuantity(String name) {
    final index = _cartItems.indexWhere((item) => item["name"] == name);
    if (index >= 0) {
      _cartItems[index]["quantity"]++;
      notifyListeners();
    }
  }

  void decrementQuantity(String name) {
    final index = _cartItems.indexWhere((item) => item["name"] == name);
    if (index >= 0) {
      if (_cartItems[index]["quantity"] > 1) {
        _cartItems[index]["quantity"]--;
      } else {
        _cartItems.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
