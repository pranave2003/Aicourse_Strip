part of 'document_bloc.dart';

@immutable
sealed class DocumentState {}

final class DocumentInitial extends DocumentState {}

class DocumentsUploaded extends DocumentState {
  final String? transcriptUrl;
  final String? sopUrl;
  final String? lorUrl;
  final String? englishTestUrl;

  DocumentsUploaded({
    this.transcriptUrl,
    this.sopUrl,
    this.lorUrl,
    this.englishTestUrl,
  });

  @override
  List<Object?> get props => [
        transcriptUrl,
        sopUrl,
        lorUrl,
        englishTestUrl,
      ];
}
