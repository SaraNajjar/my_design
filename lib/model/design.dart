class TDesign {
  bool? status;
  int? code;
  String? message;
  List<Items>? items;

  TDesign({this.status, this.code, this.message, this.items});

  TDesign.fromJson(Map<String, dynamic> json) {
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
  String? imageOne;
  String? imageTwo;
  int? categoryId;
  int? hasImage;
  String? status;
  String? createdAt;

  Items(
      {this.id,
        this.imageOne,
        this.imageTwo,
        this.categoryId,
        this.hasImage,
        this.status,
        this.createdAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageOne = json['image_one'];
    imageTwo = json['image_two'];
    categoryId = json['category_id'];
    hasImage = json['has_image'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_one'] = this.imageOne;
    data['image_two'] = this.imageTwo;
    data['category_id'] = this.categoryId;
    data['has_image'] = this.hasImage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}