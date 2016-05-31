// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'dart:html';
import 'dart:convert';
import 'package:whipsadmin/model/orders.dart';
import 'package:whipsadmin/model/order_details.dart';

@Component(selector: 'my-app', templateUrl: 'app_component.html')
class AppComponent {
  static const String PATH_TO_ORDERS = "php/get_orders.php";
  static const String PATH_TO_ORDER_DETAILS = "php/get_order_details.php";
  static const String PATH_TO_ORDER_UPDATE = "php/update_order.php";
  List<Order> orders;
  List<Order> ordersDisplayed;
  List<OrderDetail> orderDetails;
  List<OrderDetail> currentOrder;
  bool hideDetails = true;

  AppComponent() {
    loadOrders();
    HttpRequest.getString(PATH_TO_ORDER_DETAILS).then(orderDetailsLoaded);
  }

  loadOrders() {
    HttpRequest.getString(PATH_TO_ORDERS).then(ordersLoaded);
  }

  ordersLoaded(data) {
    print(data);
    List<Map> orderMasterMapList = JSON.decode(data);
    orders = orderMasterMapList.map((Map element) => new Order.fromMap(element)).toList();
    ordersDisplayed = orders;
  }
  orderDetailsLoaded(data) {
    print(data);
    List<Map> orderDetailsMapList = JSON.decode(data);
    orderDetails = orderDetailsMapList.map((Map element) => new OrderDetail.fromMap(element)).toList();
  }

  showDetails(order) {
    currentOrder = orderDetails.where((OrderDetail element) => element.order_idx == order).toList();
    hideDetails = false;
  }
  markComplete(order) {
    int completed;
    print("here1");
    Order orderToComplete = orders.where((Order element) => element.idx == order).first;
    print("here2");
    if (orderToComplete.completed) {
      completed = 0;
    } else {
      completed = 1;
    }
    orderToComplete.completed = !orderToComplete.completed;
    Map orderMap = {"id":order, "completed":completed};
    var toSend = JSON.encode(orderMap);
    //var toSend = JSON.encode(orderMap);
    HttpRequest.request(PATH_TO_ORDER_UPDATE, method: 'POST', mimeType: "application/json", sendData: toSend).catchError((obj) {})
        .then((val) {
      print(val.responseText);
    }, onError: (e) => print("error"));
  }
}
