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


class ProfileImageFailure extends AuthState {
  final String error;
  ProfileImageFailure(this.error);

  @override
  List<Object?> get props => [error];
}


//






class UserByidLoaded1 extends AuthState {
  final UserModel Userdata;
  UserByidLoaded1({required this.Userdata});
}
class ProfileUpdateLoading extends AuthState {}

class profileaddSuccess extends AuthState {}

class UserError1 extends AuthState {
  final String message;
  UserError1(this.message);
}


// final class ProfileUpdateLoading extends AuthState {}
//
// final class profileaddSuccess extends AuthState {}
// final class profilefailerror extends AuthState {
//   final String error;
//
//   profilefailerror(this.error);
// }


class Userload extends AuthState {
  final UserModel user;

  Userload(
      this.user,
      );
}


//

//state
final class ProfileLoading extends AuthState {}

final class ProfileSuccess extends AuthState {}

final class Profilefailerror extends AuthState {
  final String error;

  Profilefailerror(this.error);
}

class Profileloaded extends AuthState {
  final List<UserModel> user;

  Profileloaded(
      this.user,
      );
}

class RefreshProfile extends AuthState {}