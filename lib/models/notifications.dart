class Notifications {
  bool? status;
  String? msg;
  Result? result;

  Notifications({this.status, this.msg, this.result});

  Notifications.fromJson(Map<String, dynamic> json) {
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
  List<NotificationData>? notifications;

  Result({this.notifications});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['notification'] != null) {
      notifications = <NotificationData>[];
      json['notification'].forEach((v) {
        notifications!.add(new NotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notifications != null) {
      data['notification'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationData {
  String? id;
  String? notificationText;
  String? type;
  int? isRead;
  String? time;
  String? date;

  NotificationData(
      {this.id,
        this.notificationText,
        this.type,
        this.isRead,
        this.time,
        this.date});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationText = json['notification_text'];
    type = json['type'];
    isRead = json['is_read'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['notification_text'] = notificationText;
    data['type'] = type;
    data['is_read'] = isRead;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}
