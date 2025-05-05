class UserModel {
  String? email;
  String? password;
  String? uid;
  String? name;
  String? phone_number;
  String? status;
  String? Ban;
  String? Country;
  String? Gender;
  String? state;
  String? City;
  String? Onesignal_id;
  String? District;
  String? image;

  UserModel(
      {this.email,
      this.password,
      this.name,
      this.uid,
      this.phone_number,
      this.status,
      this.Ban,
      this.state,
      this.Country,
      this.Gender,
      this.City,
      this.Onesignal_id,
      this.District,
      this.image});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      email: data['email'],
      password: data['password'],
      uid: data['userId'],
      name: data['name'],
      phone_number: data['phone_number'],
      status: data['status'],
      Ban: data['ban'],
      Gender: data['Gender'],
      Onesignal_id: data['image'],
      Country: data['Country'],
      state: data['state'],
      City: data['City'],
      District: data['District'],
      image: data['image'],
    );
  }
}
