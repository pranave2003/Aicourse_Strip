class UserModel {
  String? email;
  String? password;
  String? uid;
  String? name;
  String? phone;
  String? status;
  String? Ban;
  String? Country;
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
      this.phone,
      this.status,
      this.Ban,
      this.state,
      this.Country,
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
      phone: data['phone_number'],
      status: data['status'],
      Ban: data['ban'],
      Onesignal_id: data['image'],
      Country: data['Country'],
      state: data['state'],
      City: data['City'],
      District: data['District'],
      image: data['image'],
    );
  }
}
