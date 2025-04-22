part of 'collagedropdown_bloc.dart';

@immutable
sealed class CollagedropdownState {}

final class CollagedropdownInitial extends CollagedropdownState {}
class collagedropdownloading extends CollagedropdownState {}

class CollageFullDataLoaded extends CollagedropdownState {
  final Collagemodel college;

  CollageFullDataLoaded(this.college);
}

class Error extends CollagedropdownState {
  final String msg;
Error(this.msg);
}
