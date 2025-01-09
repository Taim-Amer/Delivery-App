class StoreModel {
  List<Data>? data;
  String? message;

  StoreModel({this.data, this.message});

  StoreModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? location;
  String? represents;
  String? imageStore;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.location,
        this.represents,
        this.imageStore,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    represents = json['represents'];
    imageStore = json['image_store'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['represents'] = represents;
    data['image_store'] = imageStore;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
