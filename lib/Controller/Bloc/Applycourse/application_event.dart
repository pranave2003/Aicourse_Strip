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
class FetchApplication extends ApplicationEvent {
  final String? searchQuery;
  final String? uaser_uid;

  FetchApplication({required this.searchQuery,this.uaser_uid});
}

class FetchApplicationDetailsById extends ApplicationEvent {
  final String? Application_id;
  FetchApplicationDetailsById({required this.Application_id});
}



class DownloadImageFromFirebase extends ApplicationEvent {
  final String firebasePath; // Firebase Storage path, e.g. "images/sample.jpg"
  DownloadImageFromFirebase(this.firebasePath);
}
class AcceptOrRejectApplication extends ApplicationEvent {
  final String? applicationid;
  final String? Status;
  AcceptOrRejectApplication({this.applicationid, this.Status});
}