class RegisterModel {
  RegisterModel({
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.phone = '',
  });
  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json['name'] != null ? json['name'].toString() : '',
        lastName: json['last_name'] != null ? json['last_name'].toString() : '',
        email: json['email'] != null ? json['email'].toString() : '',
        password: json['password'] != null ? json['password'].toString() : '',
        phone: json['phone'] != null ? json['phone'].toString() : '',
      );
  String name;
  String lastName;
  String email;
  String password;
  String phone;

  RegisterModel copyWith({
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? phone,
  }) =>
      RegisterModel(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'last_name': lastName,
        'email': email,
        'password': password,
        'phone': phone,
      };
}
