class ProductModel {
  List<Data>? data;
  String? message;

  ProductModel({this.data, this.message});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
        this.updatedAt});

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
    return data;
  }
}
