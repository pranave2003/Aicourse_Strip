part of 'collagedropdown_bloc.dart';

@immutable
sealed class CollagedropdownEvent {}

class FetchCollegeDetailsByName extends CollagedropdownEvent {
  final String collegename;

  FetchCollegeDetailsByName(this.collegename);
}