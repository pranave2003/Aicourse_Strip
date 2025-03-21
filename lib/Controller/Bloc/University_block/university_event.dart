part of 'university_bloc.dart';

@immutable
sealed class UniversityEvent {}

// Signup
class University_Add_Event extends UniversityEvent {
  final University_model University;
  University_Add_Event({required this.University});
}
