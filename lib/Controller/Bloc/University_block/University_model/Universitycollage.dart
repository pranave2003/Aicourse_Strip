class Collagemodel {
  int? Rank;
  String? Established_date;
  String? Universityname;
  String? Admission_startdate;
  String? Admission_enddate;
  String? Country;
  String? UniversityimageURL;
  String? Collegename;
  String? collagecode;

  Collagemodel({
    this.Rank,
    this.Established_date,
    this.Universityname,
    this.Admission_startdate,
    this.Admission_enddate,
    this.Country,
    this.UniversityimageURL,
    this.Collegename,
    this.collagecode,
  });
  factory Collagemodel.fromMap(Map<String, dynamic> data) {
    return Collagemodel(
      Rank: data['Rank'],
      Established_date: data['Established_date'],
      Universityname: data['Universityname'],
      Admission_startdate: data['Admission_startdate'],
      Admission_enddate: data['Admission_enddate'],
      Country: data['Country'],
      UniversityimageURL: data['Universityimage'],
      collagecode: data['collagecode'],
      Collegename: data['Collegename'],
    );
  }
}
