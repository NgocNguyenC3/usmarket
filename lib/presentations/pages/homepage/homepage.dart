import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/product.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';

import '../../../sources/utility/utility.dart';

class HomePage extends StatelessWidget {
  dynamic size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAllProduct(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Provider.of<StateFragment>(context, listen: false)
                .setMap(snapshot.data);
            return Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                        boxShadow: [boxShadow(color: colorTheme)]),
                    child: CarouselSlider(
                      items: Provider.of<StateFragment>(context, listen: false)
                          .getAllList()
                          .map((value) => imageSlider(value.imgLink))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 104,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (128 / 150),
                    shrinkWrap: true,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 8.0,
                    scrollDirection: Axis.vertical,
                    children: Provider.of<StateFragment>(context, listen: false)
                        .getAllList()
                        .map((value) => item(value, context))
                        .toList(),
                  ))
                ],
              ),
            );
          }
          return Text('null');
        });
  }
}

Future<Map<String, Product>> getAllProduct(context) async {
  Map<String, Product> map = {};
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('product');
  QuerySnapshot querySnapshot = await _collectionRef.get();
  for (var element in querySnapshot.docs) {
    map[element.id] = Product.toJson(element.data(), element.id);
  }
  return map;
}
