class StressLevelModel {
  bool? status;
  String? message;
  StressLevelData? data;

  StressLevelModel({this.status, this.message, this.data});

  StressLevelModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? StressLevelData.fromJson(json['data']) : null;
  }
}

class StressLevelData {
  List<String>? dates;
  StressLevels? stresslevels;

  StressLevelData({this.dates, this.stresslevels});

  StressLevelData.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? List<String>.from(json['dates']) : null;
    stresslevels = json['stresslevels'] != null
        ? StressLevels.fromJson(json['stresslevels'])
        : null;
  }
}

class StressLevels {
  List<StressLevelRecord>? beforeSessionStress;
  List<StressLevelRecord>? afterSessionStress;

  StressLevels({this.beforeSessionStress, this.afterSessionStress});

  StressLevels.fromJson(Map<String, dynamic> json) {
    beforeSessionStress = json['beforeSessionStress'] != null
        ? List<StressLevelRecord>.from(json['beforeSessionStress']
            .map((x) => StressLevelRecord.fromJson(x)))
        : null;
    afterSessionStress = json['afterSessionStress'] != null
        ? List<StressLevelRecord>.from(json['afterSessionStress']
            .map((x) => StressLevelRecord.fromJson(x)))
        : null;
  }
}

class StressLevelRecord {
  int? id;
  dynamic level; // It could be int or String, change it based on your requirements

  StressLevelRecord({this.id, this.level});

  StressLevelRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
  }
}
