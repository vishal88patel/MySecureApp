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
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? profilePhotoPath;
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
  String? balance;
  String? uuid;
  String? deviceId;
  String? fcmToken;
  String? devicyType;
  String? pin;
  String? deletedAt;
  String? middleName;
  String? licenceFront;
  String? licenceBack;
  String? licenceJson;
  String? loanBalance;
  String? isEmailVerify;
  String? isMobileVerify;
  dynamic? otp;
  String? passportImage;
  String? selfiWithDocument;
  String? kycStatus;
  String? kycType;
  String? cashtag;
  String? isKycNotify;
  String? cardNumber;
  String? cvv;
  String? expiredAt;
  String? cardType;
  String? routeNumber;
  int? isKyc;
  int? isCashCard;
  String? privacyPolicy;
  String? token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
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
        this.balance,
        this.uuid,
        this.deviceId,
        this.fcmToken,
        this.devicyType,
        this.pin,
        this.deletedAt,
        this.middleName,
        this.licenceFront,
        this.licenceBack,
        this.licenceJson,
        this.loanBalance,
        this.isEmailVerify,
        this.isMobileVerify,
        this.otp,
        this.passportImage,
        this.selfiWithDocument,
        this.kycStatus,
        this.kycType,
        this.cashtag,
        this.isKycNotify,
        this.cardNumber,
        this.cvv,
        this.expiredAt,
        this.cardType,
        this.routeNumber,
        this.isKyc,
        this.isCashCard,
        this.privacyPolicy,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mobile = json['mobile'];
    address1 = json['address1'];
    address2 = json['address2']??"";
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
    balance = json['balance'];
    uuid = json['uuid'];
    deviceId = json['device_id'];
    fcmToken = json['fcm_token'];
    devicyType = json['devicy_type'];
    pin = json['pin'];
    deletedAt = json['deleted_at'];
    middleName = json['middle_name'];
    licenceFront = json['licence_front'];
    licenceBack = json['licence_back'];
    licenceJson = json['licence_json'];
    loanBalance = json['loan_balance'];
    isEmailVerify = json['is_email_verify'];
    isMobileVerify = json['is_mobile_verify'];
    otp = json['otp'];
    passportImage = json['passport_image'];
    selfiWithDocument = json['selfi_with_document'];
    kycStatus = json['kyc_status'];
    kycType = json['kyc_type'];
    cashtag = json['cashtag'];
    isKycNotify = json['is_kyc_notify'];
    cardNumber = json['card_number'];
    cvv = json['cvv'];
    expiredAt = json['expired_at'];
    cardType = json['card_Type'];
    routeNumber = json['route_number'];
    isCashCard = json['is_cash_card'];
    privacyPolicy = json['privacyPolicy'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
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
    data['balance'] = this.balance;
    data['uuid'] = this.uuid;
    data['device_id'] = this.deviceId;
    data['fcm_token'] = this.fcmToken;
    data['devicy_type'] = this.devicyType;
    data['pin'] = this.pin;
    data['deleted_at'] = this.deletedAt;
    data['middle_name'] = this.middleName;
    data['licence_front'] = this.licenceFront;
    data['licence_back'] = this.licenceBack;
    data['licence_json'] = this.licenceJson;
    data['loan_balance'] = this.loanBalance;
    data['is_email_verify'] = this.isEmailVerify;
    data['is_mobile_verify'] = this.isMobileVerify;
    data['otp'] = this.otp;
    data['passport_image'] = this.passportImage;
    data['selfi_with_document'] = this.selfiWithDocument;
    data['kyc_status'] = this.kycStatus;
    data['kyc_type'] = this.kycType;
    data['cashtag'] = this.cashtag;
    data['is_kyc_notify'] = this.isKycNotify;
    data['card_number'] = this.cardNumber;
    data['cvv'] = this.cvv;
    data['expired_at'] = this.expiredAt;
    data['card_Type'] = this.cardType;
    data['route_number'] = this.routeNumber;
    data['is_kyc'] = this.isKyc;
    data['is_cash_card'] = this.isCashCard;
    data['privacyPolicy'] = this.privacyPolicy;
    data['token'] = this.token;
    return data;
  }
}
