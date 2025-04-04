class Applicationmodel {
  String? Universityname;
  String? UniversityDescription;
  String? collagename;
  String? Coursename;
  String? status;
  String? Ban;
  String? Country;
  String? Degree_offered;
  String? Universityid;
  String? collagecode;

  String? uaser_uid;
  String? username;
  String? userphone;
  String? gender;
  String? userprofilephoto;
  String? userphone_number;
  String? useremail;

  Applicationmodel({
    required this.Universityname,
    required this.UniversityDescription,
    required this.collagename,
    required this.Coursename,
    required this.status,
    required this.Ban,
    required this.Country,
    required this.Degree_offered,
    required this.collagecode,
    required this.uaser_uid,
    required this.username,
    required this.userphone,
    required this.gender,
    required this.userprofilephoto,
    required this.userphone_number,
    required this.useremail,
  });
  factory Applicationmodel.fromMap(Map<String, dynamic> data) {
    return Applicationmodel(
        Universityname: data["Universityname"],
        UniversityDescription: data["UniversityDescription"],
        collagename: data["collagename"],
        Coursename: data["Coursename"],
        status: data["status"],
        Ban: data["Ban"],
        Country: data["Country"],
        Degree_offered: data["Degree_offered"],
        collagecode: data["collagecode"],
        uaser_uid: data["uaser_uid"],
        username: data["username"],
        userphone: data["userphone"],
        gender: data["gender"],
        userprofilephoto: data["userprofilephoto"],
        userphone_number: data["userphone_number"],
        useremail: data["useremail"]);
  }
}
