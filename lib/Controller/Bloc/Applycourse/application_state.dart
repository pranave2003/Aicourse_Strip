part of 'application_bloc.dart';

@immutable
sealed class ApplicationState {}

final class ApplicationInitial extends ApplicationState {}

final class addapplicationloadingstate extends ApplicationState {}

final class addapplicationAddSuccessstate extends ApplicationState {}

final class addapplicationFailerrorstate extends ApplicationState {
  final String error;
  addapplicationFailerrorstate({required this.error});
}
final class ApplicationLoading extends ApplicationState {}

final class RefreshApplication extends ApplicationState {}

final class Applicationfailerror extends ApplicationState {
  final String error;

  Applicationfailerror(this.error);
}
class Application_loaded extends ApplicationState {
  final List<Applicationmodel> Application;

  Application_loaded(
      this.Application,
      );
}

