import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:us_market/data/models/user.dart';
import 'package:us_market/presentations/pages/cart/cart.dart';
import 'package:us_market/presentations/pages/cart/components/item_cart.dart';
import 'package:us_market/presentations/pages/homepage/homepage.dart';
import 'package:us_market/presentations/pages/order/order.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

import '../../provider/state_fragment.dart';
import '../order/components/item_order.dart';
import '../store/store.dart';
import 'components/draw/body.dart';
import 'components/draw/header.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  User user;
  MainPage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider<StateFragment>(
          create: (context) => StateFragment(StatePage.homepage, 'Trang chủ',
              iconsPath + 'homepage.png', user),
          child: Scaffold(
              drawer: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(baseRadius),
                        bottomRight: Radius.circular(baseRadius))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DrawHeader(),
                    Expanded(
                      child: DrawBody(),
                    )
                  ],
                ),
              ),
              body: _MainPage()),
        ),
      ),
    );
  }
}

class _MainPage extends StatelessWidget {
  dynamic size, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;

    return Center(
      child: Container(
        color: Colors.white,
        width: min(width, maxSizeDevicesWidth),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(baseRadius * 2),
              height: 80,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textShadowWidget(nameApp, colorTheme1, 24.0, FontWeight.w700),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [boxShadow()]),
                        child: Image.asset(
                          imagesPath + 'image.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.contain,
                        )),
                  ),
                ],
              ),
            ),
            searchBox(),
            const SizedBox(
              height: basePadding,
            ),
            Expanded(
              child: Consumer<StateFragment>(
                builder: (context, myModel, _) {
                  if (myModel.getState() == StatePage.homepage) {
                    return HomePage();
                  } else if (myModel.getState() == StatePage.store) {
                    return StorePage();
                  } else if (myModel.getState() == StatePage.cart) {
                    return CartPage();
                  } else if (myModel.getState() == StatePage.order) {
                    return OrderPage();
                  }
                  return Text('null');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
