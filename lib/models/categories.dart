import 'package:hares/models/pagination.dart';

class Categories {
  bool? status;
  String? msg;
  Result? result;

  Categories({this.status, this.msg, this.result});

  Categories.fromJson(Map<String, dynamic> json) {
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
  List<CategoryData>? categories;
  Pagination? pagination;

  Result({this.categories, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <CategoryData>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  String? name;
  String? image;
  String? description;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  bool isSelected = false;

  CategoryData({this.id, this.name,this.image, this.description, this.imageUrl,this.createdAt,
    this.updatedAt, this.isSelected = false});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
