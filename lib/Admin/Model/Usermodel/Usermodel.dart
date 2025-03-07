class Usermodel {
  final String name;
  final int phone;
  final String Email;
  final String Country;
  final String District;
  final String UserId;

  Usermodel({
    required this.name,
    required this.phone,
    required this.Email,
    required this.Country,
    required this.District,
    required this.UserId,
  });
  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
        UserId: json["userid"] ?? "",
        phone: json["phone"] ?? "",
        name: json["name"] ?? "",
        Country: json["Country"] ?? "",
        District: json["District"] ?? "",
        Email: json["Email"] ?? "");
  }
}

List<Usermodel> Users = [
  Usermodel(
      name: "pranav",
      phone: 723786672,
      Email: "P@gmail.com",
      Country: "india",
      District: "Kozhikode",
      UserId: "sjdhddhgsjhfdjsgfdhfgjf")
];
