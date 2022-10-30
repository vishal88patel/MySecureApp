class GetWallet {
  bool? status;
  String? message;
  Data? data;

  GetWallet({this.status, this.message, this.data});

  GetWallet.fromJson(Map<String, dynamic> json) {
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
  int? isPin;
  int? perPage;
  int? currentPage;
  int? lastPage;
  String? walletBalance;
  Null? uuid;
  List<UserTransaction>? userTransaction;

  Data(
      {this.total,
        this.isPin,
        this.perPage,
        this.currentPage,
        this.lastPage,
        this.walletBalance,
        this.uuid,
        this.userTransaction});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    isPin = json['is_pin'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    walletBalance = json['wallet_balance'];
    uuid = json['uuid'];
    if (json['userTransaction'] != null) {
      userTransaction = <UserTransaction>[];
      json['userTransaction'].forEach((v) {
        userTransaction!.add(new UserTransaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['is_pin'] = this.isPin;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['lastPage'] = this.lastPage;
    data['wallet_balance'] = this.walletBalance;
    data['uuid'] = this.uuid;
    if (this.userTransaction != null) {
      data['userTransaction'] =
          this.userTransaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserTransaction {
  int? id;
  String? amount;
  String? notes;
  int? createdAt;
  String? status;

  UserTransaction(
      {this.id, this.amount, this.notes, this.createdAt, this.status});

  UserTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    notes = json['notes'];
    createdAt = json['created_At'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['notes'] = this.notes;
    data['created_At'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}
