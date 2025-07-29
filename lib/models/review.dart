import 'package:hares/models/user.dart';

class Review {
  int? id;
  String? rate;
  String? comment;
  User? customer;
  int? createdAt;
  int? updatedAt;

  Review({this.id, this.rate, this.comment, this.customer, this.createdAt, this.updatedAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    comment = json['comment'];
    customer = json['customer'] != null
        ? User.fromJson(json['customer'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate'] = rate;
    data['comment'] = comment;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}