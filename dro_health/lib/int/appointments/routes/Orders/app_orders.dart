import 'package:dro_health/models/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AppOrdersScreen extends StatelessWidget {
  static const routename = '/app_order_screen';
  final isGreen = Color.fromRGBO(12, 184, 182, 1);

  final ordersData = OrdersData;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isGreen,
      statusBarBrightness: Brightness.dark, // as you need dark or light
    ));
    return Scaffold(
      /* Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
           */
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                color: Colors.purple,
                gradient: LinearGradient(
                  colors: [Colors.purpleAccent, Colors.purple[700]],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context, false),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Flexible(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 3,
                    itemCount: 6,
                    staggeredTileBuilder: (index) => StaggeredTile.count(
                        index == 0 || index == 1 || index == 2 ? 1 : 3, 1),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ordersData[index].pages),
                      ),
                      child: Card(
                        elevation: 5,
                        child: Text('$index'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
