
class Product {
  int? productid;
  String? productname;
  String? qty;
  double? price;

  Product({this.productid, this.productname, this.qty, this.price});

  Product.fromJson(Map<String, dynamic> json) {
    productid = json['productid'];
    productname = json['productname'];
    qty = json['qty'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productid'] = this.productid;
    data['productname'] = this.productname;
    data['qty'] = this.qty;
    data['price'] = this.price;
    return data;
  }
}
