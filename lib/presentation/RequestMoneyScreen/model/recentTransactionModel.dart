class RecentTransactionModel {
  bool? status;
  String? message;
  Data? data;

  RecentTransactionModel({this.status, this.message, this.data});

  RecentTransactionModel.fromJson(Map<String, dynamic> json) {
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
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  List<User>? user;

  Data({this.total, this.perPage, this.currentPage, this.lastPage, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['lastPage'] = this.lastPage;
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? uuid;
  String? cashtag;
  String? email;
  String? profilePhotoPath;
  String? fcmToken;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.uuid,
        this.cashtag,
        this.email,
        this.profilePhotoPath,
        this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    uuid = json['uuid'];
    cashtag = json['cashtag'];
    email = json['email'];
    profilePhotoPath = json['profile_photo_path'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['uuid'] = this.uuid;
    data['cashtag'] = this.cashtag;
    data['email'] = this.email;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}