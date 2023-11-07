class SignInModel {
  bool? success;
  Data? data;
  String? message;

  SignInModel({this.success, this.data, this.message});

  SignInModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phoneNumber; // Define these fields as String
  String? phoneVerifiedAt;
  String? emailVerifiedAt;
  String? apiToken;
  String? deviceToken;
  String? stripeId;
  String? cardBrand;
  String? cardLastFour;
  String? trialEndsAt;
  String? paypalEmail;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.phoneVerifiedAt,
    this.emailVerifiedAt,
    this.apiToken,
    this.deviceToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    this.paypalEmail,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'] ?? ''; // Handle possible null values
    phoneVerifiedAt = json['phone_verified_at'] ?? '';
    emailVerifiedAt = json['email_verified_at'] ?? '';
    apiToken = json['api_token'];
    deviceToken = json['device_token'];
    stripeId = json['stripe_id'] ?? '';
    cardBrand = json['card_brand'] ?? '';
    cardLastFour = json['card_last_four'] ?? '';
    trialEndsAt = json['trial_ends_at'] ?? '';
    paypalEmail = json['paypal_email'] ?? '';
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['email_verified_at'] = emailVerifiedAt;
    data['api_token'] = apiToken;
    data['device_token'] = deviceToken;
    data['stripe_id'] = stripeId;
    data['card_brand'] = cardBrand;
    data['card_last_four'] = cardLastFour;
    data['trial_ends_at'] = trialEndsAt;
    data['paypal_email'] = paypalEmail;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
