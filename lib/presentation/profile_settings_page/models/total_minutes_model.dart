class TotalMinutesModel {
  bool? status;
  String? message;
  Data? data;

  TotalMinutesModel({this.status, this.message, this.data});

  TotalMinutesModel.fromJson(Map<String, dynamic> json) {
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
  List<dynamic>? labels;
  List<dynamic>? data;
  int? totalMinutes;

  Data({this.labels, this.data, this.totalMinutes});

  Data.fromJson(Map<String, dynamic> json) {
    labels = json['labels'].cast<String>();
    data = json['data'].cast<int>();
    totalMinutes = json['total_minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labels'] = this.labels;
    data['data'] = this.data;
    data['total_minutes'] = this.totalMinutes;
    return data;
  }
}