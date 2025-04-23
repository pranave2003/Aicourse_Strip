part of 'dropdown_bloc.dart';

@immutable
sealed class DropdownEvent {}

class Fetchcatogorybydropdown extends DropdownEvent {
  final String? service;

  Fetchcatogorybydropdown({
    this.service,
  });
}

class Fetchcatcollagebydropdown extends DropdownEvent {}

class FetchchUniversitynamebydropdown extends DropdownEvent {}


