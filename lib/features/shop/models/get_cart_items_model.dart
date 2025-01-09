class GetCartItemsModel {
  List<Data>? data;
  String? message;

  GetCartItemsModel({this.data, this.message});

  GetCartItemsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  int? storeId;
  String? name;
  int? price;
  int? availableQuantity;
  String? imageProduct;
  String? productionDate;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Data(
      {this.id,
        this.storeId,
        this.name,
        this.price,
        this.availableQuantity,
        this.imageProduct,
        this.productionDate,
        this.expiryDate,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    name = json['name'];
    price = json['price'];
    availableQuantity = json['available_quantity'];
    imageProduct = json['image_product'];
    productionDate = json['production_date'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['store_id'] = storeId;
    data['name'] = name;
    data['price'] = price;
    data['available_quantity'] = availableQuantity;
    data['image_product'] = imageProduct;
    data['production_date'] = productionDate;
    data['expiry_date'] = expiryDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? productId;
  int? id;
  int? quantity;

  Pivot({this.userId, this.productId, this.id, this.quantity});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['id'] = id;
    data['quantity'] = quantity;
    return data;
  }
}
