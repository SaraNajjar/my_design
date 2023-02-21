class TSubCategories {
  bool? status;
  int? code;
  String? message;
  List<Items>? items;

  TSubCategories({this.status, this.code, this.message, this.items});

  TSubCategories.fromJson(Map<String, dynamic> json) {
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
  int? parentId;
  String? image;
  String? status;
  String? createdAt;
  String? name;

  Items(
      {this.id,
        this.parentId,
        this.image,
        this.status,
        this.createdAt,
        this.name});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    return data;
  }
}