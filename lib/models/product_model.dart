// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int? totalSize;
  int? typeId;
  int? offset;
  List<ProductModel>? products;

  Product({
    this.totalSize,
    this.typeId,
    this.offset,
    this.products,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        totalSize: json["total_size"],
        typeId: json["type_id"],
        offset: json["offset"],
        products: json["products"] == null
            ? []
            : List<ProductModel>.from(
                json["products"]!.map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "type_id": typeId,
        "offset": offset,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  // String? price;
  int? price;
  int? stars;
  String? img;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? typeId;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: int.tryParse(json["price"].toString()),
        stars: int.tryParse(json["stars"].toString()),
        img: json["img"],
        location: json["location"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        typeId: int.tryParse(json["type_id"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "img": img,
        "location": location,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "type_id": typeId,
      };
}
