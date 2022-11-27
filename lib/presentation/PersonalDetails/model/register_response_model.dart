class RegisterResponseModel {
  bool? status;
  String? message;
  Data? data;

  RegisterResponseModel({this.status, this.message, this.data});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? firstName;
  String? lastName;
  String? loanType;
  String? email;
  Null? mobile;
  String? city;
  String? address2;
  String? address1;
  String? zipCode;
  String? state;
  String? ssn;
  String? dateOfBirth;
  String? jobTitle;
  String? annualIncome;
  String? purpouseOfOpeningAccount;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;
  String? profilePhotoUrl;

  Data(
      {this.name,
        this.firstName,
        this.lastName,
        this.loanType,
        this.email,
        this.mobile,
        this.city,
        this.address2,
        this.address1,
        this.zipCode,
        this.state,
        this.ssn,
        this.dateOfBirth,
        this.jobTitle,
        this.annualIncome,
        this.purpouseOfOpeningAccount,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token,
        this.profilePhotoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    loanType = json['loan_type'];
    email = json['email'];
    mobile = json['mobile'];
    city = json['city'];
    address2 = json['address2'];
    address1 = json['address1'];
    zipCode = json['zip_code'];
    state = json['state'];
    ssn = json['ssn'];
    dateOfBirth = json['date_of_birth'];
    jobTitle = json['job_title'];
    annualIncome = json['annual_income'];
    purpouseOfOpeningAccount = json['purpouse_of_opening_account'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['loan_type'] = this.loanType;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['city'] = this.city;
    data['address2'] = this.address2;
    data['address1'] = this.address1;
    data['zip_code'] = this.zipCode;
    data['state'] = this.state;
    data['ssn'] = this.ssn;
    data['date_of_birth'] = this.dateOfBirth;
    data['job_title'] = this.jobTitle;
    data['annual_income'] = this.annualIncome;
    data['purpouse_of_opening_account'] = this.purpouseOfOpeningAccount;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['token'] = this.token;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
