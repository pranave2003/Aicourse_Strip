class Landloard_Model {
  String? email;
  String? password;
  String? uid;
  String? name;
  String? phone;
  String? gender;
  String? DOB;
  String? Place;
  String? Adress;
  String? Universityname;
  String? idproofimage;
  String? status;
  String? Ban;
  String? Onesignal_id;

  Landloard_Model(
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
  factory Landloard_Model.fromMap(Map<String, dynamic> data) {
    return Landloard_Model(
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
