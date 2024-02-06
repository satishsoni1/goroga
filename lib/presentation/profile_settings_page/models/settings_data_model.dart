class SettingDataModel {
  bool? status;
  String? message;
  List<Data>? data;

  SettingDataModel({this.status, this.message, this.data});

  SettingDataModel.fromJson(Map<String, dynamic> json) {
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
  String? appTermsOfServiceLink;
  String? termsConditionLink;
  String? privacyPolicyLink;
  String? faqsLink;
  String? medidationImage;
  String? stressText;
  String? stressTextData;
  String? privacyText;
  String? privacyTextData;
  String? appName;
  String? appLogo;
  Null? createdAt;
  Null? updatedAt;

  Data(
      {this.id,
      this.appTermsOfServiceLink,
      this.termsConditionLink,
      this.privacyPolicyLink,
      this.faqsLink,
      this.medidationImage,
      this.stressText,
      this.stressTextData,
      this.privacyText,
      this.privacyTextData,
      this.appName,
      this.appLogo,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appTermsOfServiceLink = json['app_terms_of_service_link'];
    termsConditionLink = json['terms_condition_link'];
    privacyPolicyLink = json['privacy_policy_link'];
    faqsLink = json['faqs_link'];
    medidationImage = json['medidation_image'];
    stressText = json['stress_text'];
    stressTextData = json['stress_text_data'];
    privacyText = json['privacy_text'];
    privacyTextData = json['privacy_text_data'];
    appName = json['app_name'];
    appLogo = json['app_logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app_terms_of_service_link'] = this.appTermsOfServiceLink;
    data['terms_condition_link'] = this.termsConditionLink;
    data['privacy_policy_link'] = this.privacyPolicyLink;
    data['faqs_link'] = this.faqsLink;
    data['medidation_image'] = this.medidationImage;
    data['stress_text'] = this.stressText;
    data['stress_text_data'] = this.stressTextData;
    data['privacy_text'] = this.privacyText;
    data['privacy_text_data'] = this.privacyTextData;
    data['app_name'] = this.appName;
    data['app_logo'] = this.appLogo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
