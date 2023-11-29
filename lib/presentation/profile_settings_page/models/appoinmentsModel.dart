class AppointmentsModel {
  bool? success;
  List<Data>? data;
  String? message;

  AppointmentsModel({this.success, this.data, this.message});

  factory AppointmentsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentsModel(
      success: json['success'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'success': success,
      'message': message,
    };
    if (this.data != null) {
      data['data'] = this.data!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  EProvider? eProvider;
  EService? eService;
  List<dynamic>? options;
  int? quantity;
  int? userId;
  int? bookingStatusId;
  Address? address;
  dynamic paymentId;
  Coupon? coupon;
  List<dynamic>? taxes;
  dynamic bookingAt;
  dynamic startAt;
  dynamic endsAt;
  dynamic hint;
  bool? cancel;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? customFields;
  dynamic duration;

  Data({
    this.id,
    this.eProvider,
    this.eService,
    this.options,
    this.quantity,
    this.userId,
    this.bookingStatusId,
    this.address,
    this.paymentId,
    this.coupon,
    this.taxes,
    this.bookingAt,
    this.startAt,
    this.endsAt,
    this.hint,
    this.cancel,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.duration,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      eProvider: json['e_provider'] != null
          ? EProvider.fromJson(json['e_provider'] as Map<String, dynamic>)
          : null,
      eService: json['e_service'] != null
          ? EService.fromJson(json['e_service'] as Map<String, dynamic>)
          : null,
      options: (json['options'] as List<dynamic>?),
      quantity: json['quantity'],
      userId: json['user_id'],
      bookingStatusId: json['booking_status_id'],
      address: json['address'] != null
          ? Address.fromJson(json['address'] as Map<String, dynamic>)
          : null,
      paymentId: json['payment_id'],
      coupon: json['coupon'] != null
          ? Coupon.fromJson(json['coupon'] as Map<String, dynamic>)
          : null,
      taxes: (json['taxes'] as List<dynamic>?),
      bookingAt: json['booking_at'],
      startAt: json['start_at'],
      endsAt: json['ends_at'],
      hint: json['hint'],
      cancel: json['cancel'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      customFields: (json['custom_fields'] as List<dynamic>?),
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'quantity': quantity,
      'user_id': userId,
      'booking_status_id': bookingStatusId,
      'payment_id': paymentId,
      'booking_at': bookingAt,
      'start_at': startAt,
      'ends_at': endsAt,
      'hint': hint,
      'cancel': cancel,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'duration': duration,
    };
    if (eProvider != null) {
      data['e_provider'] = eProvider!.toJson();
    }
    if (eService != null) {
      data['e_service'] = eService!.toJson();
    }
    if (options != null) {
      data['options'] = options;
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (taxes != null) {
      data['taxes'] = taxes;
    }
    if (customFields != null) {
      data['custom_fields'] = customFields;
    }
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
  int? totalReviews;
  dynamic hasValidSubscription;
  List<AvailabilityHours>? availabilityHours;
  List<dynamic>? media;

  EProvider({
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

  factory EProvider.fromJson(Map<String, dynamic> json) {
    return EProvider(
      id: json['id'],
      name: json['name'] != null
          ? Name.fromJson(json['name'] as Map<String, dynamic>)
          : null,
      eProviderTypeId: json['e_provider_type_id'],
      description: json['description'] != null
          ? Name.fromJson(json['description'] as Map<String, dynamic>)
          : null,
      phoneNumber: json['phone_number'],
      mobileNumber: json['mobile_number'],
      availabilityRange: json['availability_range'],
      available: json['available'],
      featured: json['featured'],
      accepted: json['accepted'],
      customFields: (json['custom_fields'] as List<dynamic>?),
      hasMedia: json['has_media'],
      rate: json['rate'],
      totalReviews: json['total_reviews'],
      hasValidSubscription: json['has_valid_subscription'],
      availabilityHours: (json['availability_hours'] as List<dynamic>?)
          ?.map((e) => AvailabilityHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      media: (json['media'] as List<dynamic>?),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'eProviderTypeId': eProviderTypeId,
      'phone_number': phoneNumber,
      'mobile_number': mobileNumber,
      'availability_range': availabilityRange,
      'available': available,
      'featured': featured,
      'accepted': accepted,
      'has_media': hasMedia,
      'rate': rate,
      'total_reviews': totalReviews,
      'has_valid_subscription': hasValidSubscription,
    };
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (availabilityHours != null) {
      data['availability_hours'] =
          availabilityHours!.map((e) => e.toJson()).toList();
    }
    if (customFields != null) {
      data['custom_fields'] = customFields;
    }
    if (media != null) {
      data['media'] = media;
    }
    return data;
  }
}

class Name {
  String? en;

  Name({this.en});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(en: json['en']);
  }

  Map<String, dynamic> toJson() {
    return {'en': en};
  }
}

class AvailabilityHours {
  int? id;
  String? day;
  String? startAt;
  String? endAt;
  List<dynamic>? data;
  int? eProviderId;
  List<dynamic>? customFields;

  AvailabilityHours({
    this.id,
    this.day,
    this.startAt,
    this.endAt,
    this.data,
    this.eProviderId,
    this.customFields,
  });

  factory AvailabilityHours.fromJson(Map<String, dynamic> json) {
    return AvailabilityHours(
      id: json['id'],
      day: json['day'],
      startAt: json['start_at'],
      endAt: json['end_at'],
      data: (json['custom_fields'] as List<dynamic>?),
      eProviderId: json['e_provider_id'],
      customFields: (json['custom_fields'] as List<dynamic>?),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'day': day,
      'start_at': startAt,
      'end_at': endAt,
    };
    if (this.data != null) {
      data['data'] = data;
    }
    if (customFields != null) {
      data['custom_fields'] = customFields;
    }
    return data;
  }
}

class EService {
  int? id;
  Name? name;
  dynamic price;
  dynamic discountPrice;
  String? priceUnit;
  String? quantityUnit;
  String? duration;
  Name? description;
  bool? featured;
  bool? enableBooking;
  bool? available;
  dynamic eProviderId;
  List<dynamic>? customFields;
  bool? hasMedia;
  dynamic totalReviews;
  bool? isFavorite;
  dynamic rate;
  EProvider? eProvider;
  List<dynamic>? media;

  EService({
    this.id,
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
    this.media,
  });

  factory EService.fromJson(Map<String, dynamic> json) {
    return EService(
      id: json['id'],
      name: json['name'] != null
          ? Name.fromJson(json['name'] as Map<String, dynamic>)
          : null,
      price: json['price'],
      discountPrice: json['discount_price'],
      priceUnit: json['price_unit'],
      quantityUnit: json['quantity_unit'],
      duration: json['duration'],
      description: json['description'] != null
          ? Name.fromJson(json['description'] as Map<String, dynamic>)
          : null,
      featured: json['featured'],
      enableBooking: json['enable_booking'],
      available: json['available'],
      eProviderId: json['e_provider_id'],
      customFields: (json['custom_fields'] as List<dynamic>?),
      hasMedia: json['has_media'],
      totalReviews: json['total_reviews'],
      isFavorite: json['is_favorite'],
      rate: json['rate'],
      eProvider: json['e_provider'] != null
          ? EProvider.fromJson(json['e_provider'] as Map<String, dynamic>)
          : null,
      media: (json['media'] as List<dynamic>?),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'price': price,
      'discount_price': discountPrice,
      'price_unit': priceUnit,
      'quantity_unit': quantityUnit,
      'duration': duration,
      'featured': featured,
      'enable_booking': enableBooking,
      'available': available,
      'e_provider_id': eProviderId,
      'has_media': hasMedia,
      'total_reviews': totalReviews,
      'is_favorite': isFavorite,
      'rate': rate,
    };
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (eProvider != null) {
      data['e_provider'] = eProvider!.toJson();
    }
    if (customFields != null) {
      data['custom_fields'] = customFields;
    }
    if (media != null) {
      data['media'] = media;
    }
    return data;
  }
}

class Address {
  String? description;
  String? address;
  dynamic latitude;
  dynamic longitude;
  int? id;
  List<dynamic>? customFields;

  Address({
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.id,
    this.customFields,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      description: json['description'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      id: json['id'],
      customFields: (json['custom_fields'] as List<dynamic>?),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'id': id,
    };
    if (customFields != null) {
      data['custom_fields'] = customFields;
    }
    return data;
  }
}

class Coupon {
  List<dynamic>? customFields;

  Coupon({this.customFields});

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(customFields: (json['custom_fields'] as List<dynamic>?));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (customFields != null) {
      data['custom_fields'] = customFields;
    }
    return data;
  }
}
