class SignUpBody {
  final String name;
  final String email;
  final String phone;
  final String password;

  SignUpBody(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["f_name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
