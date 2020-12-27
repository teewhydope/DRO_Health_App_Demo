import 'dart:ui';

import 'package:dro_health/int/home/routes/order_med/widgets/products_grid.dart';
import 'package:dro_health/int/home/routes/order_med/widgets/products_top_bar.dart';
//import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class OrderMedication extends StatelessWidget {
  final isGreen = Color.fromRGBO(12, 184, 182, 1);
  final isPurple = Color.fromRGBO(122, 67, 151, 1);

  @override
  Widget build(BuildContext context) {
    //final productsData = Provider.of<DrugProducts>(context);
    // final allLoadedProducts = productsData.allDrugProducts;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light, // as you need dark or light
    ));
    return Scaffold(
      body: SafeArea(
        child: SlidingSheet(
          body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: double.infinity,
            child: Column(
              children: [
                //top bar including back button and item count
                ProductsTopBar(),
                //Products grid builder widget
                ProductsGrid(),
              ],
            ),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Text(
                          'Tap on an item for add, remove, delete options'),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            '₦0',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                      RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
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
                          child: Text(
                            '0',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
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
