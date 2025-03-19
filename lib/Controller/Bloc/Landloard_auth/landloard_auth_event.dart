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
class FetchLandlordDetailsById extends LandloardAuthEvent {}