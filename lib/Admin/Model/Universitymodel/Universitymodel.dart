class Universitymodel {
  final String University_name;
  final String Country;
  final String Type;
  final String Established;
  final String Image;
  final String Id;


  Universitymodel({
    required this.University_name,
    required this.Country,
    required this.Type,
    required this.Established,
    required this.Image,
    required this.Id, required String English_test,
  });

  factory Universitymodel.fromJson(Map<String, String> json) {
    return Universitymodel(
        University_name: json["name"] ?? "",
        Country: json["email"] ?? "",
        Type: json["trade"] ?? "",
        Established: json["location"] ?? "",
        Image: json["linkedin"] ?? "",
        Id: json["github"] ?? "", English_test: '');
  }
}

List<Universitymodel> students = [
  Universitymodel(
      University_name: "Calicut University",
      Country: "India",
      Type: "Public",
      Established: "2003",
      Image: "png",
      Id: "342342", English_test: ''),
  Universitymodel(
      University_name: "Calicut University",
      Country: "India",
      Type: "Public",
      Established: "2003",
      Image: "png",
      Id: "342342", English_test: ''),
  Universitymodel(
      University_name: "Calicut University",
      Country: "India",
      Type: "Public",
      Established: "2003",
      Image: "png",
      Id: "342342", English_test: ''),
  Universitymodel(
      University_name: "Calicut University",
      Country: "India",
      Type: "Public",
      Established: "2003",
      Image: "png",
      Id: "342342", English_test: ''),
];
