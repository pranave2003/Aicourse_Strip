part of 'document_bloc.dart';

@immutable
sealed class DocumentEvent {}


class UploadTranscript extends DocumentEvent {
  final String url;
   UploadTranscript(this.url);

  @override
  List<Object> get props => [url];
}

class UploadSOP extends DocumentEvent {
  final String url;
   UploadSOP(this.url);

  @override
  List<Object> get props => [url];
}

class UploadLOR extends DocumentEvent {
  final String url;
   UploadLOR(this.url);

  @override
  List<Object> get props => [url];
}

class UploadEnglishTest extends DocumentEvent {
  final String url;
   UploadEnglishTest(this.url);

  @override
  List<Object> get props => [url];
}