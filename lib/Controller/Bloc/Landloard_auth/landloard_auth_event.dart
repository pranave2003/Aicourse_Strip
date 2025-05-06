part of 'landloard_auth_bloc.dart';

@immutable
sealed class LandloardAuthEvent {}

// check auth or not
class checkloginLandloardstateevent extends LandloardAuthEvent {}

// login

class Landloard_LoginEvent extends LandloardAuthEvent {
  final String Email;
  final String Password;

  Landloard_LoginEvent({required this.Email, required this.Password});
}

// Signup
class LandloardSignupEvent extends LandloardAuthEvent {
  final Landloard_Model user;
  LandloardSignupEvent({required this.user});
}

//signout

class LandloardSigOutEvent extends LandloardAuthEvent {}

// fetch by id
class FetchLandlordDetailsById extends LandloardAuthEvent {
  final String? getid;
  FetchLandlordDetailsById({this.getid});
}

// fetch all landloard

class FetchLandloards extends LandloardAuthEvent {
  final String? searchQuery;
  final String? status;
  FetchLandloards({required this.searchQuery, required this.status});
}

// acccept or reject


class AcceptOrRejectLandloard extends LandloardAuthEvent {
  final String? Landloaredid;
  final String? Status;
  AcceptOrRejectLandloard({this.Landloaredid, this.Status});
}
class Uploadidproofphoto extends LandloardAuthEvent {}
//
class Removeaccount extends LandloardAuthEvent {}
class UpdateProfileEvent extends LandloardAuthEvent {
  final Landloard_Model profile;
  UpdateProfileEvent({required this.profile});
}


class EditProfile extends LandloardAuthEvent {
  final Landloard_Model user;
  final String profile; // <-- Add this

  EditProfile({required this.user, required this.profile});
}
class PickAndUploadImageEvent extends LandloardAuthEvent {
  final String profile; // 🔧 Required for Firestore update

  PickAndUploadImageEvent({required this.profile});
}
class ProfileUpdateLoading extends LandloardAuthEvent {}
