class TCategories {
  bool? status;
  int? code;
  String? message;
  List<Items>? items;

  TCategories({this.status, this.code, this.message, this.items});

  TCategories.fromJson(Map<String, dynamic> json) {
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


















// class TCategories {
//   bool? status;
//   int? code;
//   String? message;
//   List<Items>? items;
//   bool? isMore;
//
//   TCategories({this.status, this.code, this.message, this.items, this.isMore});
//
//   TCategories.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     code = json['code'];
//     message = json['message'];
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(new Items.fromJson(v));
//       });
//     }
//     isMore = json['is_more'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     data['is_more'] = this.isMore;
//     return data;
//   }
// }
//
// class Items {
//   int? id;
//   int? parentId;
//   String? image;
//   String? status;
//   String? createdAt;
//   int? countChildren;
//   String? name;
//   List<Children>? children;
//
//   Items(
//       {this.id,
//         this.parentId,
//         this.image,
//         this.status,
//         this.createdAt,
//         this.countChildren,
//         this.name,
//         this.children});
//
//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     parentId = json['parent_id'];
//     image = json['image'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     countChildren = json['count_children'];
//     name = json['name'];
//     if (json['children'] != null) {
//       children = <Children>[];
//       json['children'].forEach((v) {
//         children!.add(new Children.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['parent_id'] = this.parentId;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['count_children'] = this.countChildren;
//     data['name'] = this.name;
//     if (this.children != null) {
//       data['children'] = this.children!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Children {
//   int? id;
//   int? parentId;
//   String? image;
//   String? status;
//   String? createdAt;
//   int? countChildren;
//   String? name;
//
//   Children(
//       {this.id,
//         this.parentId,
//         this.image,
//         this.status,
//         this.createdAt,
//         this.countChildren,
//         this.name});
//
//   Children.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     parentId = json['parent_id'];
//     image = json['image'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     countChildren = json['count_children'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['parent_id'] = this.parentId;
//     data['image'] = this.image;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['count_children'] = this.countChildren;
//     data['name'] = this.name;
//     return data;
//   }
// }
// // class TCategories {
// //   bool? status;
// //   int? code;
// //   String? message;
// //   List<Items>? items;
// //
// //   TCategories({this.status, this.code, this.message, this.items});
// //
// //   TCategories.fromJson(Map<String, dynamic> json) {
// //     status = json['status'];
// //     code = json['code'];
// //     message = json['message'];
// //     if (json['items'] != null) {
// //       items = <Items>[];
// //       json['items'].forEach((v) {
// //         items!.add(new Items.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['status'] = this.status;
// //     data['code'] = this.code;
// //     data['message'] = this.message;
// //     if (this.items != null) {
// //       data['items'] = this.items!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class Items {
// //   int? id;
// //   int? showInHeader;
// //   int? isFeatured;
// //   int? bulkDiscountPercentage;
// //   String? image;
// //   String? status;
// //   String? createdAt;
// //   String? name;
// //
// //   Items(
// //       {this.id,
// //         this.showInHeader,
// //         this.isFeatured,
// //         this.bulkDiscountPercentage,
// //         this.image,
// //         this.status,
// //         this.createdAt,
// //         this.name});
// //
// //   Items.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     showInHeader = json['show_in_header'];
// //     isFeatured = json['is_featured'];
// //     bulkDiscountPercentage = json['bulk_discount_percentage'];
// //     image = json['image'];
// //     status = json['status'];
// //     createdAt = json['created_at'];
// //     name = json['name'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['show_in_header'] = this.showInHeader;
// //     data['is_featured'] = this.isFeatured;
// //     data['bulk_discount_percentage'] = this.bulkDiscountPercentage;
// //     data['image'] = this.image;
// //     data['status'] = this.status;
// //     data['created_at'] = this.createdAt;
// //     data['name'] = this.name;
// //     return data;
// //   }
// // }