class SurveyModel {
  bool? status;
  String? message;
  List<Data>? data;

  SurveyModel({this.status, this.message, this.data});

  SurveyModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  int? type;
  int? source;
  int? answer_id;
  String? questionType;
  String? createdAt;
  String? updatedAt;
  List<Ans>? ans;
  List<SubQue>? subQue;

  Data(
      {this.id,
      this.title,
      this.type,
      this.source,
      this.questionType,
      this.createdAt,
      this.updatedAt,
      this.ans,
      this.subQue});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    source = json['source'];
    questionType = json['question_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ans'] != null) {
      ans = <Ans>[];
      json['ans'].forEach((v) {
        ans!.add(new Ans.fromJson(v));
      });
    }
    if (json['subQue'] != null) {
      subQue = <SubQue>[];
      json['subQue'].forEach((v) {
        subQue!.add(new SubQue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['source'] = this.source;
    data['question_type'] = this.questionType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.ans != null) {
      data['ans'] = this.ans!.map((v) => v.toJson()).toList();
    }
    if (this.subQue != null) {
      data['subQue'] = this.subQue!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ans {
  int? id;
  String? title;
  int? type;
  String? source;
  String? questionType;
  String? createdAt;
  String? updatedAt;

  Ans(
      {this.id,
      this.title,
      this.type,
      this.source,
      this.questionType,
      this.createdAt,
      this.updatedAt});

  Ans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    source = json['source'];
    questionType = json['question_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['source'] = this.source;
    data['question_type'] = this.questionType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SubQue {
  int? id;
  String? title;
  int? type;
  String? source;
  String? questionType;
  String? createdAt;
  String? updatedAt;
  List<SubOpt>? subOpt;

  SubQue(
      {this.id,
      this.title,
      this.type,
      this.source,
      this.questionType,
      this.createdAt,
      this.updatedAt,
      this.subOpt});

  SubQue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    source = json['source'];
    questionType = json['question_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['subOpt'] != null) {
      subOpt = <SubOpt>[];
      json['subOpt'].forEach((v) {
        subOpt!.add(new SubOpt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['source'] = this.source;
    data['question_type'] = this.questionType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subOpt != null) {
      data['subOpt'] = this.subOpt!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}

class SubOpt {
  int? id;
  String? suboptionTitle;

  SubOpt({this.id, this.suboptionTitle});

  SubOpt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    suboptionTitle = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = suboptionTitle;
    return data;
  }
}
