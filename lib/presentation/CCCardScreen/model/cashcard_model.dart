class CashCardModel {
  bool? status;
  String? message;
  Data? data;

  CashCardModel({this.status, this.message, this.data});

  CashCardModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? userId;
  String? cardNumber;
  String? cvv;
  String? expYear;
  String? expMonth;
  String? type;
  String? color;
  String? address;
  String? status;
  String? isLock;
  String? pin;
  String? cardFrontImage;
  String? cardBackImage;
  String? orderDate;
  String? activeDate;
  String? createdAt;
  String? updatedAt;
  String? order_status;

  Data(
      {this.id,
        this.userId,
        this.cardNumber,
        this.cvv,
        this.expYear,
        this.expMonth,
        this.type,
        this.color,
        this.address,
        this.status,
        this.isLock,
        this.pin,
        this.cardFrontImage,
        this.cardBackImage,
        this.orderDate,
        this.activeDate,
        this.createdAt,
        this.updatedAt,
        this.order_status,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cardNumber = json['card_number'];
    cvv = json['cvv'];
    expYear = json['exp_year'];
    expMonth = json['exp_month'];
    type = json['type'];
    color = json['color'];
    address = json['address'];
    status = json['status'];
    isLock = json['is_lock'];
    pin = json['pin'];
    cardFrontImage = json['card_front_image'];
    cardBackImage = json['card_back_image'];
    orderDate = json['order_date'];
    activeDate = json['active_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order_status = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['card_number'] = this.cardNumber;
    data['cvv'] = this.cvv;
    data['exp_year'] = this.expYear;
    data['exp_month'] = this.expMonth;
    data['type'] = this.type;
    data['color'] = this.color;
    data['address'] = this.address;
    data['status'] = this.status;
    data['is_lock'] = this.isLock;
    data['pin'] = this.pin;
    data['card_front_image'] = this.cardFrontImage;
    data['card_back_image'] = this.cardBackImage;
    data['order_date'] = this.orderDate;
    data['active_date'] = this.activeDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_status'] = this.order_status;
    return data;
  }
}
