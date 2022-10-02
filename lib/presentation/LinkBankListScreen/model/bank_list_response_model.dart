class BankListResponseModel {
  bool? status;
  String? message;
  BankModel? data;

  BankListResponseModel({this.status, this.message, this.data});

  BankListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new BankModel.fromJson(json['data']) : null;
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

class BankModel {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  List<Banks>? banks;

  BankModel({this.total, this.perPage, this.currentPage, this.lastPage, this.banks});

  BankModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    if (json['banks'] != null) {
      banks = <Banks>[];
      json['banks'].forEach((v) {
        banks!.add(new Banks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['lastPage'] = this.lastPage;
    if (this.banks != null) {
      data['banks'] = this.banks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banks {
  int? id;
  String? name;
  String? bankUrl;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Banks(
      {this.id,
        this.name,
        this.bankUrl,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Banks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bankUrl = json['bank_url'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bank_url'] = this.bankUrl;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
