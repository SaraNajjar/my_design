class TBanner {
  bool? status;
  int? code;
  String? message;
  List<Items>? items;

  TBanner({this.status, this.code, this.message, this.items});

  TBanner.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? status;
  String? image;
  String? url;
  String? createdAt;

  Items({this.id, this.status, this.image, this.url, this.createdAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    image = json['image'];
    url = json['url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['image'] = this.image;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    return data;
  }
}