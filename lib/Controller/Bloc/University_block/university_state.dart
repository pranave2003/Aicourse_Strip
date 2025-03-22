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

final class UniversitysLoading extends UniversityState {}

final class RefreshUniversity extends UniversityState {}

final class Universitysfailerror extends UniversityState {
  final String error;

  Universitysfailerror(this.error);
}

class University_loaded extends UniversityState {
  final List<University_model> University;

  University_loaded(
    this.University,
  );
}


