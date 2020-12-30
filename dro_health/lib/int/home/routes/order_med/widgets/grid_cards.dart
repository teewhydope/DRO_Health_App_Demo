import 'package:dro_health/models/drug_product.dart';
import 'package:dro_health/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<DrugProduct>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      //shadowColor: isGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Container(
        //color: Colors.grey,
        padding: EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              // color: Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.195,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.description,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.quantity,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              //color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<DrugProduct>(
                    builder: (context, drugProduct, child) => IconButton(
                      onPressed: () {
                        product.toggleFavoriteStatus();
                      },
                      icon: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.grey[700],
                    label: Text(
                      '₦${product.price.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  /*Consumer<DrugProduct>(
                    builder: (context, drugProduct, child) => IconButton(
                        color: Colors.green,
                        icon: Stack(
                          children: [
                            !product.cartAdded
                                ? Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.shopping_bag,
                                    color: Colors.red,
                                  ),
                          ],
                        ),
                        onPressed: () {
                          product.toggleCartStatus();
                          product.cartAdded
                              ? cart.addItemToCart(
                                  product.id,
                                  product.price,
                                  product.title,
                                  product.description,
                                  product.imageUrl,
                                )
                              : Provider.of<Cart>(context, listen: false)
                                  .removeItem(product.id);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('item removed'),
                            duration: Duration(seconds: 1),
                          ));
                        }),
                  ), */
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
