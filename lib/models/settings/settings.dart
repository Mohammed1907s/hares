class Settings {
  bool? status;
  String? msg;
  Result? result;

  Settings({this.status, this.msg, this.result});

  Settings.fromJson(Map<String, dynamic> json) {
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
  SettingsData? condition;
  SettingsData? policy;
  SettingsData? aboutUs;
  Setting? setting;

  Result({this.condition, this.policy, this.aboutUs, this.setting});

  Result.fromJson(Map<String, dynamic> json) {
    condition = json['condition'] != null
        ? SettingsData.fromJson(json['condition'])
        : null;
    policy =
    json['policy'] != null ? SettingsData.fromJson(json['policy']) : null;
    aboutUs = json['about_us'] != null
        ? SettingsData.fromJson(json['about_us'])
        : null;
    setting =
    json['setting'] != null ? Setting.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    if (policy != null) {
      data['policy'] = policy!.toJson();
    }
    if (aboutUs != null) {
      data['about_us'] = aboutUs!.toJson();
    }
    if (setting != null) {
      data['setting'] = setting!.toJson();
    }
    return data;
  }
}

class SettingsData {
  int? id;
  String? title;
  String? type;
  String? description;
  dynamic image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  SettingsData(
      {this.id,
        this.title,
        this.type,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  SettingsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Setting {
  int? id;
  String? websiteName;
  String? email;
  String? address1;
  String? address2;
  String? seoKeywords;
  String? seoDescription;
  String? phone;
  String? mobile1;
  String? mobile2;
  String? facebook;
  String? instagram;
  String? whatsapp;
  String? twitter;
  String? linkedIn;
  String? logo;
  String? favicon;
  dynamic createdAt;
  String? updatedAt;
  String? logoUrl;
  String? faviconUrl;

  Setting(
      {this.id,
        this.websiteName,
        this.email,
        this.address1,
        this.address2,
        this.seoKeywords,
        this.seoDescription,
        this.phone,
        this.mobile1,
        this.mobile2,
        this.facebook,
        this.instagram,
        this.whatsapp,
        this.twitter,
        this.linkedIn,
        this.logo,
        this.favicon,
        this.createdAt,
        this.updatedAt,
        this.logoUrl,
        this.faviconUrl});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    websiteName = json['website_name'];
    email = json['email'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    seoKeywords = json['seo_keywords'];
    seoDescription = json['seo_description'];
    phone = json['phone'];
    mobile1 = json['mobile_1'];
    mobile2 = json['mobile_2'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    whatsapp = json['whatsapp'];
    twitter = json['twitter'];
    linkedIn = json['linked_in'];
    logo = json['logo'];
    favicon = json['favicon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logoUrl = json['logo_url'];
    faviconUrl = json['favicon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['website_name'] = websiteName;
    data['email'] = email;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['seo_keywords'] = seoKeywords;
    data['seo_description'] = seoDescription;
    data['phone'] = phone;
    data['mobile_1'] = mobile1;
    data['mobile_2'] = mobile2;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    data['whatsapp'] = whatsapp;
    data['twitter'] = twitter;
    data['linked_in'] = linkedIn;
    data['logo'] = logo;
    data['favicon'] = favicon;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['logo_url'] = logoUrl;
    data['favicon_url'] = faviconUrl;
    return data;
  }
}
