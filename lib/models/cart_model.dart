import 'package:food_delivery/models/product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? productModel;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.img,
      this.isExist,
      this.time,
      this.productModel});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        img: json["img"],
        quantity: json["quantity"],
        isExist: json["isExist"],
        time: json["time"],
        productModel: ProductModel.fromJson(json['product']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "img": img,
        "quantity": quantity,
        "isExist": isExist,
        "time": time,
        "product": productModel!.toJson()
      };
}
