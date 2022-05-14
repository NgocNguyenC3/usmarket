import 'package:flutter/material.dart';
import 'package:us_market/sources/const.dart';

class HeroLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'splash',
        child: Container(
          width: 144,
          height: 144,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Center(
            child: Image.asset(
              imagesPath + 'logo.png',
              width: 80,
              height: 80,
            ),
          ),
        ));
  }
}
