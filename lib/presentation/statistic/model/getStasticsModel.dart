class GetStasticsModel {
  bool? status;
  String? message;
  Data? data;

  GetStasticsModel({this.status, this.message, this.data});

  GetStasticsModel.fromJson(Map<String, dynamic> json) {
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
  List<UserTransaction>? userTransaction;
  Statistic? statistic;

  Data(
      {this.total,
        this.perPage,
        this.currentPage,
        this.lastPage,
        this.userTransaction,
        this.statistic});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    if (json['userTransaction'] != null) {
      userTransaction = <UserTransaction>[];
      json['userTransaction'].forEach((v) {
        userTransaction!.add(new UserTransaction.fromJson(v));
      });
    }
    statistic = json['statistic'] != null
        ? new Statistic.fromJson(json['statistic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['lastPage'] = this.lastPage;
    if (this.userTransaction != null) {
      data['userTransaction'] =
          this.userTransaction!.map((v) => v.toJson()).toList();
    }
    if (this.statistic != null) {
      data['statistic'] = this.statistic!.toJson();
    }
    return data;
  }
}

class UserTransaction {
  int? id;
  String? amount;
  String? notes;
  String? createdAt;
  String? status;
  String? transactionStatus;

  UserTransaction(
      {this.id,
        this.amount,
        this.notes,
        this.createdAt,
        this.status,
        this.transactionStatus});

  UserTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    notes = json['notes'];
    createdAt = json['created_At'];
    status = json['status'];
    transactionStatus = json['transactionStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['notes'] = this.notes;
    data['created_At'] = this.createdAt;
    data['status'] = this.status;
    data['transactionStatus'] = this.transactionStatus;
    return data;
  }
}

class Statistic {
  String? totalIncome;
  int? totalExpense;
  String? lastDaysExpenses;
  int? lastDaysIncome;
  int? bankAdd;
  int? cardAdd;

  Statistic(
      {this.totalIncome,
        this.totalExpense,
        this.lastDaysExpenses,
        this.lastDaysIncome,
        this.bankAdd,
        this.cardAdd});

  Statistic.fromJson(Map<String, dynamic> json) {
    totalIncome = json['totalIncome'];
    totalExpense = json['totalExpense'];
    lastDaysExpenses = json['lastDaysExpenses'];
    lastDaysIncome = json['lastDaysIncome'];
    bankAdd = json['bankAdd'];
    cardAdd = json['cardAdd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalIncome'] = this.totalIncome;
    data['totalExpense'] = this.totalExpense;
    data['lastDaysExpenses'] = this.lastDaysExpenses;
    data['lastDaysIncome'] = this.lastDaysIncome;
    data['bankAdd'] = this.bankAdd;
    data['cardAdd'] = this.cardAdd;
    return data;
  }
}