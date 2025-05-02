class University_model {
  int? Rank;
  String? Established_date;
  String? Universityname;
  String? Description;
  String? Admission_startdate;
  String? Admission_enddate;
  String? Degree_offered;
  String? Course_offered;
  String? Tuition_fees;
  String? Duration;
  String? Schoolarship_details;
  String? Eligibility_criteria;
  String? Terms_and_conditions;
  String? Country;
  String? Ban;
  String? Onesignal_id;
  String? UniversityimageURL;
  String? Universityid;
  String? highestEducation;
  num? highestEducationpercentage;
  String? AcadamicTest;
  num? AcadamicTestPercentage;
  String? Englishtest;
  num? Englishtestpercentage;
  String? Collegename;
  String? collagecode;

  ///
  List<String>? SelectedScheme;
  List<String>? Selectedboard;

  University_model(
      {this.Universityid,
      this.Rank,
      this.Established_date,
      this.Universityname,
      this.Description,
      this.Admission_startdate,
      this.Admission_enddate,
      this.Degree_offered,
      this.Course_offered,
      this.Duration,
      // this.state,
      // this.city,
      this.Tuition_fees,
      this.Schoolarship_details,
      this.Eligibility_criteria,
      this.Terms_and_conditions,
      this.Ban,
      this.Onesignal_id,
      this.Country,
      this.UniversityimageURL,
      this.highestEducation,
      this.AcadamicTest,
      this.AcadamicTestPercentage,
      this.Englishtest,
      this.Englishtestpercentage,
      this.highestEducationpercentage,
      this.Collegename,
      this.collagecode,
      /////
      this.Selectedboard,
      this.SelectedScheme});
  factory University_model.fromMap(Map<String, dynamic> data) {
    return University_model(
      Rank: data['Rank'],
      Established_date: data['Established_date'],
      Universityname: data['Universityname'],
      Description: data['Description'],
      Admission_startdate: data['Admission_startdate'],
      Ban: data['Ban'],
      Onesignal_id: data['Onesignal_id'],
      Admission_enddate: data['Admission_enddate'],
      Degree_offered: data['Degree_offered'],
      Course_offered: data['Course_offered'],
      Duration: data['Duration'],
      Tuition_fees: data['Tuition_fees'],
      // city: data['city'],
      // state: data['state'],
      Schoolarship_details: data['Schoolarship_details'],
      Eligibility_criteria: data['Eligibility_criteria'],
      Terms_and_conditions: data['Terms_and_conditions'],
      Country: data['Country'],
      Universityid: data['Universityid'],
      UniversityimageURL: data['Universityimage'],
      AcadamicTest: data['AcadamicTest'],
      AcadamicTestPercentage: data['AcadamicTestPercentage'] ?? 0,
      Englishtest: data['Englishtest'],
      Englishtestpercentage: data['Englishtestpercentage'] ?? 0,
      highestEducation: data['highestEducation'],
      highestEducationpercentage: data['highestEducationpercentage'] ?? 0,
      collagecode: data['collagecode'],
      Collegename: data['Collegename'],

      //////////
      // Selectedboard: List<String>.from(data['Selectedboard'] ?? []),
      // SelectedScheme: List<String>.from(data['SelectedScheme'] ?? []),
    );
  }
}
