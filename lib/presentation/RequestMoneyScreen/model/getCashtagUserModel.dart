class GetCashtagUserModel {
  bool? status;
  String? message;
  Data? data;

  GetCashtagUserModel({this.status, this.message, this.data});

  GetCashtagUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? profilePhotoUrl;
  String? email;
  String? uuid;
  String? cashtag;

  Data({this.name, this.profilePhotoUrl, this.email, this.uuid, this.cashtag});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePhotoUrl = json['profile_photo_url'];
    email = json['email'];
    uuid = json['uuid'];
    cashtag = json['cashtag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['email'] = this.email;
    data['uuid'] = this.uuid;
    data['cashtag'] = this.cashtag;
    return data;
  }
}