import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/order.dart';
import 'package:us_market/presentations/pages/order/components/item_order.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';

class OrderPage extends StatelessWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
        future: getOrderData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Order> list = snapshot.data!;
            return Container(
              color: Colors.white,
              margin: const EdgeInsets.all(basePadding * 2),
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: basePadding),
                        child: ItemOrder(list[index]));
                  }),
            );
          } else {
            return Text('loading');
          }
        });
  }
}

Future<List<Order>> getOrderData(context) async {
  List<Order> list = [];
  final firebase = FirebaseFirestore.instance.collection('order');
  final provider = Provider.of<StateFragment>(context, listen: false);
  for (var i in provider.user.orderId) {
    await firebase
        .doc(provider.user.account.toString() + i.toString())
        .get()
        .then((value) {
      list.add(Order.fromJson(value.data()));
    });
  }
  return list;
}
