import '../University_block/University_model/University_model.dart';

final class UniversitysLoading {}

final class RefreshUniversity extends CoursefinderState {}

class CoursefinderState {
}

final class Universitysfailerror extends CoursefinderState {
  final String error;

  Universitysfailerror(this.error);
}

class University_loaded extends CoursefinderState {
  final List<University_model> University;

  University_loaded(
      this.University,
      );
}



class CoursefinderInitial extends CoursefinderState {}

class CoursefinderLoading extends CoursefinderState {}

class CoursefinderLoaded extends CoursefinderState {
  final List<University_model> universities;
  CoursefinderLoaded(this.universities);
}

class CoursefinderFailError extends CoursefinderState {
  final String error;
  CoursefinderFailError(this.error);
}


