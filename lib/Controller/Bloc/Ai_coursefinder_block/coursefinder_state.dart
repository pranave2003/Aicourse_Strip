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

