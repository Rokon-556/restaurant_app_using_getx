class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int orderCount;

  UserModel(
      {required this.name,
      required this.email,
      required this.id,
      required this.orderCount,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['f_name'],
        email: json['email'],
        id: json['id'],
        orderCount: int.tryParse(json['order_count'].toString())!,
        phone: json['phone']);
  }
}
