class UserModel {
  String id;
  String fullname;
  String email;
  String dateOfBirth;
  int point;
  String phone;
  String address;
  String purpose;

  UserModel(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.dateOfBirth,
      required this.point,
      required this.phone,
      required this.address,
      required this.purpose});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"] ?? "",
      fullname: json["fullname"] ?? "",
      email: json["email"] ?? "",
      dateOfBirth: json["date_of_birth"] ?? "",
      point: json["point"] ?? 0,
      phone: json["phone"] ?? "",
      address: json["address"] ?? "",
      purpose: json["purpose"] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "date_of_birth": dateOfBirth,
        "point": point,
        "phone": phone,
        "address": address,
        "purpose": purpose
      };
}
