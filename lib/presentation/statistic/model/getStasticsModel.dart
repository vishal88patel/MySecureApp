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
  dynamic totalIncome;
  dynamic totalExpense;
  dynamic lastDaysExpenses;
  dynamic lastDaysIncome;
  dynamic bankAdd;
  dynamic cardAdd;
  MonthlyData? monthlyData;
  List<WeeklyData>? weeklyData;

  Statistic(
      {this.totalIncome,
        this.totalExpense,
        this.lastDaysExpenses,
        this.lastDaysIncome,
        this.bankAdd,
        this.cardAdd,
        this.monthlyData,
        this.weeklyData});

  Statistic.fromJson(Map<String, dynamic> json) {
    totalIncome = json['totalIncome'];
    totalExpense = json['totalExpense'];
    lastDaysExpenses = json['lastDaysExpenses'];
    lastDaysIncome = json['lastDaysIncome'];
    bankAdd = json['bankAdd'];
    cardAdd = json['cardAdd'];
    monthlyData = json['monthlyData'] != null
        ? new MonthlyData.fromJson(json['monthlyData'])
        : null;
    if (json['weeklyData'] != null) {
      weeklyData = <WeeklyData>[];
      json['weeklyData'].forEach((v) {
        weeklyData!.add(new WeeklyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalIncome'] = this.totalIncome;
    data['totalExpense'] = this.totalExpense;
    data['lastDaysExpenses'] = this.lastDaysExpenses;
    data['lastDaysIncome'] = this.lastDaysIncome;
    data['bankAdd'] = this.bankAdd;
    data['cardAdd'] = this.cardAdd;
    if (this.monthlyData != null) {
      data['monthlyData'] = this.monthlyData!.toJson();
    }
    if (this.weeklyData != null) {
      data['weeklyData'] = this.weeklyData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyData {
  Week1? week1;
  Week1? week2;
  Week1? week3;
  Week1? week4;

  MonthlyData({this.week1, this.week2, this.week3, this.week4});

  MonthlyData.fromJson(Map<String, dynamic> json) {
    week1 = json['week1'] != null ? new Week1.fromJson(json['week1']) : null;
    week2 = json['week2'] != null ? new Week1.fromJson(json['week2']) : null;
    week3 = json['week3'] != null ? new Week1.fromJson(json['week3']) : null;
    week4 = json['week4'] != null ? new Week1.fromJson(json['week4']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.week1 != null) {
      data['week1'] = this.week1!.toJson();
    }
    if (this.week2 != null) {
      data['week2'] = this.week2!.toJson();
    }
    if (this.week3 != null) {
      data['week3'] = this.week3!.toJson();
    }
    if (this.week4 != null) {
      data['week4'] = this.week4!.toJson();
    }
    return data;
  }
}

class Week1 {
  String? income;
  String? expens;
  String? duration;

  Week1({this.income, this.expens, this.duration});

  Week1.fromJson(Map<String, dynamic> json) {
    income = json['income'];
    expens = json['expens'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['income'] = this.income;
    data['expens'] = this.expens;
    data['duration'] = this.duration;
    return data;
  }
}

class WeeklyData {
  String? id;
  String? date;
  dynamic total;
  dynamic income;
  dynamic expens;

  WeeklyData({this.id, this.date, this.total, this.income, this.expens});

  WeeklyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    total = json['total'];
    income = json['income'];
    expens = json['expens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['total'] = this.total;
    data['income'] = this.income;
    data['expens'] = this.expens;
    return data;
  }
}
