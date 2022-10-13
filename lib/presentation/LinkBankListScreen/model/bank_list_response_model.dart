class BankListResponseModel {
  bool? status;
  String? message;
  Data? data;

  BankListResponseModel({this.status, this.message, this.data});

  BankListResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? bankStript;
  int? perPage;
  int? currentPage;
  int? lastPage;
  List<Banks>? banks;

  Data(
      {this.total,
        this.bankStript,
        this.perPage,
        this.currentPage,
        this.lastPage,
        this.banks});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    bankStript = json['bankStript'];
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
    data['bankStript'] = this.bankStript;
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
  Null? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? pageScript;

  Banks(
      {this.id,
        this.name,
        this.bankUrl,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.pageScript});

  Banks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bankUrl = json['bank_url'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pageScript = json['page_script'];
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
    data['page_script'] = this.pageScript;
    return data;
  }
}
