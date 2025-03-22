class University_model {
  String? Universitytype;
  String? Rank;
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

  University_model(
      {this.Universitytype,
        this.Universityid,
      this.Rank,
      this.Established_date,
      this.Universityname,
      this.Description,
      this.Admission_startdate,
      this.Admission_enddate,
      this.Degree_offered,
      this.Course_offered,
      this.Duration,
      this.Tuition_fees,
      this.Schoolarship_details,
      this.Eligibility_criteria,
      this.Terms_and_conditions,
      this.Ban,
      this.Onesignal_id,
      this.Country,
      this.UniversityimageURL});
  factory University_model.fromMap(Map<String, dynamic> data) {
    return University_model(
        Universitytype: data['Universitytype'],
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
        Schoolarship_details: data['Schoolarship_details'],
        Eligibility_criteria: data['Eligibility_criteria'],
        Terms_and_conditions: data['Terms_and_conditions'],
        Country: data['Country'],
        Universityid:data['Universityid'],
        UniversityimageURL: data['UniversityImageUrl']);

  }
}
