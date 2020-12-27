import 'package:flutter/foundation.dart';

class DrugProduct {
  final String id;
  final String title;
  final String description;
  final String quantity;
  final String price;
  final String imageUrl;
  bool isFavorite;

  DrugProduct({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.quantity,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite,
  });
}
