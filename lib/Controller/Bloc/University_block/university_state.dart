part of 'university_bloc.dart';

@immutable
sealed class UniversityState {}

final class UniversityInitial extends UniversityState {}



final class UniversityLoading extends UniversityState {}

final class UniversityaddSuccess extends UniversityState {}

final class Universityfailerror extends UniversityState {
  final String error;

  Universityfailerror(this.error);
}