class AddFavouriteModel {
  Data? data;
  String? message;

  AddFavouriteModel({this.data, this.message});

  AddFavouriteModel.fromJson(Map<String, dynamic> json) {
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

  Data({this.productId});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    return data;
  }
}
