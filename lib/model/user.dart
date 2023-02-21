class TUser {
  bool? status;
  int? code;
  String? message;
  Item? item;

  TUser({this.status, this.code, this.message, this.item});

  TUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  int? id;
  String? name;
  String? email;
  Null? mobile;
  String? status;
  String? createdAt;
  String? accessToken;

  Item(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.status,
        this.createdAt,
        this.accessToken});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    status = json['status'];
    createdAt = json['created_at'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['access_token'] = this.accessToken;
    return data;
  }
}