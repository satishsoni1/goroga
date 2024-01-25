class GADmodel {
  bool? status;
  String? message;
  Las4monthdata? las4monthdata;

  GADmodel({this.status, this.message, this.las4monthdata});

  GADmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    las4monthdata = json['las4monthdata'] != null
        ? new Las4monthdata.fromJson(json['las4monthdata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.las4monthdata != null) {
      data['las4monthdata'] = this.las4monthdata!.toJson();
    }
    return data;
  }
}

class Las4monthdata {
  List<dynamic>? labels;
  List<dynamic>? data;

  Las4monthdata({this.labels, this.data});

  Las4monthdata.fromJson(Map<String, dynamic> json) {
    labels = json['labels'].cast<String>();
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labels'] = this.labels;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? month;
  int? score;
  String? condition;

  Data({this.month, this.score, this.condition});

  Data.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    score = json['score'];
    condition = json['condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['score'] = this.score;
    data['condition'] = this.condition;
    return data;
  }
}
