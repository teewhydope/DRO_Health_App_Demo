import 'package:dro_health/int/appointments/routes/Orders/routes/manage_orders.dart';
import 'package:dro_health/int/appointments/routes/Orders/routes/my_addresses.dart';
import 'package:dro_health/int/appointments/routes/Orders/routes/my_orders.dart';
import 'package:dro_health/int/appointments/routes/Orders/routes/order_presc.dart';
import 'package:dro_health/int/appointments/routes/Orders/routes/order_supp.dart';
import 'package:dro_health/int/home/routes/order_med/order_medication.dart';
import 'package:flutter/material.dart';

class Order {
  String id;
  String title;
  Widget pages;

  Order({this.id, this.title, this.pages});
}

// ignore: non_constant_identifier_names
final OrdersData = [
  Order(
    title: 'My Orders',
    pages: MyOrder(),
  ),
  Order(
    title: 'My Addresses',
    pages: MyAddr(),
  ),
  Order(
    title: 'Add New Order',
    pages: ManageOrders(),
  ),
  Order(
    title: 'Order medication or items',
    pages: OrderMedication(),
  ),
  Order(
    title: 'Order your prescription',
    pages: OrderPresc(),
  ),
  Order(
    title: 'Order supplies & equipment',
    pages: OrderSupp(),
  ),
];
