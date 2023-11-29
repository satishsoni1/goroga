class PaymentModel {
  bool? success;
  List<Data>? data;
  String? message;

  PaymentModel({this.success, this.data, this.message});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
  int? id;
  Name? name;
  dynamic price;
  dynamic discountPrice;
  String? priceUnit;
  dynamic quantityUnit;
  String? duration;
  Name? description;
  bool? featured;
  bool? enableBooking;
  bool? available;
  int? eProviderId;
  List<dynamic>? customFields;
  bool? hasMedia;
  dynamic totalReviews;
  bool? isFavorite;
  dynamic rate;
  EProvider? eProvider;
  List<dynamic>? media;

  Data(
      {this.id,
      this.name,
      this.price,
      this.discountPrice,
      this.priceUnit,
      this.quantityUnit,
      this.duration,
      this.description,
      this.featured,
      this.enableBooking,
      this.available,
      this.eProviderId,
      this.customFields,
      this.hasMedia,
      this.totalReviews,
      this.isFavorite,
      this.rate,
      this.eProvider,
      this.media});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    price = json['price'];
    discountPrice = json['discount_price'];
    priceUnit = json['price_unit'];
    quantityUnit = json['quantity_unit'];
    duration = json['duration'];
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    featured = json['featured'];
    enableBooking = json['enable_booking'];
    available = json['available'];
    eProviderId = json['e_provider_id'];
    if (json['custom_fields'] != null) {
      customFields = json['custom_fields'];
    }
    hasMedia = json['has_media'];
    totalReviews = json['total_reviews'];
    isFavorite = json['is_favorite'];
    rate = json['rate'];
    eProvider = json['e_provider'] != null
        ? new EProvider.fromJson(json['e_provider'])
        : null;

    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['price_unit'] = this.priceUnit;
    data['quantity_unit'] = this.quantityUnit;
    data['duration'] = this.duration;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['featured'] = this.featured;
    data['enable_booking'] = this.enableBooking;
    data['available'] = this.available;
    data['e_provider_id'] = this.eProviderId;
    if (this.customFields != null) {
      data['custom_fields'] =
          this.customFields!.map((v) => v.toJson()).toList();
    }
    data['has_media'] = this.hasMedia;
    data['total_reviews'] = this.totalReviews;
    data['is_favorite'] = this.isFavorite;
    data['rate'] = this.rate;
    if (this.eProvider != null) {
      data['e_provider'] = this.eProvider!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
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

class EProvider {
  int? id;
  Name? name;
  int? eProviderTypeId;
  Name? description;
  String? phoneNumber;
  String? mobileNumber;
  dynamic availabilityRange;
  bool? available;
  bool? featured;
  bool? accepted;
  List<dynamic>? customFields;
  bool? hasMedia;
  dynamic rate;
  dynamic totalReviews;
  dynamic hasValidSubscription;
  List<AvailabilityHours>? availabilityHours;
  List<dynamic>? media;

  EProvider(
      {this.id,
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
      this.media});

  EProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    eProviderTypeId = json['e_provider_type_id'];
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    phoneNumber = json['phone_number'];
    mobileNumber = json['mobile_number'];
    availabilityRange = json['availability_range'];
    available = json['available'];
    featured = json['featured'];
    accepted = json['accepted'];
    if (json['custom_fields'] != null) {
      customFields = json['custom_fields'];
    }
    hasMedia = json['has_media'];
    rate = json['rate'];
    totalReviews = json['total_reviews'];
    hasValidSubscription = json['has_valid_subscription'];
    if (json['availability_hours'] != null) {
      availabilityHours = <AvailabilityHours>[];
      json['availability_hours'].forEach((v) {
        availabilityHours!.add(new AvailabilityHours.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = json['media'];
    }
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
    if (this.customFields != null) {
      data['custom_fields'] =
          this.customFields!.map((v) => v.toJson()).toList();
    }
    data['has_media'] = this.hasMedia;
    data['rate'] = this.rate;
    data['total_reviews'] = this.totalReviews;
    data['has_valid_subscription'] = this.hasValidSubscription;
    if (this.availabilityHours != null) {
      data['availability_hours'] =
          this.availabilityHours!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
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
  List<dynamic>? customFields;

  AvailabilityHours(
      {this.id,
      this.day,
      this.startAt,
      this.endAt,
      this.data,
      this.eProviderId,
      this.customFields});

  AvailabilityHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    data = json['data'] != null ? new Name.fromJson(json['data']) : null;
    eProviderId = json['e_provider_id'];
    if (json['custom_fields'] != null) {
      customFields = json['custom_fields'];
    }
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
    data['e_provider_id'] = this.eProviderId;
    if (this.customFields != null) {
      data['custom_fields'] =
          this.customFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
