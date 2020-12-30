import 'package:dro_health/int/home/routes/order_med/product_details.dart';
import 'package:dro_health/int/home/routes/order_med/widgets/grid_cards.dart';
import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<DrugProducts>(context);
    final allLoadedProducts = showOnlyFavorites
        ? productsData.favoriteItems
        : productsData.allDrugProducts;

    return Column(
      children: [
        Card(
          elevation: 5,
          child: Row(
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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  PopupMenuButton(
                    onSelected: (FilterOptions selectedValue) {
                      setState(() {
                        if (selectedValue == FilterOptions.Favorites) {
                          showOnlyFavorites = true;
                        } else {
                          showOnlyFavorites = false;
                        }
                      });
                    },
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FilterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.All,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Flexible(
          child: GridView.builder(
            itemCount: allLoadedProducts.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetails.routename,
                    arguments: allLoadedProducts[index].id);
              },
              child: ChangeNotifierProvider.value(
                //create: (ctx) =>
                value: allLoadedProducts[index],
                child: GridCards(),
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }
}
