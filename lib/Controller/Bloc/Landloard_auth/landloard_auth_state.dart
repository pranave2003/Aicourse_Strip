part of 'landloard_auth_bloc.dart';

@immutable
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
