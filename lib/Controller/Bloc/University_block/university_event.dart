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

class FetchAllUniversites extends UniversityEvent {
  final String? searchQuery;
  FetchAllUniversites({required this.searchQuery});
}

class Fetchallcollage extends UniversityEvent {
  final String? searchQuery;
  final String? University;
  Fetchallcollage({required this.searchQuery, required this.University});
}

class Fetchcourse_colleges extends UniversityEvent {
  final String? searchQuery;
  final String? University;
  final String? college;
  Fetchcourse_colleges(
      {required this.searchQuery, this.University, this.college});
}
// delete university By ID

class DeleteUniversity extends UniversityEvent {
  final String? Universityid;

  DeleteUniversity({required this.Universityid});
}

class University_Edit_Event extends UniversityEvent {
  final University_model University;

  University_Edit_Event({required this.University});
}

class FetchCourseDetailsById extends UniversityEvent {
  final String? searchQuery;

  final String? CourseUniversity_id;
  FetchCourseDetailsById({required this.CourseUniversity_id, required this.searchQuery});
}

/**/

class UploadUniversityphoto extends UniversityEvent {}
