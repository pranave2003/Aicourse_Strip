class Bookingmodel {
  String? bookingid;
  String? propertyId;
  String? landlordId;
  String? username;
  String? userphonenumber;
  String? userid;
  String? status;
  String? propertystate;
  String? propertycity;
  String? propertycountry;
  String? propertyaddress;
  String? propertyName;
  String? checkindate;
  String? checkoutdate;
  String? ownername;
  String? owneremail;
  String? bookingdate;
  String? tokenamount;
  String? bookingtime;
  String? landlordname;
  String? landlordphone;
  String? useremail;
  String? propertyTotal;
  String? propertyImageURL;

  Bookingmodel({
    this.bookingid,
    this.propertyId,
    this.userid,
    this.username,
    this.userphonenumber,
    this.landlordId,
    this.propertyName,
    this.status,
    this.checkindate,
    this.checkoutdate,
    this.ownername,
    this.owneremail,
    this.bookingdate,
    this.tokenamount,
    this.bookingtime,
    this.propertystate,
    this.propertycity,
    this.propertycountry,
    this.propertyaddress,
    this.landlordname,
  this. landlordphone,
    this. useremail,
    this.  propertyTotal,
    this.  propertyImageURL,
  });

  factory Bookingmodel.fromMap(Map<String, dynamic> data) {
    return Bookingmodel(
        bookingid: data['bookingid'],
        landlordphone: data['landlordphone'],
        useremail: data['useremail'],
        propertyTotal: data['propertyTotal'],
        propertyImageURL: data['propertyImageURL'],
        propertyId: data['propertyId'],
        landlordId: data['landlordId'],
        userid: data['userid'],
        status: data['status'],
        username: data['username'],
        userphonenumber: data['userphonenumber'],
        propertyName: data['propertyName'],
        checkindate: data['checkindate'],
        checkoutdate: data['checkoutdate'],
        ownername: data['ownername'],
        owneremail: data['owneremail'],
        bookingdate: data['bookingdate'],
        tokenamount: data['tokenamount'],
        bookingtime: data['bookingtime'],
        propertystate: data['propertystate'],
        propertycity: data['propertycity'],
        propertycountry: data['propertycountry'],
        propertyaddress: data['propertyaddress'],
        landlordname: data["landlordname"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingid': bookingid,
      'propertyId': propertyId,
      'userid': userid,
      'username': username,
      'userphonenumber': userphonenumber,
      'landlordId': landlordId,
      'propertyName': propertyName,
      'checkindate': checkindate,
      'checkoutdate': checkoutdate,
      'ownername': ownername,
      'owneremail': owneremail,
      'bookingdate': bookingdate,
      'tokenamount': tokenamount,
      'status': status,
      'bookingtime': bookingtime,
      'propertystate': propertystate,
      'propertycity': propertycity,
      'propertycountry': propertycountry,
      'propertyaddress': propertyaddress,
    };
  }
}
