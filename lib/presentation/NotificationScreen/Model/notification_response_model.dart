class NotificationResponseModel {
  bool? status;
  String? message;
  List<NotiData>? data;

  NotificationResponseModel({this.status, this.message, this.data});

  NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NotiData>[];
      json['data'].forEach((v) {
        data!.add(new NotiData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotiData {
  int? id;
  String? title;
  String? description;
  String? type;
  String? data;
  String? userId;
  String? createdAt;
  String? updatedAt;

  NotiData(
      {this.id,
        this.title,
        this.description,
        this.type,
        this.data,
        this.userId,
        this.createdAt,
        this.updatedAt});

  NotiData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    data = json['data'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['data'] = this.data;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
