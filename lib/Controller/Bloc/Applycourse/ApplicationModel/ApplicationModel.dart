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
  String?applicationid;

  String? uaser_uid;
  String? username;
  String? userphone;
  String? Gender;
  String? userprofilephoto;
  String? userphone_number;
  String? useremail;
  String? userstate;
  String? usercountry;
  String? Transcript_doc_Url;
  String? Sop_doc_url;
  String? Education_doc_url;
  String? Travel_doc_url;

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
    required this.Universityid,
    required this.applicationid,
    required this.uaser_uid,
    required this.username,
    required this.userphone,
    required this.userstate,
    required this.usercountry,
    required this.userprofilephoto,
    required this.userphone_number,
    required this.useremail,
    required this.Gender,
    required this.Education_doc_url,
    required this.Transcript_doc_Url,
    required this.Sop_doc_url,
    required this.Travel_doc_url,
  });
  factory Applicationmodel.fromMap(Map<String, dynamic> data) {
    return Applicationmodel(
        Universityname: data["Universityname"],
        UniversityDescription: data["UniversityDescription"],
        collagename: data["collagename"],
        Coursename: data["Coursename"],
        status: data["status"],
        Ban: data["Ban"],
        Gender: data["Gender"],
        applicationid: data["applicationid"],
        Country: data["Country"],
        Degree_offered: data["Degree_offered"],
        collagecode: data["collagecode"],
        uaser_uid: data["uaser_uid"],
        username: data["username"],
        userphone: data["userphone"],
        usercountry: data["usercountry"],
        userstate: data["userstate"],
        userprofilephoto: data["userprofilephoto"],
        userphone_number: data["userphone_number"],
        useremail: data["useremail"],
        Education_doc_url: data["Education_doc_url"],
        Transcript_doc_Url: data["Transcript_doc_Url"],
        Sop_doc_url: data["Sop_doc_url"],
        Travel_doc_url: data["Travel_doc_url"],
      Universityid: data["Universityid"]

    );
  }
}
