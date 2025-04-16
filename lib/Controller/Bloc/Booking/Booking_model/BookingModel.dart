class Bookingmodel {
  String? bookingid;
  String? propertyId;
  String? landlordId;
  String? username;
  String? userphonenumber;
  String? useremail;
  String? userid;
  String? ban;
  String? status;
  String? propertystate;
  String? propertycity;
  String? propertycountry;
  String? propertyaddress;
  String? propertyName;
  String? checkindate;
  String? checkoutdate;
  String? bookingdate;
  String? tokenamount;
  String? bookingtime;
  String? landlordname;
  String? owneremail;
  String? landlordphone;
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
    this.bookingdate,
    this.ban,
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
    this.owneremail,

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
        bookingdate: data['bookingdate'],
        tokenamount: data['tokenamount'],
        bookingtime: data['bookingtime'],
        propertystate: data['propertystate'],
        propertycity: data['propertycity'],
        ban: data['ban'],
        propertycountry: data['propertycountry'],
        propertyaddress: data['propertyaddress'],
        landlordname: data["landlordname"],
        owneremail:data['owneremail']
    );

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
      'landlordname': landlordname,
      'landlordphone': landlordphone,
      'useremail': useremail,
      'propertyTotal': propertyTotal,
      'propertyImageURL': propertyImageURL,
      'owneremail':owneremail,
      'bookingdate': bookingdate,
      'tokenamount': tokenamount,
      'ban': ban,
      'status': status,
      'bookingtime': bookingtime,
      'propertystate': propertystate,
      'propertycity': propertycity,
      'propertycountry': propertycountry,
      'propertyaddress': propertyaddress,
    };
  }
}
