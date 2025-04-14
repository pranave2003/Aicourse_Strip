part of 'landloard_auth_bloc.dart';

@immutable
String? idproofimage;

sealed class LandloardAuthState {}

final class LandloardAuthInitial extends LandloardAuthState {}

class Authloading extends LandloardAuthState {}

class Authenticated extends LandloardAuthState {
  User? user;
  Authenticated(this.user);
}

class UnAuthenticated extends LandloardAuthState {}

class AuthenticatedError extends LandloardAuthState {
  final String message;

  AuthenticatedError({required this.message});
}

final class LandlordByidLoaded extends LandloardAuthState {
  final Landloard_Model Userdata;
  LandlordByidLoaded(this.Userdata);
}

class Landlordloading extends LandloardAuthState {}

class LandloardError extends LandloardAuthState {
  String error;
  LandloardError({required this.error});
}

// fetch  all landLoard

// get al user

final class LandloardessLoading extends LandloardAuthState {}

final class LandloardsgetGetSuccess extends LandloardAuthState {}

final class Landloardfailfailerror extends LandloardAuthState {
  final String error;

  Landloardfailfailerror(this.error);
}

class Landloaredloaded extends LandloardAuthState {
  final List<Landloard_Model> landloareds;

  Landloaredloaded(
    this.landloareds,
  );
}

// accept or reject

class AcceptorrejectLoadingstate extends LandloardAuthState {}

class Acceptorrejectstate extends LandloardAuthState {}

class AcceptorrejectErrorstate extends LandloardAuthState {
  final String error;

  AcceptorrejectErrorstate(this.error);
}
final class Imageuploadedurl extends LandloardAuthState {
  String Imageurl;
  Imageuploadedurl(this.Imageurl);
}
final class ImageuploadLoading extends LandloardAuthState {}


final class ProfileImageFailure extends LandloardAuthState {
  String error;
  ProfileImageFailure(this.error);
}

