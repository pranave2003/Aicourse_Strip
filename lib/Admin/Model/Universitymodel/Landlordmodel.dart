import 'package:course_connect/Admin/View/Screens/Landlord/New_Landlords.dart';
//
// class Landlordmodel {
//   final String S_NO;
//   final String Name;
//   final String Email;
//   final String Phone_number;
//   final String Address;
//   final String Gender;
//   final String ID_Proof;
//
//
//
//
//   Landlordmodel({
//     required this.S_NO,
//     required this.Name,
//     required this.Email,
//     required this.Phone_number,
//     required this.Address,
//     required this.Gender,
//     required this.ID_Proof,
//   });
//
//   factory Landlordmodel.fromJson(Map<String, String> json) {
//     return Landlordmodel(
//         S_NO: json["1"] ?? "",
//         Name: json["nafiya"] ?? "",
//         Email: json["nafiya@gmail.com"] ?? "",
//         Phone_number: json["907890685960"] ?? "",
//         Address: json["kattangal"] ?? "",
//         Gender: json["female"] ?? "",
//         ID_Proof: json["Adhar"] ?? "");
//   }
// }
//
// List<Landlordmodel> students = [
//   Landlordmodel(
// S_NO: "1",
// Name: "nafiya",
// Email:"nafiya@gmail.com",
// Phone_number:"907890685960",
// Address: "kattangal",
// Gender:"female",
// ID_Proof:"Adhar"),
//
// ];
class LandlordModel {
  final String S_NO;
  final String Name;
  final String Email;
  final String Phone_no; // Changed from "Phone_number"
  final String Address;
  final String Gender;
  final String ID_Proof;

  LandlordModel({
    required this.S_NO,
    required this.Name,
    required this.Email,
    required this.Phone_no, // Ensure consistency
    required this.Address,
    required this.Gender,
    required this.ID_Proof,
  });
  factory LandlordModel.fromJson(Map<String, dynamic> json) {
    return LandlordModel(
      S_NO: json["S_NO"] ?? "",
      Name: json["Name"] ?? "",
      Email: json["Email"] ?? "",
      Phone_no: json["Phone_no"] ?? "",
      Address: json["Address"] ?? "",
      Gender: json["Gender"] ?? "",
      ID_Proof: json["ID_Proof"] ?? "",
    );
  }
  List<LandlordModel> landlords = [
    LandlordModel(
      S_NO: "1",
      Name: "Nafiya",
      Email: "nafiya@gmail.com",
      Phone_no: "907890685960",
      Address: "Kattangal",
      Gender: "Female",
      ID_Proof: "Aadhar",
    ),
  ];


}