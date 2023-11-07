class DoctorDataModel {
  bool? success;
  List<Data>? data;
  String? message;

  DoctorDataModel({this.success, this.data, this.message});

  DoctorDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id; // Change from double? to int?
  Name? name;
  int? eProviderTypeId;
  Name? description;
  String? phoneNumber;
  String? mobileNumber;
  double? availabilityRange; // You may keep this as double?
  bool? available;
  bool? featured;
  bool? accepted;
  List<dynamic>? customFields;
  bool? hasMedia;
  double? rate; // You may keep this as double?
  int? totalReviews; // Change from double? to int?
  dynamic hasValidSubscription;
  List<AvailabilityHours>? availabilityHours;
  List<dynamic>? media;

  Data({
    this.id,
    this.name,
    this.eProviderTypeId,
    this.description,
    this.phoneNumber,
    this.mobileNumber,
    this.availabilityRange,
    this.available,
    this.featured,
    this.accepted,
    this.customFields,
    this.hasMedia,
    this.rate,
    this.totalReviews,
    this.hasValidSubscription,
    this.availabilityHours,
    this.media,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt(); // Convert to int
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    eProviderTypeId = json['e_provider_type_id']?.toInt(); // Convert to int
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    phoneNumber = json['phone_number'];
    mobileNumber = json['mobile_number'];
    availabilityRange = json['availability_range']?.toDouble(); // Convert to double
    available = json['available'];
    featured = json['featured'];
    accepted = json['accepted'];
    customFields = json['custom_fields'];
    hasMedia = json['has_media'];
    rate = json['rate']?.toDouble(); // Convert to double
    totalReviews = json['total_reviews']?.toInt(); // Convert to int
    hasValidSubscription = json['has_valid_subscription'];
    if (json['availability_hours'] != null) {
      availabilityHours = <AvailabilityHours>[];
      json['availability_hours'].forEach((v) {
        availabilityHours!.add(AvailabilityHours.fromJson(v));
      });
    }
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['e_provider_type_id'] = this.eProviderTypeId;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['phone_number'] = this.phoneNumber;
    data['mobile_number'] = this.mobileNumber;
    data['availability_range'] = this.availabilityRange;
    data['available'] = this.available;
    data['featured'] = this.featured;
    data['accepted'] = this.accepted;
    data['custom_fields'] = this.customFields;
    data['has_media'] = this.hasMedia;
    data['rate'] = this.rate;
    data['total_reviews'] = this.totalReviews;
    data['has_valid_subscription'] = this.hasValidSubscription;
    if (this.availabilityHours != null) {
     

      data['availability_hours'] =
          this.availabilityHours!.map((v) => v.toJson()).toList();
    }
    data['media'] = this.media;
    return data;
  }
}

class Name {
  String? en;

  Name({this.en});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}

class AvailabilityHours {
  int? id;
  String? day;
  String? startAt;
  String? endAt;
  Name? data;
  int? eProviderId;
  List<dynamic>? customFields; // Change Null to dynamic or the actual data type

  AvailabilityHours({
    this.id,
    this.day,
    this.startAt,
    this.endAt,
    this.data,
    this.eProviderId,
    this.customFields,
  });

  AvailabilityHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    data = json['data'] != null ? Name.fromJson(json['data']) : null;
    eProviderId = json['e_provider_id'];
    customFields = json['custom_fields'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['eProvider_id'] = this.eProviderId;
    data['custom_fields'] = this.customFields;
    return data;
  }
}
