part of 'application_bloc.dart';

@immutable
sealed class ApplicationState {}

final class ApplicationInitial extends ApplicationState {}

final class TranscriptionuploadLoading extends ApplicationState {}

final class SoploadLoading extends ApplicationState {}

final class LorUploadLoading extends ApplicationState {}

final class EnglishtestUploadLoading extends ApplicationState {}

class TranscriptUploaded extends ApplicationState {
  final String imageUrl;
  TranscriptUploaded(this.imageUrl);
}

class SOPUploaded extends ApplicationState {
  final String imageUrl;
  SOPUploaded(this.imageUrl);
}

class LORUploaded extends ApplicationState {
  final String imageUrl;
  LORUploaded(this.imageUrl);
}

class Englishtestdocument extends ApplicationState {
  final String imageUrl;
  Englishtestdocument(this.imageUrl);
}

final class ProfileImageFailure extends ApplicationState {
  String error;
  ProfileImageFailure(this.error);
}

final class Imageuploadsuccss extends ApplicationState {}
