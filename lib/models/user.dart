class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  dynamic emailCode;
  dynamic verifiedEmailCode;
  String? image;
  String? imageUrl;
  dynamic deviceType;
  dynamic fcmToken;
  dynamic forgetEmailCode;
  dynamic verifiedForgetEmailCode;
  int? createdAt;
  int? updatedAt;

  User(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.emailCode,
        this.verifiedEmailCode,
        this.image,
        this.imageUrl,
        this.deviceType,
        this.fcmToken,
        this.forgetEmailCode,
        this.verifiedForgetEmailCode,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    emailCode = json['email_code'];
    verifiedEmailCode = json['verified_email_code'];
    image = json['image'];
    imageUrl = json['image_url'];
    deviceType = json['device_type'];
    fcmToken = json['fcm_token'];
    forgetEmailCode = json['forget_email_code'];
    verifiedForgetEmailCode = json['verified_forget_email_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['email_code'] = emailCode;
    data['verified_email_code'] = verifiedEmailCode;
    data['image'] = image;
    data['image_url'] = imageUrl;
    data['device_type'] = deviceType;
    data['fcm_token'] = fcmToken;
    data['forget_email_code'] = forgetEmailCode;
    data['verified_forget_email_code'] = verifiedForgetEmailCode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}