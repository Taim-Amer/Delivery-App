class AddToCartModel {
  Data? data;
  String? message;

  AddToCartModel({this.data, this.message});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? productId;
  String? quantity;

  Data({this.productId, this.quantity});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'].toString();
    quantity = json['quantity'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}

