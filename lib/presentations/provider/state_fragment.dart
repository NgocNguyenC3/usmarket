import 'package:flutter/material.dart';
import 'package:us_market/data/models/product.dart';
import 'package:us_market/data/models/user.dart';
import 'package:us_market/presentations/provider/state_store.dart';

class StateFragment with ChangeNotifier {
  StatePage _state = StatePage.homepage;
  String _name = '';
  String _pathIcon = '';
  User _user;
  var _map = {};
  var _cart = {};
  StateFragment(this._state, this._name, this._pathIcon, this._user);

  void setState(state) {
    _state = state;
    notifyListeners();
  }

  Product getProductByKey(key) {
    return _map[key];
  }

  List<Product> getProductStore(StateSort stateSort, StateType stateType) {
    List<Product> listResult = [];
    final listType = {
      StateType.bakery: 'bakery',
      StateType.milk: 'milk',
      StateType.fruit: 'fruit',
    };
    String type = listType[stateType]!;
    _map.forEach((key, value) {
      if (key.contains(type)) {
        listResult.add(value);
      }
    });
    listResult.sort(((a, b) {
      if (stateSort == StateSort.increase) {
        return double.parse(a.price).compareTo(double.parse(b.price));
      } else {
        return double.parse(b.price).compareTo(double.parse(a.price));
      }
    }));
    return listResult;
  }

  List<String> getCartId() {
    List<String> list = [];
    _cart.forEach((key, value) {
      list.add(key.toString() + '*' + _cart[key].count.toString());
    });

    return list;
  }

  void setNewBalance(value) {
    user.setBalance(value);
    notifyListeners();
  }

  void addCart(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart[product.id].addCount();
    } else {
      _cart[product.id] = product;
    }
    notifyListeners();
  }

  void subtractCart(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart[product.id].subtractCount();
      notifyListeners();
    }
  }

  void removeProduct(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart.remove(product.id);
      notifyListeners();
    }
  }

  double getSum() {
    final list = getCart();
    double sum = 0.0;
    for (var i in list) {
      sum += double.parse(i.price) * i.count;
    }
    return sum;
  }

  List<Product> getCart() {
    List<Product> listResult = [];

    _cart.forEach((key, value) {
      listResult.add(value);
    });
    return listResult;
  }

  List<Product> getAllList() {
    List<Product> list = [];
    _map.forEach((key, value) {
      list.add(value);
    });

    return list;
  }

  void setMap(map) {
    _map = map;
  }

  StatePage getState() => _state;

  String getName() => _name;
  String getPath() => _pathIcon;
  User get user => _user;
}

enum StatePage {
  homepage,
  store,
  cart,
  order,
  pay,
  out,
}
