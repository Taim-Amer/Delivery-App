class SigninModel {
  Data? data;
  String? message;

  SigninModel({this.data, this.message});

  SigninModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? image;
  String? location;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? accessToken;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.image,
        this.location,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    location = json['location'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['image'] = image;
    data['location'] = location;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['access_token'] = accessToken;
    return data;
  }
}
