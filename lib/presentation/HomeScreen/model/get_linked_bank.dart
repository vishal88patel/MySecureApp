class GrtLinkedBank {
  bool? status;
  String? message;
  List<Data>? data;

  GrtLinkedBank({this.status, this.message, this.data});

  GrtLinkedBank.fromJson(Map<String, dynamic> json) {
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
  String? bankName;
  String? bankImage;
  String? accountNumber;
  int? accountBalance;

  Data(
      {this.id,
        this.bankName,
        this.bankImage,
        this.accountNumber,
        this.accountBalance});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bankName'];
    bankImage = json['bank_image'];
    accountNumber = json['accountNumber'];
    accountBalance = json['accountBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankName'] = this.bankName;
    data['bank_image'] = this.bankImage;
    data['accountNumber'] = this.accountNumber;
    data['accountBalance'] = this.accountBalance;
    return data;
  }
}
