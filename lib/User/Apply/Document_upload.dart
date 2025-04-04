import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Controller/Bloc/Applycourse/document_bloc.dart';

class Document_upload extends StatelessWidget {
  const Document_upload( {super.key});

  Future<String?> _uploadFile(String fileType) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      final file = result.files.single;
      final ref = FirebaseStorage.instance.ref(
          'documents/$fileType/${DateTime.now().millisecondsSinceEpoch}_${file.name}');
      await ref.putData(file.bytes!);
      return await ref.getDownloadURL();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DocumentBloc(),
      child: Scaffold(
          appBar: AppBar(title: const Text("Upload Documents")),
          body: BlocBuilder<DocumentBloc, DocumentState>(
            builder: (context, state) {
              String? transcriptUrl;
              String? sopUrl;
              String? lorUrl;
              String? englishTestUrl;

              if (state is DocumentsUploaded) {
                transcriptUrl = state.transcriptUrl;
                sopUrl = state.sopUrl;
                lorUrl = state.lorUrl;
                englishTestUrl = state.englishTestUrl;
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      UploadTile(
                        title: "Transcript",
                        uploaded: transcriptUrl != null,
                        fileUrl: transcriptUrl,
                        onTap: () async {
                          final url = await _uploadFile("transcript");
                          if (url != null) {
                            context
                                .read<DocumentBloc>()
                                .add(UploadTranscript(url));
                          }
                        },
                      ),
                      UploadTile(
                        title: "SOP",
                        uploaded: sopUrl != null,
                        fileUrl: sopUrl,
                        onTap: () async {
                          final url = await _uploadFile("sop");
                          if (url != null) {
                            context.read<DocumentBloc>().add(UploadSOP(url));
                          }
                        },
                      ),
                      UploadTile(
                        title: "LOR",
                        uploaded: lorUrl != null,
                        fileUrl: lorUrl,
                        onTap: () async {
                          final url = await _uploadFile("lor");
                          if (url != null) {
                            context.read<DocumentBloc>().add(UploadLOR(url));
                          }
                        },
                      ),
                      UploadTile(
                        title: "English Test",
                        uploaded: englishTestUrl != null,
                        fileUrl: englishTestUrl,
                        onTap: () async {
                          final url = await _uploadFile("englishTest");
                          if (url != null) {
                            context
                                .read<DocumentBloc>()
                                .add(UploadEnglishTest(url));
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: (transcriptUrl != null &&
                                sopUrl != null &&
                                lorUrl != null &&
                                englishTestUrl != null)
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SuccessPage()),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

class UploadTile extends StatelessWidget {
  final String title;
  final bool uploaded;
  final String? fileUrl;
  final VoidCallback onTap;

  const UploadTile({
    required this.title,
    required this.uploaded,
    required this.onTap,
    required this.fileUrl,
    super.key,
  });

  bool _isImage(String? url) {
    if (url == null) return false;
    return url.endsWith(".jpg") ||
        url.endsWith(".jpeg") ||
        url.endsWith(".png") ||
        url.endsWith(".gif");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(uploaded ? "Uploaded ✅" : "Not Uploaded"),
            const SizedBox(height: 6),
            if (uploaded && _isImage(fileUrl))
              Image.network(
                fileUrl!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )
            else if (uploaded)
              const Text("📄 File uploaded"),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: uploaded ? Colors.green : Colors.grey,
              textStyle: TextStyle(color: Colors.white)),
          onPressed: onTap,
          child: Text(
            uploaded ? "Reupload" : "Upload",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success")),
      body: const Center(child: Text("Documents uploaded successfully ✅")),
    );
  }
}
