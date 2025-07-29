import 'package:hares/models/user.dart';

class EditProfile {
  bool? status;
  String? msg;
  Result? result;

  EditProfile({this.status, this.msg, this.result});

  EditProfile.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;
  String? guard;

  Result({this.user, this.token, this.guard});

  Result.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    guard = json['guard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['guard'] = guard;
    return data;
  }
}
