import 'package:flutter/material.dart';
import 'package:us_market/data/models/product.dart';

import '../data/models/user.dart';
import '../presentations/provider/state_fragment.dart';

//path
const iconsPath = 'assets/icons/';
const imagesPath = 'assets/images/';
// Color
const colorTheme = Color.fromRGBO(139, 219, 129, 0.698);
const colorTheme1 = Color.fromARGB(255, 66, 226, 45);
const colorNameApp = Color.fromRGBO(232, 14, 14, 0.6);
const colorBoxShadow = Color.fromRGBO(0, 0, 0, 0.25);
const colorBackGroundEmail = Color.fromRGBO(232, 255, 253, 0.5);
const colorRed = Color.fromRGBO(232, 14, 14, 0.8);
const colorBlue = Color.fromRGBO(56, 131, 185, 1);
const colorBlueNone = Color.fromRGBO(195, 219, 217, 0.5);
const colorBlueY = Color.fromRGBO(195, 219, 217, 0.8);
const colorPP = Color.fromRGBO(200, 69, 139, 1);
const colorOrder = Color.fromRGBO(195, 219, 217, 0.2);
const colorTextBlue = Color.fromRGBO(109, 178, 228, 0.8);
// Size
const maxSizeDevicesWidth = 360.0;
const baseRadius = 10.0;
const basePadding = 10.0;
const paddingSize = 30.0;
// static
final stateList = [
  StateFragment(StatePage.homepage, 'Trang chủ', iconsPath + 'homepage.png',
      User('', '', '', '', '', '', '', '', [])),
  StateFragment(StatePage.store, 'Cửa hàng', iconsPath + 'store.png',
      User('', '', '', '', '', '', '', '', [])),
  StateFragment(StatePage.cart, 'Giỏ hàng', iconsPath + 'cart.png',
      User('', '', '', '', '', '', '', '', [])),
  StateFragment(StatePage.order, 'Đơn hàng', iconsPath + 'order.png',
      User('', '', '', '', '', '', '', '', [])),
  StateFragment(StatePage.pay, 'Nạp tiền', iconsPath + 'pay.png',
      User('', '', '', '', '', '', '', '', [])),
  StateFragment(StatePage.out, 'Đăng xuất', iconsPath + 'signout.png',
      User('', '', '', '', '', '', '', '', []))
];
final listSlider = [
  imagesPath + 'img1.jpg',
  imagesPath + 'img3.jpg',
  imagesPath + 'img1.jpg',
  imagesPath + 'img3.jpg',
  imagesPath + 'img1.jpg',
  imagesPath + 'img3.jpg',
];
const nameApp = 'Ú Market';
const int timeDelay = 3;
Product product =
    Product('001', imagesPath + 'img1.jpg', 'Bell pepper', '90.00', count: 2);
