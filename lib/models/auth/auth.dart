import 'package:hares/models/user.dart';

class Auth {
  bool? status;
  String? msg;
  Result? result;

  Auth({this.status, this.msg, this.result});

  Auth.fromJson(Map<String, dynamic> json) {
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
  String? guard;
  String? token;

  Result({this.user, this.guard, this.token});

  Result.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    guard = json['guard'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['guard'] = guard;
    data['token'] = token;
    return data;
  }
}
