import 'package:dro_health/models/drug_product.dart';
import 'package:flutter/cupertino.dart';

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
    DrugProduct(
      id: 'dp5',
      title: 'Kezitil',
      description: 'Cefuroxime Axetil',
      mgQuantity: 'Tablet - 250mg',
      price: 1140,
      imageUrl:
          'https://www.emzorpharma.com/wp-content/uploads/2020/01/52-Kezitil-250-View-01-1024x505.png',
    ),
    DrugProduct(
      id: 'dp6',
      title: 'Garlic Oil',
      description: 'Garlic Oil',
      mgQuantity: 'Soft Gel - 650mg',
      price: 385,
      imageUrl:
          'https://www.emzorpharma.com/wp-content/uploads/2019/03/GARLIC-PACK-650mg.png',
    ),
    DrugProduct(
      id: 'dp7',
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

  void addProduct(DrugProduct drugProduct) {
    final addNewProduct = DrugProduct(
        id: DateTime.now().toString(),
        description: drugProduct.description,
        imageUrl: drugProduct.imageUrl,
        price: drugProduct.price,
        title: drugProduct.title,
        mgQuantity: drugProduct.mgQuantity);
    _allDrugProducts.insert(0, addNewProduct);
    notifyListeners();
  }

  List<DrugProduct> get favoriteItems {
    return _allDrugProducts.where((drugProd) => drugProd.isFavorite).toList();
  }
}