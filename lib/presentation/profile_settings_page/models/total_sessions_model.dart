class TotalSessionModel {
  bool? status;
  String? message;
  Data? data;

  TotalSessionModel({this.status, this.message, this.data});

  TotalSessionModel.fromJson(Map<String, dynamic> json) {
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
  int? totalContentPlayed;

  Data({this.labels, this.data, this.totalContentPlayed});

  Data.fromJson(Map<String, dynamic> json) {
    labels = json['labels'];
    data = json['data'];
    totalContentPlayed = json['total_content_played'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labels'] = this.labels;
    data['data'] = this.data;
    data['total_content_played'] = this.totalContentPlayed;
    return data;
  }
}