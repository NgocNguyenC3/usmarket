import 'dart:convert';

class User {
  String _account;
  String _password;
  String _phoneNumber;
  String _address;
  String _gender;
  String _balance;
  String _name;
  String _dateOfBirth;
  List<String> _orderId;

  User(
      this._account,
      this._password,
      this._phoneNumber,
      this._address,
      this._gender,
      this._balance,
      this._name,
      this._dateOfBirth,
      this._orderId);
  factory User.fromJson(value, account) {
    return User(
        account,
        value['password'],
        value['phoneNumber'],
        value['address'],
        value['gender'],
        value['balance'],
        value['name'],
        value['dateOfBirth'],
        List<String>.from(value['order']));
  }
  void addOderId(id) {
    _orderId.add(id);
  }

  Map<String, dynamic> getJson() {
    Map<String, dynamic> map = {};
    map['password'] = _password;
    map['phoneNumber'] = _phoneNumber;
    map['address'] = _address;
    map['gender'] = _gender;
    map['balance'] = _balance;
    map['name'] = _name;
    map['dateOfBirth'] = _dateOfBirth;
    map['order'] = _orderId;
    return map;
  }

  String get account => _account;
  String get password => _password;
  String get phoneNumber => _phoneNumber;
  String get address => _address;
  String get gender => _gender;
  String get balance => _balance;
  String get name => _name;
  String get dateOfBirth => _dateOfBirth;

  void setAccount(account) {
    _account = account;
  }

  void setPassword(password) {
    _password = password;
  }

  void setPhoneNumber(phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  void setAddress(address) {
    _address = address;
  }

  void setGender(gender) {
    _gender = gender;
  }

  void setBalance(balance) {
    _balance = balance;
  }

  void setName(name) {
    _name = name;
  }

  void setDateOfBirth(dateOfBirth) {
    _dateOfBirth = dateOfBirth;
  }

  List<dynamic> get orderId => _orderId;
}
