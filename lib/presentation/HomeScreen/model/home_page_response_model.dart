class HomePageResponseModel {
  bool? status;
  String? message;
  Data? data;

  HomePageResponseModel({this.status, this.message, this.data});

  HomePageResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? homeImage1;
  String? homeImage2;
  String? homeImage3;

  Data({this.homeImage1, this.homeImage2, this.homeImage3});

  Data.fromJson(Map<String, dynamic> json) {
    homeImage1 = json['home_image_1'];
    homeImage2 = json['home_image_2'];
    homeImage3 = json['home_image_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home_image_1'] = this.homeImage1;
    data['home_image_2'] = this.homeImage2;
    data['home_image_3'] = this.homeImage3;
    return data;
  }
}
