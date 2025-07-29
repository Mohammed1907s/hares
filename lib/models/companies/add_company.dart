import 'package:hares/models/phone_links.dart';

class AddCompany {
  bool? status;
  String? msg;
  Result? result;

  AddCompany({this.status, this.msg, this.result});

  AddCompany.fromJson(Map<String, dynamic> json) {
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
  LinksPhoneData? company;

  Result({this.company});

  Result.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? LinksPhoneData.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}
