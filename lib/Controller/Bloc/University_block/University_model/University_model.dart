class University_model {
  String? Universitytype;
  String? Rank;
  String? Established_date;
  String? Universityname;
  String? Description;
  String? gender;
  String? DOB;
  String? Place;
  String? Adress;
  String? Universityname;
  String? idproofimage;
  String? status;
  String? Ban;
  String? Onesignal_id;

  University_model(
      {this.email,
        this.password,
        this.name,
        this.uid,
        this.phone,
        this.DOB,
        this.gender,
        this.Adress,
        this.idproofimage,
        this.status,
        this.Ban,
        this.Onesignal_id,
        this.Place,
        this.Universityname});
  factory University_model.fromMap(Map<String, dynamic> data) {
    return University_model(
      email: data['email'],
      password: data['password'],
      uid: data['userId'],
      name: data['name'],
      phone: data['phone_number'],
      status: data['status'],
      Ban: data['ban'],
      Onesignal_id: data['image'],
      idproofimage: data['idproofimage'],
      Place: data['Place'],
      Universityname: data['University'],
      gender: data['gender'],
      DOB: data['dob'],
      Adress : data['address'],

    );
  }
}