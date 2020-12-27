import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<DrugProducts>(context);
    final allLoadedProducts = productsData.allDrugProducts;
    return Flexible(
      child: GridView.builder(
        itemCount: allLoadedProducts.length,
        itemBuilder: (context, index) => Card(
          //shadowColor: isGreen,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    allLoadedProducts[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        allLoadedProducts[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        allLoadedProducts[index].description,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        allLoadedProducts[index].quantity,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.star),
                    ),
                    Chip(
                      backgroundColor: Colors.grey,
                      label: Text(
                        allLoadedProducts[index].price,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
