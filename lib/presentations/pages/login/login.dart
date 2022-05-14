import 'dart:math';

import 'package:flutter/material.dart';
import 'package:us_market/presentations/pages/login/components/body.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/hero_logo.dart';
import 'package:delayed_display/delayed_display.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: false, body: SafeArea(child: _LoginPage())),
    );
  }
}

class _LoginPage extends StatelessWidget {
  dynamic size, width;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    return Center(
      child: Container(
        color: colorTheme,
        width: min(width, maxSizeDevicesWidth),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Center(
              child: HeroLogo(),
            )),
            Expanded(
              child: DelayedDisplay(
                  delay: const Duration(seconds: timeDelay),
                  child: BodyLogin(emailController, passwordController)),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
