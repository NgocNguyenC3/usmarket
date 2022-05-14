import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/product.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

class ItemCart extends StatelessWidget {
  Product product;

  ItemCart(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: boxDecoration(Colors.white, baseRadius),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            product.imgLink,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  textWidget(product.name, Colors.black, 18, FontWeight.w600),
                  const Spacer(),
                  InkWell(
                    child: Image.asset(
                      iconsPath + 'back_x.png',
                      height: 24,
                      width: 24,
                    ),
                    onTap: () {
                      Provider.of<StateFragment>(context, listen: false)
                          .removeProduct(product);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              textWidget('\$' + product.price + '.00', Colors.red[500], 15.0,
                  FontWeight.w500),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Image.asset(iconsPath + 'down.png'),
                    onPressed: () {
                      if (product.count > 1) {
                        Provider.of<StateFragment>(context, listen: false)
                            .subtractCart(product);
                      }
                    },
                  ),
                  textWidget('Số lượng: ' + product.count.toString(),
                      Colors.red, 12, FontWeight.w400),
                  IconButton(
                      onPressed: () {
                        Provider.of<StateFragment>(context, listen: false)
                            .addCart(product);
                      },
                      icon: Image.asset(iconsPath + 'up.png')),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
