part of 'landloard_auth_bloc.dart';

@immutable
sealed class LandloardAuthState {}

final class LandloardAuthInitial extends LandloardAuthState {}

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
