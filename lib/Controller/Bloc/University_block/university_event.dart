part of 'university_bloc.dart';

@immutable
sealed class UniversityEvent {}

// Signup
class University_Add_Event extends UniversityEvent {
  final University_model University;
  University_Add_Event({required this.University});
}


class FetchUniversity extends UniversityEvent {
  final String? searchQuery;
  FetchUniversity({required this.searchQuery});
}

// delete university By ID

class DeleteUniversity extends UniversityEvent {
  final String? Universityid;

  DeleteUniversity({required this.Universityid});
}
