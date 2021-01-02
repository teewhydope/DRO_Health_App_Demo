import 'dart:ui';

import 'package:dro_health/int/home/routes/order_med/widgets/products_overview_screen.dart';
import 'package:dro_health/models/drug_product.dart';
import 'package:dro_health/providers/cart.dart';
import 'package:expandable/expandable.dart';
//import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'widgets/numeric_step_button.dart';

class OrderMedication extends StatelessWidget {
  final isGreen = Color.fromRGBO(12, 184, 182, 1);
  final isPurple = Color.fromRGBO(122, 67, 151, 1);
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light, // as you need dark or light
    ));
    final cart = Provider.of<Cart>(context, listen: false);
    Provider.of<DrugProduct>(context);

    return Scaffold(
      body: SafeArea(
        child: SlidingSheet(
          body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: double.infinity,
            child:
                //Products grid builder widget
                ProductsOverViewScreen(),
          ),
          elevation: 8,
          cornerRadius: 30,
          color: isPurple,
          snapSpec: const SnapSpec(
            // Enable snapping. This is true by default.
            snap: true,
            // Set custom snapping points.
            snappings: [0.4, 0.08, 1.0],
            // Define to what the snappings relate to. In this case,
            // the total available space that the sheet can expand to.
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          // The body widget will be displayed under the SlidingSheet
          // and a parallax effect can be applied to it.
          builder: (context, state) {
            // This is the content of the sheet that will get
            // scrolled, if the content is bigger than the available
            // height of the sheet.
            return Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.9 -
                  MediaQuery.of(context).padding.top,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Marquee(
                        text:
                            'tap on an item to add and remove. swipe to delete!',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        blankSpace: 20.0,
                        velocity: 100.0,
                        pauseAfterRound: Duration(seconds: 1),
                        startPadding: 10.0,
                        accelerationDuration: Duration(seconds: 4),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),
                  ),

                  Container(
                    //color: Colors.grey,
                    height: MediaQuery.of(context).size.height * 0.65,
                    //width: double.infinity,
                    child: ListView.builder(
                      itemCount: cart.cartItem.length,
                      itemBuilder: (context, index) => Dismissible(
                        direction: DismissDirection.endToStart,
                        key: ValueKey(cart.cartItem.values.toList()[index].id),
                        onDismissed: (direction) {
                          Provider.of<Cart>(context, listen: false).removeItem(
                              cart.cartItem.values.toList()[index].id);
                        },
                        confirmDismiss: (direction) => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Delete Cart Item'),
                            content: Text('Do you want to delete this item?'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('NO')),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text('YES'))
                            ],
                          ),
                        ),
                        background: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 40,
                            color: Colors.white,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        child: Card(
                          child: Consumer<DrugProduct>(
                            builder: (context, drugProduct, child) =>
                                GestureDetector(
                                    onTap: () {
                                      drugProduct.toggleExpandedStatus();
                                    },
                                    child:

                                        ///
                                        ///
                                        ///
                                        ExpandablePanel(
                                      header: ListTile(
                                        leading: CircleAvatar(
                                          maxRadius: 25,
                                          backgroundImage: NetworkImage(cart
                                              .cartItem.values
                                              .toList()[index]
                                              .image),
                                        ),
                                        title: Text(cart.cartItem.values
                                            .toList()[index]
                                            .title),
                                        subtitle: Text(cart.cartItem.values
                                            .toList()[index]
                                            .description),
                                        trailing: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: isPurple,
                                          ),
                                          // padding: EdgeInsets.symmetric(
                                          //    horizontal: 5, vertical: 15),
                                          height: double.infinity,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          child: Align(
                                            child: Text(
                                              '${cart.cartItem.values.toList()[index].quantity}X'
                                              '    ₦${cart.cartItem.values.toList()[index].price.toString()}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      expanded: Container(
                                        height: 50,
                                        child: ListTile(
                                          trailing: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: NumericStepButton(
                                              maxValue: 200,
                                              onChanged: (value) {
                                                _counter = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )

                                    ///
                                    ///
                                    ///

                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //...
                  //...
                  //...
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Consumer<Cart>(
                            builder: (context, value, child) => Text(
                              //'₦0',
                              '₦${cart.totalAmount}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          //side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, Tabscreen.routename);
                        },
                        child: FittedBox(
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          headerBuilder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              color: isPurple,
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: MediaQuery.of(context).size.height * 0.007,
                      width: MediaQuery.of(context).size.width * 0.12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              'Bag',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          maxRadius: 16,
                          backgroundColor: Colors.white,
                          child: Consumer<Cart>(
                            builder: (context, cartData, child) => Text(
                              cartData.itemCount.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
