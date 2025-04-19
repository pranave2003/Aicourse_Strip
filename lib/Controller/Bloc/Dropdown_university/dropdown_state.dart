part of 'dropdown_bloc.dart';

@immutable
sealed class DropdownState {}

final class DropdownInitial extends DropdownState {}


class fetchcatogorydropdownloading extends DropdownState {}

class catogoryLoadedDOMAIN extends DropdownState {
  final List<String> catogory;
  catogoryLoadedDOMAIN(this.catogory);
}

class FetchcatogotyError extends DropdownState {
  final String msg;
  FetchcatogotyError(this.msg);
}
