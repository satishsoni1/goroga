class PatientModel {
  bool? status;
  String? message;
  List<dynamic>? data;

  PatientModel({this.status, this.message, this.data});

  PatientModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? name;
  String? mobileNo;
  String? address;
  String? email;
  String? createdAt;
  String? updatedAt;
  int? age;
  String? gender;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.mobileNo,
      this.address,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.age,
      this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['address'] = this.address;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['age'] = this.age;
    data['gender'] = this.gender;
    return data;
  }
}
