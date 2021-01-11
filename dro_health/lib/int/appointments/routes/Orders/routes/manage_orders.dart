import 'package:dro_health/int/appointments/routes/Orders/routes/add_edit_product.dart';
import 'package:dro_health/providers/drug_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageOrders extends StatelessWidget {
  Future<void> _refreshDrugProducts(BuildContext context) async {
    await Provider.of<DrugProducts>(context).fetchAndSetProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<DrugProducts>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEditProduct()));
              })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshDrugProducts(context),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: productsData.allDrugProducts.length,
            itemBuilder: (context, index) => Card(
              elevation: 1,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    productsData.allDrugProducts[index].imageUrl,
                  ),
                ),
                title: Text(productsData.allDrugProducts[index].title),
                subtitle: Text(productsData.allDrugProducts[index].description),
                trailing: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.edit, color: Colors.purple),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                AddEditProduct.routename,
                                arguments:
                                    productsData.allDrugProducts[index].id);
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            try {
                              await productsData.deleteProducts(
                                  productsData.allDrugProducts[index].id);
                            } catch (error) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Deleting failed!',
                                  textAlign: TextAlign.center,
                                  //textAlign: TextAlign.center,
                                ),
                                // action: SnackBarAction(
                                //   label: 'Ok',
                                //   onPressed: () {
                                //     Navigator.of(context).pop();
                                //   },
                                //   textColor: Colors.amber,
                                // ),
                                duration: Duration(seconds: 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor: Colors.grey[700],
                              ));
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
