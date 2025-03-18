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
class SignupEvent extends LandloardAuthEvent {
  final LandlordModel user;
  SignupEvent({required this.user});
}

//signout

class LandloardSigOutEvent extends LandloardAuthEvent {}
