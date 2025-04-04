import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  String? _transcriptUrl;
  String? _sopUrl;
  String? _lorUrl;
  String? _englishTestUrl;
  DocumentBloc() : super(DocumentInitial()) {
    on<UploadTranscript>((event, emit) {
      _transcriptUrl = event.url;
      print(_transcriptUrl);
      emit(DocumentsUploaded(
        transcriptUrl: _transcriptUrl,
        sopUrl: _sopUrl,
        lorUrl: _lorUrl,
        englishTestUrl: _englishTestUrl,
      ));
    });

    on<UploadSOP>((event, emit) {
      _sopUrl = event.url;
      emit(DocumentsUploaded(
        transcriptUrl: _transcriptUrl,
        sopUrl: _sopUrl,
        lorUrl: _lorUrl,
        englishTestUrl: _englishTestUrl,
      ));
    });

    on<UploadLOR>((event, emit) {
      _lorUrl = event.url;
      emit(DocumentsUploaded(
        transcriptUrl: _transcriptUrl,
        sopUrl: _sopUrl,
        lorUrl: _lorUrl,
        englishTestUrl: _englishTestUrl,
      ));
    });

    on<UploadEnglishTest>((event, emit) {
      _englishTestUrl = event.url;
      emit(DocumentsUploaded(
        transcriptUrl: _transcriptUrl,
        sopUrl: _sopUrl,
        lorUrl: _lorUrl,
        englishTestUrl: _englishTestUrl,
      ));
    });
  }
}
