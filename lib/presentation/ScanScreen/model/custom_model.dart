class CustomModel {
  RequestUser? requestUser;
  String? amount;

  CustomModel({this.requestUser, this.amount});

  CustomModel.fromJson(Map<String, dynamic> json) {
    requestUser = json['requestUser'] != null
        ? new RequestUser.fromJson(json['requestUser'])
        : null;
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requestUser != null) {
      data['requestUser'] = this.requestUser!.toJson();
    }
    data['amount'] = this.amount;
    return data;
  }
}

class RequestUser {
  int? id;
  String? firstName;
  String? lastName;
  String? uuid;
  String? cashtag;
  String? email;
  String? profilePhotoPath;
  String? fcmToken;

  RequestUser(
      {this.id,
        this.firstName,
        this.lastName,
        this.uuid,
        this.cashtag,
        this.email,
        this.profilePhotoPath,
        this.fcmToken});

  RequestUser.fromJson(Map<String, dynamic> json) {
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
