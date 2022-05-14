import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/product.dart';
import 'package:us_market/data/models/user.dart';
import 'package:us_market/presentations/pages/main/main.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/presentations/provider/state_store.dart';
import 'package:us_market/sources/const.dart';

import '../../presentations/pages/bottom_sheet/bottom_sheet_information.dart';
import '../../presentations/pages/homepage/homepage.dart';

Widget textWidget(text, color, size, fontWeight) {
  return Text(text, style: textStyle(color, size, fontWeight));
}

Widget textShadowWidget(text, color, size, fontWeight) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        overflow: TextOverflow.ellipsis,
        fontSize: size.toDouble(),
        fontWeight: fontWeight,
        shadows: [shadow()]),
  );
}

TextStyle textStyle(color, size, fontWeight) {
  return TextStyle(
      color: color, fontSize: size.toDouble(), fontWeight: fontWeight);
}

BoxDecoration boxBorderTop() {
  return BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(baseRadius));
}

Widget textFormFieldWidget(
    TextEditingController controller, text, pathIcon, isPrivate) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [boxShadow()],
        borderRadius: const BorderRadius.all(Radius.circular(baseRadius))),
    child: TextFormField(
        onSaved: (String? value) {},
        validator: (value) => value == null ? 'Email cannot be blank' : null,
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: inputDecoration(pathIcon, text, text),
        obscureText: isPrivate),
  );
}

InputDecoration inputDecoration(icon, hintText, labelText) {
  return InputDecoration(
    labelStyle: const TextStyle(color: Colors.black45),
    labelText: labelText,
    fillColor: Colors.white,
    filled: true,
    suffixIcon: Image.asset(
      icon,
      color: Colors.black,
      height: 15,
      width: 15,
    ),
  );
}

InputDecoration inputDecorationSheet(hintText, labelText) {
  return InputDecoration(
    labelStyle: const TextStyle(color: Colors.black45),
    labelText: labelText,
    fillColor: Colors.white,
    filled: true,
  );
}

BoxShadow boxShadow({dynamic color}) {
  return BoxShadow(
    color: color != null ? color : colorBoxShadow,
    blurRadius: 4,
    offset: Offset(0, 4),
  );
}

Widget textButton(
    margin, isSignIn, controllerEmail, controllerPassword, context) {
  return TextButton(
    style: btnStyle(18.0),
    onPressed: () {
      if (isSignIn) {
        EasyLoading.showProgress(0.3, status: 'Loading...');
        if (controllerEmail.text != '') {
          getDataSignIn(context, controllerEmail.text, controllerPassword.text);
        } else {
          EasyLoading.dismiss();
          showBar(context, 'Tài khoản trống');
        }
      } else {
        showBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheetInformationSignUP();
            });
      }
    },
    child: Center(
      child: textWidget(isSignIn ? 'Đăng nhập' : 'Đăng ký', Colors.red[300], 15,
          FontWeight.bold),
    ),
  );
}

getDataSignIn(context, accountText, password) async {
  CollectionReference account =
      FirebaseFirestore.instance.collection('account');
  account.doc(accountText).get().then((value) {
    if (value.exists) {
      final user = User.fromJson(value.data(), accountText);
      if (user.password == password) {
        EasyLoading.dismiss();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage(user)));
      }
    }
    showBar(context, 'Tài khoản mật khẩu không chính xác');
  });
  EasyLoading.dismiss();
}

BoxDecoration boxDecoration(color, radius) {
  return BoxDecoration(
      color: color,
      boxShadow: [boxShadow()],
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Shadow shadow() {
  return const Shadow(
      offset: Offset(0.0, 4.0),
      blurRadius: 4,
      color: Color.fromRGBO(0, 0, 0, 0.25));
}

Widget searchBox() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: baseRadius * 2),
    decoration: BoxDecoration(
        boxShadow: [boxShadow()],
        borderRadius: const BorderRadius.all(Radius.circular(baseRadius + 5))),
    child: TextFormField(
      style: textStyle(Colors.black54, 14, FontWeight.w500),
      decoration: InputDecoration(
          prefixIcon: Image.asset(iconsPath + 'search.png'),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(baseRadius + 5)),
              borderSide: BorderSide.none),
          labelStyle: textStyle(Colors.black45, 14, FontWeight.w500),
          labelText: 'Tìm kiếm',
          filled: true,
          fillColor: Colors.white),
    ),
  );
}

Widget imageSlider(path) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(baseRadius + 5)),
          boxShadow: [boxShadow()]),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(baseRadius + 5)),
        child: Image.network(
          path,
          fit: BoxFit.fitWidth,
          width: 200,
        ),
      ));
}

Widget item(Product product, context) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [boxShadow()],
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0))),
    child: Column(
      children: [
        Image.network(
          product.imgLink,
          fit: BoxFit.cover,
          width: 128,
          height: 100,
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: Row(
            children: [
              const SizedBox(
                width: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  textWidget(product.name, colorPP, 13.0, FontWeight.w600),
                  textWidget('\$' + product.price.toString() + '.00',
                      Colors.black, 13.0, FontWeight.w600)
                ],
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                height: 40,
                width: 40,
                child: TextButton(
                  style: btnStyle(10.0),
                  onPressed: () {
                    Provider.of<StateFragment>(context, listen: false)
                        .addCart(product);
                    showBar(context,
                        'Thêm ' + product.name + ' vào giỏ hàng thành công');
                  },
                  child: Center(
                      child: Image.asset(
                    iconsPath + 'plus.png',
                    height: 20,
                    width: 20,
                  )),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget boxType(context, path, type) {
  return InkWell(
      onTap: () {
        Provider.of<StateStore>(context, listen: false).setStateType(type);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15.0),
        width: 39,
        height: 22,
        decoration: boxDecoration(
            type == Provider.of<StateStore>(context, listen: true).stateType
                ? colorBlueY
                : Colors.white,
            baseRadius - 2),
        child: Image.asset(
          iconsPath + path,
          width: 20,
          height: 20,
        ),
      ));
}

Widget textField(controller, hintText, labelText) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(color: Colors.black),
    decoration: inputDecorationSheet(hintText, labelText),
    validator: (String? value) =>
        value == null ? null : 'Email cannot be blank',
  );
}

Widget textFieldNoneClicked(controller, hintText, labelText, isDay) {
  return InkWell(
    onTap: () {},
    child: TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: inputDecorationSheet(hintText, labelText),
      validator: (String? value) =>
          value == null ? null : 'Email cannot be blank',
    ),
  );
}

Widget orderBox(path, name, fee, count) {
  return path;
}

void showBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 500),
    backgroundColor: colorTheme,
    content: textWidget(text, Colors.red, 15.0, FontWeight.bold),
  ));
}

ButtonStyle btnStyle(double borderRadius) {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(colorTheme),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      )));
}
