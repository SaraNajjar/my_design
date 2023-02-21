class TSettings {
  bool? status;
  int? code;
  String? message;
  Settings? settings;

  TSettings({this.status, this.code, this.message, this.settings});

  TSettings.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    return data;
  }
}

class Settings {
  int? id;
  String? logo;
  String? image;
  String? mobile;
  String? email;
  String? facebook;
  String? snapchat;
  String? instegram;
  String? twitter;
  int? paginateTotal;
  int? isMaintenanceMode;
  int? isAlowedRegister;
  int? isAlowedLogin;
  Null? createdAt;
  String? updatedAt;
  List<Pages>? pages;
  String? title;
  String? description;
  String? address;
  String? accountPageText;
  String? signIdText;

  Settings(
      {this.id,
        this.logo,
        this.image,
        this.mobile,
        this.email,
        this.facebook,
        this.snapchat,
        this.instegram,
        this.twitter,
        this.paginateTotal,
        this.isMaintenanceMode,
        this.isAlowedRegister,
        this.isAlowedLogin,
        this.createdAt,
        this.updatedAt,
        this.pages,
        this.title,
        this.description,
        this.address,
        this.accountPageText,
        this.signIdText});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    image = json['image'];
    mobile = json['mobile'];
    email = json['email'];
    facebook = json['facebook'];
    snapchat = json['snapchat'];
    instegram = json['instegram'];
    twitter = json['twitter'];
    paginateTotal = json['paginateTotal'];
    isMaintenanceMode = json['is_maintenance_mode'];
    isAlowedRegister = json['is_alowed_register'];
    isAlowedLogin = json['is_alowed_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
    title = json['title'];
    description = json['description'];
    address = json['address'];
    accountPageText = json['account_page_text'];
    signIdText = json['signIdText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['image'] = this.image;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['facebook'] = this.facebook;
    data['snapchat'] = this.snapchat;
    data['instegram'] = this.instegram;
    data['twitter'] = this.twitter;
    data['paginateTotal'] = this.paginateTotal;
    data['is_maintenance_mode'] = this.isMaintenanceMode;
    data['is_alowed_register'] = this.isAlowedRegister;
    data['is_alowed_login'] = this.isAlowedLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['address'] = this.address;
    data['account_page_text'] = this.accountPageText;
    data['signIdText'] = this.signIdText;
    return data;
  }
}

class Pages {
  int? id;
  Null? slug;
  String? status;
  String? createdAt;
  Null? updatedAt;
  Null? deletedAt;
  String? title;
  String? description;
  Null? keyWords;
  List<Translations>? translations;

  Pages(
      {this.id,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.title,
        this.description,
        this.keyWords,
        this.translations});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    title = json['title'];
    description = json['description'];
    keyWords = json['key_words'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['key_words'] = this.keyWords;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  int? pageId;
  String? locale;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Translations(
      {this.id,
        this.pageId,
        this.locale,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageId = json['page_id'];
    locale = json['locale'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_id'] = this.pageId;
    data['locale'] = this.locale;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}