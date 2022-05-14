class Product {
  String _id;
  String _imgLink;
  String _name;
  String _price;
  int _count = 1;
  String _rating = "";
  String _cmt = "";
  String _description = "";
  Product(this._id, this._imgLink, this._name, this._price,
      {String? rating, String? cmt, String? description, int? count}) {
    if (rating != null) {
      _rating = rating;
    }
    if (cmt != null) {
      _cmt = cmt;
    }
    if (description != null) {
      _description = description;
    }
    if (count != null) {
      _count = count;
    }
  }
  void setCount(count) {
    _count = count;
  }

  void addCount() {
    _count += 1;
  }
  void subtractCount() {
    _count -= 1;
  }

  factory Product.toJson(data, id) {
    return Product(id, data['link'], data['name'], data['price'],
        rating: data['rating'], cmt: '100', description: data['description']);
  }
  int get count => _count;
  String get id => _id;
  String get price => _price;
  String get imgLink => _imgLink;
  String get name => _name;
  String get cmt => _cmt;
  String get rating => _rating;
  String get description => _description;
}
