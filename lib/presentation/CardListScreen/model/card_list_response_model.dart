class CardListResponseModel {
  bool? status;
  String? message;
  List<Data>? data;

  CardListResponseModel({this.status, this.message, this.data});

  CardListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? holderName;
  String? cardNumber;
  String? expireYear;
  String? expireMonth;
  String? cvv;
  String? cardType;
  String? addedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Data(
      {this.id,
        this.holderName,
        this.cardNumber,
        this.expireYear,
        this.expireMonth,
        this.cvv,
        this.cardType,
        this.addedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    holderName = json['holder_name'];
    cardNumber = json['card_number'];
    expireYear = json['expire_year'];
    expireMonth = json['expire_month'];
    cvv = json['cvv'];
    cardType = json['card_type'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['holder_name'] = this.holderName;
    data['card_number'] = this.cardNumber;
    data['expire_year'] = this.expireYear;
    data['expire_month'] = this.expireMonth;
    data['cvv'] = this.cvv;
    data['card_type'] = this.cardType;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
