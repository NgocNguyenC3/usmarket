import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/data/models/user.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

class Information extends StatelessWidget {
  Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<StateFragment>(context, listen: false).user;
    dynamic size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white10,
          width: min(size.width, maxSizeDevicesWidth),
          padding: const EdgeInsets.all(basePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [boxShadow()]),
                  child: Image.asset(
                    imagesPath + 'image.png',
                    width: 220,
                    height: 220,
                    fit: BoxFit.contain,
                  )),
              const SizedBox(
                height: 50.0,
              ),
              textWidget('Họ và tên: ' + user.name, Colors.black, 20.0,
                  FontWeight.w700),
              const SizedBox(
                height: 5.0,
              ),
              textWidget('Số điện thoại: ' + user.phoneNumber, Colors.black,
                  20.0, FontWeight.w700),
              const SizedBox(
                height: 5.0,
              ),
              textWidget('Ngày sinh: ' + user.dateOfBirth, Colors.black, 20.0,
                  FontWeight.w700),
              const SizedBox(
                height: 5.0,
              ),
              textWidget('Giới tính: ' + user.gender, Colors.black, 20.0,
                  FontWeight.w700),
              const SizedBox(
                height: 5.0,
              ),
              textWidget('Địa chỉ: ' + user.address, Colors.black, 20.0,
                  FontWeight.w700),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
