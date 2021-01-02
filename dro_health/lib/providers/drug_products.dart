import 'package:dro_health/models/drug_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as htttp;
import 'dart:convert';

class DrugProducts with ChangeNotifier {
  List<DrugProduct> _allDrugProducts = [
    DrugProduct(
      id: 'dp1',
      title: 'Kezitil Susp.',
      description: 'Cefuroxime Axetil',
      mgQuantity: 'Oral Suspension - 125mg',
      price: 1820,
      //'₦1820',
      imageUrl:
          'https://www.emzorpharma.com/wp-content/uploads/2019/04/Kezitil-suspension-100ml.png',
    ),
    DrugProduct(
      id: 'dp2',
      title: 'Kezitil',
      description: 'Cefuroxime Axetil',
      mgQuantity: 'Tablet - 250mg',
      price: 1140,
      imageUrl:
          'https://www.emzorpharma.com/wp-content/uploads/2020/01/52-Kezitil-250-View-01-1024x505.png',
    ),
    DrugProduct(
      id: 'dp3',
      title: 'Garlic Oil',
      description: 'Garlic Oil',
      mgQuantity: 'Soft Gel - 650mg',
      price: 385,
      imageUrl:
          'https://www.emzorpharma.com/wp-content/uploads/2019/03/GARLIC-PACK-650mg.png',
    ),
    DrugProduct(
      id: 'dp4',
      title: 'Folic Acid',
      description: 'Folic Acid',
      mgQuantity: 'Tablet - 5mg',
      price: 170,
      imageUrl:
          'https://www.onehealthng.com/storage/products/15478341755f365b35784bdproduct.png',
    ),
  ];

  List<DrugProduct> get allDrugProducts {
    return [..._allDrugProducts];
  }

  Future<void> addProduct(DrugProduct drugProduct) {
    const url =
        'https://dro-app-demo-default-rtdb.firebaseio.com/drugProducts.json';
    return htttp
        .post(
      url,
      body: json.encode({
        'title': drugProduct.title,
        'price': drugProduct.price,
        'mgQuantity': drugProduct.mgQuantity,
        'description': drugProduct.description,
        'imageUrl': drugProduct.imageUrl,
        'isFavorite': drugProduct.isFavorite,
      }),
    )
        .then((response) {
      final addNewProduct = DrugProduct(
          id: json.decode(response.body)['name'],
          description: drugProduct.description,
          imageUrl: drugProduct.imageUrl,
          price: drugProduct.price,
          title: drugProduct.title,
          mgQuantity: drugProduct.mgQuantity);
      _allDrugProducts.insert(0, addNewProduct);
      notifyListeners();
    });
  }

  void updateProducts(String id, DrugProduct newProduct) {
    final productIndex =
        _allDrugProducts.indexWhere((drugProd) => drugProd.id == id);
    if (productIndex >= 0) {
      _allDrugProducts[productIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProducts(String id) {
    _allDrugProducts.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  List<DrugProduct> get favoriteItems {
    return _allDrugProducts.where((drugProd) => drugProd.isFavorite).toList();
  }
}
