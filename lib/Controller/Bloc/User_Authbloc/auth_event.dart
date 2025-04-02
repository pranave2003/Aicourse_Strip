part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

// check auth or not
class checkloginstateevent extends AuthEvent {}

// login

class LoginEvent extends AuthEvent {
  final String Email;
  final String Password;

  LoginEvent({required this.Email, required this.Password});
}

// Signup
class SignupEvent extends AuthEvent {
  final UserModel user;
  SignupEvent({required this.user});
}

//signout

class SigOutEvent extends AuthEvent {}
// inorder to get full details of user
class FetchUserDetailsById extends AuthEvent {}

//fetch all user

class FetchUsers extends AuthEvent {
  final String? searchQuery;
  FetchUsers({required this.searchQuery});
}
class PickAndUploadImageEvent extends AuthEvent {}