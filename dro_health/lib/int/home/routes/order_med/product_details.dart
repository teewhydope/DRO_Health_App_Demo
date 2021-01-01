import 'package:dro_health/int/home/routes/order_med/widgets/numeric_step_button.dart';
import 'package:dro_health/providers/cart.dart';
import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routename = '/product details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final isPurple = Color.fromRGBO(122, 67, 151, 1);

  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productsData = Provider.of<DrugProducts>(context)
        .allDrugProducts
        .firstWhere((prod) => prod.id == productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      /* appBar: AppBar(
          title: Text(productsData.title),
        ),*/
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isPurple,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                          Consumer<Cart>(
                            builder: (context, cartData, child) => Text(
                              cartData.itemCount.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.network(productsData.imageUrl),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(productsData.title,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  productsData.mgQuantity,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SOLD BY'),
                      Text('Emzor Pharmaceuticals'),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: NumericStepButton(
                        maxValue: 200,
                        onChanged: (value) {
                          _counter = value;
                        },
                      ),
                    ),
                    Text(
                      (_counter * productsData.price).toString(),
                    ), //style:
                    //TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PRODUCT DETAILS',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                //padding: EdgeInsets.symmetric(horizontal: 20),
                onPressed: () {
                  cart.addItemToCart(
                    productsData.id,
                    productsData.price,
                    productsData.title,
                    productsData.description,
                    productsData.imageUrl,
                  );
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'item added to bag!',
                      //textAlign: TextAlign.center,
                    ),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cart.removeSingleCartItem(productsData.id);
                      },
                      textColor: Colors.amber,
                    ),
                    duration: Duration(seconds: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.grey[700],
                  ));
                },
                color: isPurple,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  //color: Colors.grey,
                  // width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        'Add to bag',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
