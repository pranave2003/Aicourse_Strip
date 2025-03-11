// class Coursemodel {
//   final String Course_name;
//   final String Degree_name;
//   final String Course;
//   final String Education_level;
//   final String English_test;
//   final String Action;
//
//
//   Coursemodel({
//     required this.Course_name,
//     required this.Degree_name,
//     required this.Course,
//     required this.Education_level,
//     required this.English_test,
//     required this.Action,
//   });
//
//   factory Coursemodel.fromJson(Map<String, String> json) {
//     return Coursemodel(
//         University_name: json["name"] ?? "",
//         Country: json["email"] ?? "",
//         Type: json["trade"] ?? "",
//         Established: json["location"] ?? "",
//         Image: json["linkedin"] ?? "",
//         Id: json["github"] ?? "", English_test: '');
//   }
// }
//
// List<Coursemodel> students = [
//   Coursemodel(
//       University_name: "Calicut University",
//       Country: "India",
//       Type: "Public",
//       Established: "2003",
//       Image: "png",
//       Id: "342342", English_test: ''),
//   Coursemodel(
//       University_name: "Calicut University",
//       Country: "India",
//       Type: "Public",
//       Established: "2003",
//       Image: "png",
//       Id: "342342", English_test: ''),
//   Coursemodel(
//       University_name: "Calicut University",
//       Country: "India",
//       Type: "Public",
//       Established: "2003",
//       Image: "png",
//       Id: "342342", English_test: ''),
//   Coursemodel(
//       University_name: "Calicut University",
//       Country: "India",
//       Type: "Public",
//       Established: "2003",
//       Image: "png",
//       Id: "342342", English_test: ''),
// ];
class Coursemodel {
  final String countryName;
  final String degreeName;
  final String course;
  final String educationLevel;
  final String englishTest;

  Coursemodel({
    required this.countryName,
    required this.degreeName,
    required this.course,
    required this.educationLevel,
    required this.englishTest,
  });

  factory Coursemodel.fromJson(Map<String, dynamic> json) {
    return Coursemodel(
      countryName: json["country_name"] ?? "",
      degreeName: json["degree_name"] ?? "",
      course: json["course"] ?? "",
      educationLevel: json["education_level"] ?? "",
      englishTest: json["english_test"] ?? "",
    );
  }
}

// Sample Data Matching the Image
List<Coursemodel> students = [
  Coursemodel(
    countryName: "United States",
    degreeName: "Bachelors",
    course: "Physics",
    educationLevel: "Plus two",
    englishTest: "IELTS",
  ),
  Coursemodel(
    countryName: "United States",
    degreeName: "Bachelors",
    course: "Physics",
    educationLevel: "Plus two",
    englishTest: "IELTS",
  ),
  Coursemodel(
    countryName: "United States",
    degreeName: "Bachelors",
    course: "Physics",
    educationLevel: "Plus two",
    englishTest: "IELTS",
  ),
];

