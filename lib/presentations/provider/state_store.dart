import 'package:flutter/material.dart';

class StateStore with ChangeNotifier {
  StateSort _stateSort = StateSort.increase;
  StateType _stateType = StateType.bakery;
  var _list;

  StateStore(this._stateSort, this._stateType, this._list);

  void setStateSort(stateSort) {
    _stateSort = stateSort;
    notifyListeners();
  }

  void setStateType(stateType) {
    _stateType = stateType;
    notifyListeners();
  }

  void setList(list) {
    _list = list;
    notifyListeners();
  }

  StateSort get stateSort => _stateSort;
  StateType get stateType => _stateType;
  dynamic get list => _list;
}

enum StateSort {
  increase,
  decrease,
}
enum StateType { bakery, fruit, milk }
