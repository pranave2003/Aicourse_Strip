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
class Course_loaded extends UniversityState {
  final List<University_model> course;

  Course_loaded(
    this.course,
  );
}

final class Coursesgetloading extends UniversityState {}

final class UniversitysCoursefailerror extends UniversityState {
  final String error;

  UniversitysCoursefailerror(this.error);
}

final class UniversityModel extends UniversityState {
  final University_model university;
  UniversityModel(this.university);
}

//photo upload

final class ImageuploadLoading extends UniversityState {}

final class Imageuploadedurl extends UniversityState {
  String Imageurl;
  Imageuploadedurl(this.Imageurl);
}

final class ProfileImageFailure extends UniversityState {
  String error;
  ProfileImageFailure(this.error);
}

final class Imageuploadsuccss extends UniversityState {}
