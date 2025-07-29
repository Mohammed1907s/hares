import 'package:hares/models/phone_links.dart';
import 'package:hares/models/user.dart';

class MakeReport {
  bool? status;
  String? msg;
  Result? result;

  MakeReport({this.status, this.msg, this.result});

  MakeReport.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  Report? report;

  Result({this.report});

  Result.fromJson(Map<String, dynamic> json) {
    report =
    json['report'] != null ? new Report.fromJson(json['report']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.report != null) {
      data['report'] = this.report!.toJson();
    }
    return data;
  }
}

class Report {
  int? id;
  LinksPhoneData? linksPhoneCompany;
  User? customer;
  String? description;
  int? createdAt;
  int? updatedAt;

  Report(
      {this.id,
        this.linksPhoneCompany,
        this.customer,
        this.description,
        this.createdAt,
        this.updatedAt});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    linksPhoneCompany = json['links_phone_company'] != null
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.linksPhoneCompany != null) {
      data['links_phone_company'] = this.linksPhoneCompany!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
