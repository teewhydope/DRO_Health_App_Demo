import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<DrugProducts>(context);
    final allLoadedProducts = productsData.allDrugProducts;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        Center(
          child: Text(
            '${allLoadedProducts.length} item(s)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Container(),
      ],
    );
  }
}
