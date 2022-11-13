class LoginResponseModel {
  bool? status;
  String? message;
  Data? data;

  LoginResponseModel({this.status, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? is_kyc;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? twoFactorConfirmedAt;
  Null? currentTeamId;
  Null? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? mobile;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zipCode;
  String? ssn;
  String? jobTitle;
  String? annualIncome;
  String? purpouseOfOpeningAccount;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? loanType;
  String? token;
  String? profilePhotoUrl;

  Data(
      {this.id,
        this.is_kyc,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.twoFactorConfirmedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.mobile,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.zipCode,
        this.ssn,
        this.jobTitle,
        this.annualIncome,
        this.purpouseOfOpeningAccount,
        this.firstName,
        this.lastName,
        this.dateOfBirth,
        this.loanType,
        this.token,
        this.profilePhotoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    is_kyc = json['is_kyc'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mobile = json['mobile'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    ssn = json['ssn'];
    jobTitle = json['job_title'];
    annualIncome = json['annual_income'];
    purpouseOfOpeningAccount = json['purpouse_of_opening_account'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dateOfBirth = json['date_of_birth'];
    loanType = json['loan_type'];
    token = json['token'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_kyc'] = this.is_kyc;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['mobile'] = this.mobile;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['ssn'] = this.ssn;
    data['job_title'] = this.jobTitle;
    data['annual_income'] = this.annualIncome;
    data['purpouse_of_opening_account'] = this.purpouseOfOpeningAccount;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['date_of_birth'] = this.dateOfBirth;
    data['loan_type'] = this.loanType;
    data['token'] = this.token;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
