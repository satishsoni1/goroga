class UserDetailsModel {
  bool? success;
  Data? data;
  String? message;

  UserDetailsModel({this.success, this.data, this.message});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? phoneVerifiedAt;
  dynamic emailVerifiedAt;
  String? apiToken;
  String? deviceToken;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic trialEndsAt;
  dynamic paypalEmail;
  String? createdAt;
  String? updatedAt;
  dynamic customFields;
  bool? hasMedia;
  List<dynamic>? roles;
  List<dynamic>? media;

  Data(
      {this.id,
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
      this.customFields,
      this.hasMedia,
      this.roles,
      this.media});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    phoneVerifiedAt = json['phone_verified_at'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    deviceToken = json['device_token'];
    stripeId = json['stripe_id'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    paypalEmail = json['paypal_email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customFields = json['custom_fields'];
    hasMedia = json['has_media'];
   
      roles = 
      json['roles'];
   
      media = 
      json['media'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['api_token'] = this.apiToken;
    data['device_token'] = this.deviceToken;
    data['stripe_id'] = this.stripeId;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['paypal_email'] = this.paypalEmail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customFields != null) {
      data['custom_fields'] = this.customFields!.toJson();
    }
    data['has_media'] = this.hasMedia;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomFields {
  Bio? bio;
  Address? address;

  CustomFields({this.bio, this.address});

  CustomFields.fromJson(Map<String, dynamic> json) {
    bio = json['bio'] != null ? new Bio.fromJson(json['bio']) : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bio != null) {
      data['bio'] = this.bio!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Bio {
  Null value;
  String? view;
  String? name;

  Bio({this.value, this.view, this.name});

  Bio.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    view = json['view'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['view'] = this.view;
    data['name'] = this.name;
    return data;
  }
}

class Address {
  Null value;
  Null view;
  String? name;

  Address({this.value, this.view, this.name});

  Address.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    view = json['view'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['view'] = this.view;
    data['name'] = this.name;
    return data;
  }
}