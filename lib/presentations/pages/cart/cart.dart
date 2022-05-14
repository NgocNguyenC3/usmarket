import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/product.dart';
import 'package:us_market/presentations/pages/cart/components/item_cart.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.all(basePadding * 2),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: Provider.of<StateFragment>(context, listen: false)
                      .getCart()
                      .length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(bottom: basePadding),
                        child: ItemCart(
                            Provider.of<StateFragment>(context, listen: false)
                                .getCart()[index]));
                  }),
            ),
            TextButton(
              style: btnStyle(18.0),
              onPressed: () {
                final provider =
                    Provider.of<StateFragment>(context, listen: false);
                if (provider.getSum() >= 0) {
                  if (double.parse(provider.user.balance) >=
                      provider.getSum()) {
                    final length = provider.user.orderId.length;
                    provider.user.addOderId(length.toString());
                    provider.setNewBalance(
                        (double.parse(provider.user.balance) -
                                provider.getSum())
                            .toString());
                    saveOrderAndBalance(provider, length);
                    showBar(context, 'Thanh toán thành công, mời xem giỏ hàng');
                  } else {
                    showBar(context, 'Thanh toán không thành công');
                  }
                }
              },
              child: Center(
                child: textWidget(
                    'Tổng: \$' +
                        Provider.of<StateFragment>(context, listen: false)
                            .getSum()
                            .toString(),
                    Colors.white,
                    18,
                    FontWeight.w700),
              ),
            )
          ],
        ));
  }
}

saveOrderAndBalance(StateFragment provider, length) async {
  DateTime now = DateTime.now();
  final firebase = FirebaseFirestore.instance;
  firebase
      .collection('account')
      .doc(provider.user.account)
      .set(provider.user.getJson());
  firebase
      .collection('order')
      .doc(provider.user.account +
          provider.user.orderId[provider.user.orderId.length - 1])
      .set({
    'date': now.day.toString() +
        '/' +
        now.month.toString() +
        '/' +
        now.year.toString(),
    'order': provider.getCartId(),
    'type': '1'
  });
}
