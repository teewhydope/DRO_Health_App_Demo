import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final String image;
  final int price;
  var expanded;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.quantity,
    @required this.image,
    @required this.price,
    this.expanded = false,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItem {
    return {..._cartItems};
  }

  bool get expanded => false;

  removeItem(String drugProdId) {
    _cartItems.remove(drugProdId);
    notifyListeners();
  }

  void removeSingleCartItem(String drugProdId) {
    if (!_cartItems.containsKey(drugProdId)) {
      return;
    }
    if (_cartItems[drugProdId].quantity > 1) {
      _cartItems.update(
          drugProdId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              description: existingCartItem.description,
              quantity: existingCartItem.quantity - 1,
              image: existingCartItem.image,
              price: existingCartItem.price));
    } else {
      _cartItems.remove(drugProdId);
    }
    notifyListeners();
  }

  int get totalAmount {
    var total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount {
    return _cartItems.length;
  }

  void addItemToCart(
    String drugProdId,
    int price,
    String title,
    String description,
    String image,
  ) {
    if (_cartItems.containsKey(drugProdId)) {
      _cartItems.update(
        drugProdId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            description: existingCartItem.description,
            quantity: existingCartItem.quantity + 1,
            image: existingCartItem.image,
            price: existingCartItem.price),
      );
    } else {
      _cartItems.putIfAbsent(
        drugProdId,
        () => CartItem(
            id: drugProdId,
            title: title,
            description: description,
            quantity: 1,
            image: image,
            price: price),
      );
    }
    notifyListeners();
  }
}
