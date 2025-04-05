part of 'application_bloc.dart';

@immutable
sealed class ApplicationEvent {}

class UploadUniversityphoto extends ApplicationEvent {}

class UploadSOPPhoto extends ApplicationEvent {}

class UploadLORPhoto extends ApplicationEvent {}

class Englishtest extends ApplicationEvent {}

class Applicationaddevent extends ApplicationEvent {
  final Applicationmodel application;
  Applicationaddevent({required this.application});
}
