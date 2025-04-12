part of 'application_bloc.dart';

@immutable
sealed class ApplicationState {}

final class ApplicationInitial extends ApplicationState {}

final class addapplicationloadingstate extends ApplicationState {}

final class addapplicationAddSuccessstate extends ApplicationState {}

final class addapplicationFailerrorstate extends ApplicationState {
  final String error;
  addapplicationFailerrorstate({required this.error});
}

final class ApplicationLoading extends ApplicationState {}

final class RefreshApplication extends ApplicationState {}

final class Applicationfailerror extends ApplicationState {
  final String error;

  Applicationfailerror(this.error);
}

class Application_loaded extends ApplicationState {
  final List<Applicationmodel> Application;

  Application_loaded(
    this.Application,
  );
}

final class Applicationgetloading extends ApplicationState {}

final class ApplicationLoaded extends ApplicationState {
  final Applicationmodel application;
  ApplicationLoaded(this.application);
}


class ImageDownloading extends ApplicationState {}

class ImageDownloaded extends ApplicationState {
  final String filePath;
  ImageDownloaded(this.filePath);
}

class ImageDownloadError extends ApplicationState {
  final String message;
  ImageDownloadError(this.message);
}
class AcceptorrejectLoadingstate extends ApplicationState {}

class Refresh extends ApplicationState {}

class AcceptorrejectErrorstate extends ApplicationState {
  final String error;

  AcceptorrejectErrorstate(this.error);
}

