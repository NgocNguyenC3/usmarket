import 'dart:math';

import 'package:flutter/material.dart';
import 'package:us_market/presentations/pages/login/login.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/hero_logo.dart';
import 'package:us_market/sources/utility/utility.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  dynamic size, width;
  @override
  void initState() {
    super.initState();
    splashAction();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    return Center(
      child: Container(
        color: colorTheme,
        width: min(width, maxSizeDevicesWidth),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HeroLogo(),
            const SizedBox(
              height: 50,
            ),
            textWidget('Ú Market', colorNameApp, 40, FontWeight.w400)
          ],
        )),
      ),
    );
  }

  splashAction() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(seconds: timeDelay),
            pageBuilder: (_, __, ___) => const LoginPage()));
  }
}
