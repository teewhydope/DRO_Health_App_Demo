import 'package:flutter/foundation.dart';

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

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
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
