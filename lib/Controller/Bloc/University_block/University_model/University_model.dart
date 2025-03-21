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

  University_model(
      {this.Universitytype,
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
        });
  factory University_model.fromMap(Map<String, dynamic> data) {
    return University_model(
      Universitytype: data['University Type'],
      Rank: data['Rank'],
      Established_date: data['Established Date'],
      Universityname: data['University Name'],
      Description: data['Description'],
      Admission_startdate: data['Admission start Date'],
      Ban: data['ban'],
      Onesignal_id: data['image'],
      Admission_enddate: data['Admission End Date'],
      Degree_offered: data['Degree Offered'],
      Course_offered: data['Course Offered'],
      Duration: data['Duration'],
      Tuition_fees: data['Tuition Fees'],
        Schoolarship_details: data[' Scholarship Details'],
      Eligibility_criteria: data[' Eligibility Criteria'],
      Terms_and_conditions: data['Terms and Conditions'],
      Country: data['Country'],
    );
  }
}