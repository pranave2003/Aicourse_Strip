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
