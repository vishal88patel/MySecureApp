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
  String? bannerImage;
  List<String>? topOffer;

  Data({this.bannerImage, this.topOffer});

  Data.fromJson(Map<String, dynamic> json) {
    bannerImage = json['bannerImage'];
    topOffer = json['topOffer'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerImage'] = this.bannerImage;
    data['topOffer'] = this.topOffer;
    return data;
  }
}
