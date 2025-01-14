class ProductSearchModel {
  List<Zero>? l0;
  String? message;

  ProductSearchModel({this.l0, this.message});

  ProductSearchModel.fromJson(Map<String, dynamic> json) {
    if (json['0'] != null) {
      l0 = <Zero>[];
      json['0'].forEach((v) {
        l0!.add(Zero.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (l0 != null) {
      data['0'] = l0!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Zero {
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

  Zero(
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

  Zero.fromJson(Map<String, dynamic> json) {
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
