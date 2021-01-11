import 'package:flutter/material.dart';
import 'package:http/http.dart' as htttp;
import 'dart:convert';

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

  Future<void> removeItem(String drugProdId) async {
    _cartItems.remove(drugProdId);
    final url =
        'https://dro-app-demo-default-rtdb.firebaseio.com/CartItems/$drugProdId.json';
    await htttp.delete(url);
    notifyListeners();
  }

  Future<void> fetchAndSetCartItems() async {
    const url =
        'https://dro-app-demo-default-rtdb.firebaseio.com/CartItems.json';
    final response = await htttp.get(url);
    // json.decode(url);
    print(response.body);
    // try {
    //   final response = await htttp.get(url);
    //   // print(json.decode(response.body));
    final List<CartItem> loadedCartItems = [];
    final extractedData =
        json.decode(response.body)['name'] as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((cartId, cartItemsData) {
      loadedCartItems.add(CartItem(
          id: cartId,
          title: cartItemsData['title'],
          description: cartItemsData['description'],
          quantity: cartItemsData['quantity'],
          price: cartItemsData['price'],
          image: cartItemsData['image']));
    });
    print(_cartItems);
    _cartItems = {json.decode(response.body)['name'], loadedCartItems}
        as Map<String, CartItem>;
    print(_cartItems);
    notifyListeners();
    // } catch (error) {
    //   throw error;
    // }
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

  Future<void> addItemToCart(
    String drugProdId,
    int price,
    String title,
    String description,
    String image,
  ) async {
    final url =
        'https://dro-app-demo-default-rtdb.firebaseio.com/CartItems.json';
    final response = await htttp.post(
      url,
      body: json.encode(
        {
          'id': drugProdId,
          'title': title,
          'price': price,
          'description': description,
          'imageUrl': image,
          'quantity': _cartItems.length,
        },
      ),
    );
    if (_cartItems.containsKey(json.decode(response.body)['name'])) {
      _cartItems.update(
        json.decode(response.body)['name'],
        (existingCartItem) => CartItem(
            id: json.decode(response.body)['name'],
            title: existingCartItem.title,
            description: existingCartItem.description,
            quantity: existingCartItem.quantity + 1,
            image: existingCartItem.image,
            price: existingCartItem.price),
      );
    } else {
      _cartItems.putIfAbsent(
        json.decode(response.body)['name'],
        () => CartItem(
            id: json.decode(response.body)['name'],
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
