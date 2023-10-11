
class ProgramModel {
  List<Programs>? programs;

  ProgramModel({this.programs});

  ProgramModel.fromJson(Map<String, dynamic> json) {
    if (json['programs'] != null) {
      programs = <Programs>[];
      json['programs'].forEach((v) {
        programs!.add(new Programs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? description;
  String? imageUrl;
  String? videoUrl;
  String? duration;

  Data(
      {this.id,
      this.title,
      this.author,
      this.description,
      this.imageUrl,
      this.videoUrl,
      this.duration});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['videoUrl'] = this.videoUrl;
    data['duration'] = this.duration;
    return data;
  }
}
