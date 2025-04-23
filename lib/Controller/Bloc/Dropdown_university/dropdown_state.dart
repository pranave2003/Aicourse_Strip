part of 'dropdown_bloc.dart';

@immutable
sealed class DropdownState {}

final class DropdownInitial extends DropdownState {}

class fetchcatogorydropdownloading extends DropdownState {}

class fetchcollagedropdownloading extends DropdownState {}

class fetchcollagerefresh extends DropdownState {}

class catogoryLoadedDOMAIN extends DropdownState {
  final List<String> catogory;
  catogoryLoadedDOMAIN(this.catogory);
}

class CollageLoadedDOMAIN extends DropdownState {
  final List<String> catogory;
  CollageLoadedDOMAIN(this.catogory);
}
class UniversitymasterLoadedDOMAIN extends DropdownState {
  final List<String> universitymaster;
  UniversitymasterLoadedDOMAIN(this.universitymaster);
}

// class CollageFullDataLoaded extends DropdownState {
//   final Collagemodel college;
//
//   CollageFullDataLoaded(this.college);
// }

class FetchcatogotyError extends DropdownState {
  final String msg;
  FetchcatogotyError(this.msg);
}
