class StressLevelModel {
  bool? status;
  String? message;
  Data? data;

  StressLevelModel({this.status, this.message, this.data});

  StressLevelModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? dates;
  Stresslevels? stresslevels;

  Data({this.dates, this.stresslevels});

  Data.fromJson(Map<String, dynamic> json) {
    dates = json['dates'].cast<String>();
    stresslevels = json['stresslevels'] != null
        ? new Stresslevels.fromJson(json['stresslevels'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dates'] = this.dates;
    if (this.stresslevels != null) {
      data['stresslevels'] = this.stresslevels!.toJson();
    }
    return data;
  }
}

class Stresslevels {
  List<BeforeSessionStress>? beforeSessionStress;
  List<AfterSessionStress>? afterSessionStress;

  Stresslevels({this.beforeSessionStress, this.afterSessionStress});

  Stresslevels.fromJson(Map<String, dynamic> json) {
    if (json['beforeSessionStress'] != null) {
      beforeSessionStress = <BeforeSessionStress>[];
      json['beforeSessionStress'].forEach((v) {
        beforeSessionStress!.add(new BeforeSessionStress.fromJson(v));
      });
    }
    if (json['afterSessionStress'] != null) {
      afterSessionStress = <AfterSessionStress>[];
      json['afterSessionStress'].forEach((v) {
        afterSessionStress!.add(new AfterSessionStress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.beforeSessionStress != null) {
      data['beforeSessionStress'] =
          this.beforeSessionStress!.map((v) => v.toJson()).toList();
    }
    if (this.afterSessionStress != null) {
      data['afterSessionStress'] =
          this.afterSessionStress!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BeforeSessionStress {
  int? id;
  int? level;

  BeforeSessionStress({this.id, this.level});

  BeforeSessionStress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    return data;
  }
}

class AfterSessionStress {
  int? id;
  int? level;

  AfterSessionStress({this.id, this.level});

  AfterSessionStress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    return data;
  }
}