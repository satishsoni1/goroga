class SessionHistoryModel {
  bool? status;
  String? message;
  Data? data;

  SessionHistoryModel({this.status, this.message, this.data});

  SessionHistoryModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? sessionUserId;
  int? duration;
  List<Content>? content;

  Data({this.userId, this.sessionUserId, this.duration, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sessionUserId = json['session_user_id'];
    duration = json['duration'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['session_user_id'] = this.sessionUserId;
    data['duration'] = this.duration;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  int? id;
  String? title;
  String? imageUrl;
  String? authorName;
  String? videoUrl;
  String? description;
  String? duration;
  String? createdAt;
  String? updatedAt;
  int? titleId;

  Content(
      {this.id,
      this.title,
      this.imageUrl,
      this.authorName,
      this.videoUrl,
      this.description,
      this.duration,
      this.createdAt,
      this.updatedAt,
      this.titleId});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    authorName = json['author'];
    videoUrl = json['videoUrl'];
    description = json['description'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    titleId = json['title_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['author'] = this.authorName;
    data['videoUrl'] = this.videoUrl;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title_id'] = this.titleId;
    return data;
  }
}