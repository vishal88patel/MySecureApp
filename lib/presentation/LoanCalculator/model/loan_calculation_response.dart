class LoanCalculationResponseModel {
  bool? status;
  String? message;
  Data? data;

  LoanCalculationResponseModel({this.status, this.message, this.data});

  LoanCalculationResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? loanAmount;
  int? intrestRate;
  String? month;
  String? paybleAmount;
  String? monthlyEMI;
  String? emiNumber;
  String? eMINumber;

  Data(
      {this.loanAmount,
        this.intrestRate,
        this.month,
        this.paybleAmount,
        this.monthlyEMI,
        this.emiNumber,
        this.eMINumber});

  Data.fromJson(Map<String, dynamic> json) {
    loanAmount = json['loanAmount'];
    intrestRate = json['intrestRate'];
    month = json['month'];
    paybleAmount = json['paybleAmount'];
    monthlyEMI = json['monthlyEMI'];
    emiNumber = json['emiNumber'];
    eMINumber = json['EMINumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loanAmount'] = this.loanAmount;
    data['intrestRate'] = this.intrestRate;
    data['month'] = this.month;
    data['paybleAmount'] = this.paybleAmount;
    data['monthlyEMI'] = this.monthlyEMI;
    data['emiNumber'] = this.emiNumber;
    data['EMINumber'] = this.eMINumber;
    return data;
  }
}
