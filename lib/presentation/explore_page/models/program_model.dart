class ProgramModel {
  bool? status;
  String? message;
  List<Programs>? programs;

  ProgramModel({this.status, this.message, this.programs});

  ProgramModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['programs'] != null) {
      programs = <Programs>[];
      json['programs'].forEach((v) {
        programs!.add(new Programs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.programs != null) {
      data['programs'] = this.programs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Programs {
  int? id;
  String? title;
  String? author;
  String? description;
  String? imageUrl;
  String? duration;
  List<Data>? data;

  Programs(
      {this.id,
      this.title,
      this.author,
      this.description,
      this.imageUrl,
      this.duration,
      this.data});

  Programs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['duration'] = this.duration;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? author;
  String? imageUrl;
  String? videoUrl;
  String? description;
  String? duration;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.author,
      this.imageUrl,
      this.videoUrl,
      this.description,
      this.duration,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    description = json['description'];
    duration = json['duration'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['imageUrl'] = this.imageUrl;
    data['videoUrl'] = this.videoUrl;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
