class GetStatusAndIncomeResponseModel {
  bool? status;
  String? message;
  Data? data;

  GetStatusAndIncomeResponseModel({this.status, this.message, this.data});

  GetStatusAndIncomeResponseModel.fromJson(Map<String, dynamic> json) {
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
  EmployeementStatus? employeementStatus;
  AnualIncome? anualIncome;

  Data({this.employeementStatus, this.anualIncome});

  Data.fromJson(Map<String, dynamic> json) {
    employeementStatus = json['employeementStatus'] != null
        ? new EmployeementStatus.fromJson(json['employeementStatus'])
        : null;
    anualIncome = json['anualIncome'] != null
        ? new AnualIncome.fromJson(json['anualIncome'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeementStatus != null) {
      data['employeementStatus'] = this.employeementStatus!.toJson();
    }
    if (this.anualIncome != null) {
      data['anualIncome'] = this.anualIncome!.toJson();
    }
    return data;
  }
}

class EmployeementStatus {
  String? s1;
  String? s2;
  String? s3;
  String? s4;

  EmployeementStatus({this.s1, this.s2, this.s3, this.s4});

  EmployeementStatus.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    return data;
  }
}

class AnualIncome {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;

  AnualIncome({this.s1, this.s2, this.s3, this.s4, this.s5});

  AnualIncome.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    return data;
  }
}
