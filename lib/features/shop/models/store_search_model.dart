class StoreSearchModel {
  List<Zero>? l0;
  String? message;

  StoreSearchModel({this.l0, this.message});

  StoreSearchModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? location;
  String? represents;
  String? imageStore;
  String? createdAt;
  String? updatedAt;

  Zero(
      {this.id,
      this.name,
      this.location,
      this.represents,
      this.imageStore,
      this.createdAt,
      this.updatedAt});

  Zero.fromJson(Map<String, dynamic> json) {
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
