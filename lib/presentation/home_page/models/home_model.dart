
class HomeModel {
  List<Categories>? categories;

  HomeModel({this.categories});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? title;
  List<Data>? data;

  Categories({this.title, this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
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


