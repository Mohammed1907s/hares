import 'package:hares/models/categories.dart';
import 'package:hares/models/pagination.dart';
import 'package:hares/models/review.dart';
import 'package:hares/models/user.dart';

class PhoneLinks {
  bool? status;
  String? msg;
  Result? result;

  PhoneLinks({this.status, this.msg, this.result});

  PhoneLinks.fromJson(Map<String, dynamic> json) {
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
  List<LinksPhoneData>? phonesLinks;
  Pagination? pagination;

  Result({this.phonesLinks, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['links_phone_company'] != null) {
      phonesLinks = <LinksPhoneData>[];
      json['links_phone_company'].forEach((v) {
        phonesLinks!.add(LinksPhoneData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (phonesLinks != null) {
      data['links_phone_company'] =
          phonesLinks!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class LinksPhoneData {
  int? id;
  String? type;
  String? phone;
  String? websiteLink;
  String? companyName;
  String? companyAddress;
  String? companyNo;
  int? isVerify;
  CategoryData? category;
  String? imageUrl;
  String? commercialRegisterImageUrl;
  List<Review>? reviews;
  int? createdAt;
  int? updatedAt;

  LinksPhoneData(
      {this.id,
        this.type,
        this.phone,
        this.websiteLink,
        this.companyName,
        this.companyAddress,
        this.companyNo,
        this.isVerify,
        this.category,
        this.imageUrl,
        this.commercialRegisterImageUrl,
        this.reviews,
        this.createdAt,
        this.updatedAt});

  LinksPhoneData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    phone = json['phone'];
    websiteLink = json['website_link'];
    companyName = json['company_name'];
    companyAddress = json['company_address'];
    companyNo = json['company_no'];
    isVerify = json['is_verify'];
    category = json['categroy'] != null && json['categroy'] != ''
        ? CategoryData.fromJson(json['categroy'])
        : null;
    imageUrl = json['image_url'];
    commercialRegisterImageUrl = json['commercial_register_image_url'];
    if (json['review'] != null) {
      reviews = <Review>[];
      json['review'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['phone'] = phone;
    data['website_link'] = websiteLink;
    data['company_name'] = companyName;
    data['company_address'] = companyAddress;
    data['company_no'] = companyNo;
    data['is_verify'] = isVerify;
    if (category != null) {
      data['categroy'] = category!.toJson();
    }
    data['image_url'] = imageUrl;
    data['commercial_register_image_url'] = commercialRegisterImageUrl;
    if (reviews != null) {
      data['review'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

