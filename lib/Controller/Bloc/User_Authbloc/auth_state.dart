part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class Authloading extends AuthState {}

class Authenticated extends AuthState {
  User? user;
  Authenticated(this.user);
}

class UnAuthenticated extends AuthState {}

class AuthenticatedError extends AuthState {
  final String message;

  AuthenticatedError({required this.message});
}
//
final class UserByidLoaded extends AuthState {
  final UserModel Userdata;
  UserByidLoaded(this.Userdata);
}
class Userloading extends AuthState {}

class UserError extends AuthState {
  String error;
  UserError({required this.error});
}



// get al user

final class UsersLoading extends AuthState {}

final class UsersGetSuccess extends AuthState {}

final class Usersfailerror extends AuthState {
  final String error;

  Usersfailerror(this.error);
}

class Usersloaded extends AuthState {
  final List<UserModel> Users;

  Usersloaded(
      this.Users,
      );
}
class ProfileImageInitial extends AuthState {}

class ProfileImageLoading extends AuthState {}

class ProfileImageSuccess extends AuthState {
  final String image;

  ProfileImageSuccess(this.image);
}
class ProfileSuccess extends AuthState {
  final String name;
  final String phone_number;

  ProfileSuccess(this.name,this.phone_number);
}


class ProfileImageFailure extends AuthState {
  final String error;
  ProfileImageFailure(this.error);

  @override
  List<Object?> get props => [error];
}