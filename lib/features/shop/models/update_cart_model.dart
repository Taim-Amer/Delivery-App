class UpdateCartModel {
  Data? data;
  String? message;

  UpdateCartModel({this.data, this.message});

  UpdateCartModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? userId;
  int? productId;
  String? quantity;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
