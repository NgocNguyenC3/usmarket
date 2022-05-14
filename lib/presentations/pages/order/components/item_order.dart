import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/order.dart';
import 'package:us_market/data/models/product.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

import 'list_order.dart';

class ItemOrder extends StatelessWidget {
  Order item;

  ItemOrder(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listType = ['destroy.png', 'list.png', 'rocket.png', 'done.png'];
    final listTypeTitle = [
      'Đã hủy',
      'Đang xác minh',
      'Đang giao hàng',
      'Đã giao hàng'
    ];
    return InkWell(
      onTap: () {
        showListOrder(context, item);
      },
      child: Container(
        height: 70,
        decoration: boxDecoration(Colors.white, baseRadius),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 10.0,
            ),
            Center(
              child: Image.asset(
                iconsPath + listType[item.type],
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  textWidget(item.date, colorTheme, 22.0, FontWeight.w700),
                  textWidget('Trạng thái: ' + listTypeTitle[item.type],
                      Colors.black, 13.0, FontWeight.w400),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showListOrder(BuildContext context, Order item) {
  List<Product> list = [];
  final provider = Provider.of<StateFragment>(context, listen: false);
  for (var i in item.orderList) {
    var data = i.split('*');
    var product = provider.getProductByKey(data[0]);
    product.setCount(int.parse(data[1]));
    list.add(product);
  }
  print(list[1].name);
  showBottomSheet(
      context: context,
      builder: (context) {
        return Center(child: ItemListOfOrder(list));
      });
}
