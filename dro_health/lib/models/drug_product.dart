import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as htttp;
import 'dart:convert';

class DrugProduct with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String mgQuantity;
  final int price;
  final String imageUrl;
  var isFavorite;
  var cartAdded;
  var expanded;

  DrugProduct({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.mgQuantity,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
    this.cartAdded = false,
    this.expanded = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://dro-app-demo-default-rtdb.firebaseio.com/drugProducts/$id.json';
    try {
      final response = await htttp.patch(
        url,
        body: json.encode(
          {'isFavorite': isFavorite},
        ),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }

  void toggleCartStatus() {
    cartAdded = !cartAdded;
    notifyListeners();
  }

  void toggleExpandedStatus() {
    expanded = !expanded;
    notifyListeners();
  }
}
