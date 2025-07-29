import 'package:hares/models/pagination.dart';

class Splash {
  bool? status;
  String? msg;
  Result? result;

  Splash({this.status, this.msg, this.result});

  Splash.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<SplashData>? splashes;
  Pagination? pagination;

  Result({this.splashes, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['splash'] != null) {
      splashes = <SplashData>[];
      json['splash'].forEach((v) {
        splashes!.add(SplashData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (splashes != null) {
      data['splash'] = splashes!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class SplashData {
  int? id;
  String? title;
  String? description;
  String? imageUrl;

  SplashData({this.id, this.title, this.description, this.imageUrl});

  SplashData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image_url'] = imageUrl;
    return data;
  }
}


