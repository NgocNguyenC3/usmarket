class Order {
  List<dynamic> _orderList;
  String _date;
  int _type;
  Order(this._orderList, this._date, this._type);

  factory Order.fromJson(map) {
    return Order(map['order'], map['date'], int.parse(map['type']));
  }
  List<dynamic> get orderList => _orderList;
  String get date => _date;
  int get type => _type;
}
