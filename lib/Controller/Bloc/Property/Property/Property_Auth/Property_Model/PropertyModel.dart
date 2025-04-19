class Property_Model {
  String? propertyId;
  String? LandlordId;
  String? propertyName;
  String? propertyAddress;
  String? propertyArea;
  String? country;
  String? state;
  String? city;
  String? roomTypes;
  String? roomSizes;
  String? availableFrom;
  String? moveInDate;
  List<String>? propertyImageURL;
  String? aboutProperty;
  String? bedroom;
  String? bathroom;
  String? kitchen;
  String? furnishingOptions;
  String? propertyAmountWeek;
  String? propertyAmountMonth;
  String? tokenAmount;
  String? stayDurations;
  String? sexualOrientations;
  String? minimumStay;
  String? maximumStay;
  String? ownerName;
  String? ownerPhone;
  String? propertyTotal;
  String? parking;
  String? billStatus;
  String? pets;
  String? smoking;
  String? owneremail;
  String? ban;
  String? oneSignalId;
  String? location;
  String? NearestUniversity;

  Property_Model({
    this.propertyId,
    this.LandlordId,
    this.propertyName,
    this.propertyAddress,
    this.propertyArea,
    this.country,
    this.state,
    this.city,
    this.roomTypes,
    this.roomSizes,
    this.availableFrom,
    this.owneremail,
    this.moveInDate,
    this.propertyImageURL,
    this.aboutProperty,
    this.bedroom,
    this.bathroom,
    this.kitchen,
    this.furnishingOptions,
    this.propertyAmountWeek,
    this.propertyAmountMonth,
    this.tokenAmount,
    this.stayDurations,
    this.sexualOrientations,
    this.minimumStay,
    this.maximumStay,
    this.ownerName,
    this.ownerPhone,
    this.propertyTotal,
    this.parking,
    this.billStatus,
    this.pets,
    this.smoking,
    this.ban,
    this.oneSignalId,
    this.location,
    this.NearestUniversity,
  });

  factory Property_Model.fromMap(Map<String, dynamic> data) {
    return Property_Model(
        propertyId: data['propertyId'],
        LandlordId: data['LandlordId'],
        propertyName: data['propertyName'],
        propertyAddress: data['propertyAddress'],
        propertyArea: data['propertyArea'],
        country: data['country'],
        state: data['state'],
        owneremail: data['owneremail'],
        city: data['city'],
        roomTypes: data['roomTypes'],
        roomSizes: data['roomSizes'],
        availableFrom: data['availableFrom'],
        moveInDate: data['moveInDate'],
        propertyImageURL: List<String>.from(
            data['propertyImageURL'] ?? []), // ✅ casting array
        aboutProperty: data['aboutProperty'],
        bedroom: data['bedroom'],
        bathroom: data['bathroom'],
        kitchen: data['kitchen'],
        furnishingOptions: data['furnishingOptions'],
        propertyAmountWeek: data['propertyAmountWeek'],
        propertyAmountMonth: data['propertyAmountMonth'],
        tokenAmount: data['tokenAmount'],
        stayDurations: data['stayDurations'],
        sexualOrientations: data['sexualOrientations'],
        minimumStay: data['minimumStay'],
        maximumStay: data['maximumStay'],
        ownerName: data['ownerName'],
        ownerPhone: data['ownerPhone'],
        propertyTotal: data['propertyTotal'],
        parking: data['parking'],
        billStatus: data['billStatus'],
        pets: data['pets'],
        smoking: data['smoking'],
        ban: data['ban'],
        oneSignalId: data['oneSignalId'],
        location: data['location'],
        NearestUniversity: data["NearestUniversity"]);
  }
}
