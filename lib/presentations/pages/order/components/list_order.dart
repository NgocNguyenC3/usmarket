import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/product.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

class ItemListOfOrder extends StatelessWidget {
  List<Product> listProduct;

  ItemListOfOrder(this.listProduct, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    return Container(
      height: 500,
      width: min(size.width, maxSizeDevicesWidth),
      child: ListView.builder(
          itemCount: listProduct.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: boxDecoration(Colors.white, baseRadius),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(
                    listProduct[index].imgLink,
                    height: 70,
                    fit: BoxFit.cover,
                    width: 70,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textWidget(listProduct[index].name, Colors.black, 18,
                          FontWeight.w600),
                      const SizedBox(
                        height: 3,
                      ),
                      textWidget('\$' + listProduct[index].price + '.00',
                          Colors.red[500], 15.0, FontWeight.w500),
                      const SizedBox(
                        height: 3,
                      ),
                      textWidget(
                          'Số lượng: ' + listProduct[index].count.toString(),
                          Colors.red,
                          12,
                          FontWeight.w400)
                    ],
                  ))
                ],
              ),
            );
          }),
    );
  }
}
