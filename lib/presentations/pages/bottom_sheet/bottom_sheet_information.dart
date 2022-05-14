import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

class BottomSheetInformationSignUP extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dayOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  BottomSheetInformationSignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 700,
        width: min(size.width, maxSizeDevicesWidth),
        padding: const EdgeInsets.all(basePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            textField(emailController, 'ngocnguyenc3', 'Tài khoản'),
            const SizedBox(
              height: 5.0,
            ),
            textField(passwordController, '123123', 'Mật khẩu'),
            const SizedBox(
              height: 5.0,
            ),
            textField(nameController, 'Tối đa 8 kí tự', 'Tên'),
            const SizedBox(
              height: 5.0,
            ),
            textField(phoneNumberController, 'Số điện thoại', 'SĐT'),
            const SizedBox(
              height: 5.0,
            ),
            textFieldNoneClicked(
                dayOfBirthController, 'Ngày sinh', 'Ngày sinh', true),
            const SizedBox(
              height: 5.0,
            ),
            textFieldNoneClicked(genderController, 'Nam', 'Giới tính', false),
            const SizedBox(
              height: 5.0,
            ),
            textField(addressController, 'Địa chỉ', 'Địa chỉ'),
            const SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                if (nameController.text.length >= 12) {
                  showBar(context, 'Tên quá dài, tối đa 11 kí tự');
                } else if (emailController.text == "" ||
                    passwordController.text == "" ||
                    nameController.text == "" ||
                    phoneNumberController.text == "" ||
                    dayOfBirthController.text == "" ||
                    genderController.text == "" ||
                    addressController.text == "") {
                  showBar(context, 'Trống');
                } else {
                  saveData(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                      phoneNumberController.text,
                      dayOfBirthController.text,
                      genderController.text,
                      addressController.text,
                      context);
                  ;
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.center,
                decoration: boxDecoration(colorTheme, baseRadius),
                child: textWidget('Save', Colors.white, 20.0, FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}

saveData(String email, String password, String name, String phoneNumber,
    String date, String gender, String address, context) async {
  CollectionReference account =
      FirebaseFirestore.instance.collection('account');
  account.doc(email).get().then((value) {
    if (value.exists) {
      showBar(context, 'Tài khoản đã tồn tại');
    } else {
      List<String> list = [];
      account.doc(email).set({
        'address': address,
        'balance': '1000',
        'dateOfBirth': date,
        'gender': gender,
        'name': name,
        'password': password,
        'phoneNumber': phoneNumber,
        'order': list
      }).then((value) {
        showBar(context, 'Đăng ký thành công');
      }).then((value) {
        showBar(context, 'Không thành công');
      });
    }
  });
}
