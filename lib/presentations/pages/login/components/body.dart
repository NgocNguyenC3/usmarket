import 'package:flutter/material.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

class BodyLogin extends StatelessWidget {
  BodyLogin(this.emailController, this.passwordController, {Key? key})
      : super(key: key);
  TextEditingController emailController;
  TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(paddingSize),
      decoration: boxBorderTop(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          textFormFieldWidget(
              emailController, 'Tài khoản', iconsPath + 'user.png', false),
          const SizedBox(
            height: 20,
          ),
          textFormFieldWidget(
              passwordController, 'Mật khẩu', iconsPath + 'lock.png', true),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Quên mật khẩu',
              textDirection: TextDirection.rtl,
              style: textStyle(Colors.red, 12, FontWeight.w100),
              textAlign: TextAlign.right,
            ),
          ),

          const SizedBox(
            height: 60,
          ),
          // Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: textButton(
                30.0, true, emailController, passwordController, context),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              iconsPath + 'line.png',
              width: 150,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: textButton(
                60.0, false, emailController, passwordController, context),
          ),
        ],
      ),
    );
  }
}
