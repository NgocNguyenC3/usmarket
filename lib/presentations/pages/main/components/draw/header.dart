import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/presentations/pages/bottom_sheet/information.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

class DrawHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StateFragment>(context, listen: true);
    return Container(
      width: 250,
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 10.0, right: 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [boxShadow()],
          borderRadius:
              const BorderRadius.only(topRight: Radius.circular(baseRadius))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [boxShadow()]),
              child: Image.asset(
                imagesPath + 'image.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              )),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              textShadowWidget(
                  provider.user.name, colorRed, 16.0, FontWeight.w800),
              const SizedBox(
                height: 5,
              ),
              textShadowWidget('Số dư: ' + provider.user.balance, colorBlue,
                  13.0, FontWeight.w600),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Center(child: Information());
                      });
                  Scaffold.of(context).openEndDrawer();
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  decoration: boxDecoration(colorBlueY, 20.0),
                  child: textWidget(
                      'Thông tin', Colors.black87, 12.0, FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
