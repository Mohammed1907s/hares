import 'package:hares/models/pagination.dart';
import 'package:hares/models/phone_links.dart';
import 'package:hares/models/user.dart';

class Reports {
  bool? status;
  String? msg;
  Result? result;

  Reports({this.status, this.msg, this.result});

  Reports.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
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
  List<ReportData>? reports;
  Pagination? pagination;

  Result({this.reports, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['reports'] != null) {
      reports = <ReportData>[];
      json['reports'].forEach((v) {
        reports!.add(ReportData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reports != null) {
      data['reports'] = reports!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class ReportData {
  int? id;
  LinksPhoneData? linksPhone;
  User? customer;
  String? description;
  int? createdAt;
  int? updatedAt;

  ReportData(
      {this.id,
        this.linksPhone,
        this.customer,
        this.description,
        this.createdAt,
        this.updatedAt});

  ReportData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    linksPhone = json['links_phone_company'] != null
        ? LinksPhoneData.fromJson(json['links_phone_company'])
        : null;
    customer = json['customer'] != null
        ? User.fromJson(json['customer'])
        : null;
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (linksPhone != null) {
      data['links_phone_company'] = linksPhone!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
