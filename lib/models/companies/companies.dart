class Companies {
  List<CompanyData>? companies;
  Links? links;
  Meta? meta;

  Companies({this.companies, this.links, this.meta});

  Companies.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      companies = <CompanyData>[];
      json['data'].forEach((v) {
        companies!.add(new CompanyData.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (companies != null) {
      data['data'] = companies!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class CompanyData {
  int? id;
  String? name;
  String? registrationNumber;
  String? website;
  String? address;
  Null commercialRegisterUrl;
  String? verificationStatus;
  String? createdAt;
  String? updatedAt;

  CompanyData(
      {this.id,
        this.name,
        this.registrationNumber,
        this.website,
        this.address,
        this.commercialRegisterUrl,
        this.verificationStatus,
        this.createdAt,
        this.updatedAt});

  CompanyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    registrationNumber = json['registration_number'];
    website = json['website'];
    address = json['address'];
    commercialRegisterUrl = json['commercial_register_url'];
    verificationStatus = json['verification_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['registration_number'] = registrationNumber;
    data['website'] = website;
    data['address'] = address;
    data['commercial_register_url'] = commercialRegisterUrl;
    data['verification_status'] = verificationStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null prev;
  Null next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
