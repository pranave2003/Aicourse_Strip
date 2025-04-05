import 'package:course_connect/Controller/Bloc/Applycourse/ApplicationModel/ApplicationModel.dart';
import 'package:course_connect/Controller/Bloc/Applycourse/application_bloc.dart';
import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../Controller/Bloc/Applycourse/document_bloc.dart';
import '../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'SuccessScreen.dart';

class Uploaddocumentwrapper extends StatelessWidget {
  const Uploaddocumentwrapper({super.key, required this.university});
  final University_model university;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(FetchUserDetailsById()),
      child: Document_upload(
        university: university,
      ),
    );
  }
}

class Document_upload extends StatelessWidget {
  const Document_upload({super.key, required this.university});
  final University_model university;
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
              String? Education;
              String? TravelandEmigration;

              if (state is DocumentsUploaded) {
                transcriptUrl = state.transcriptUrl;
                sopUrl = state.sopUrl;
                Education = state.lorUrl;
                TravelandEmigration = state.englishTestUrl;
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
                        title: "Education",
                        uploaded: Education != null,
                        fileUrl: Education,
                        onTap: () async {
                          final url = await _uploadFile("Education");
                          if (url != null) {
                            context.read<DocumentBloc>().add(UploadLOR(url));
                          }
                        },
                      ),
                      university.Country != "India"
                          ? UploadTile(
                              title: "Travel @Emigration",
                              uploaded: TravelandEmigration != null,
                              fileUrl: TravelandEmigration,
                              onTap: () async {
                                final url = await _uploadFile("englishTest");
                                if (url != null) {
                                  context
                                      .read<DocumentBloc>()
                                      .add(UploadEnglishTest(url));
                                }
                              },
                            )
                          : SizedBox(),
                      const SizedBox(height: 20),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is Userloading) {
                            return const Center(child: Loading_Widget());
                          } else if (state is UserByidLoaded) {
                            final userData = state.Userdata;
                            return BlocConsumer<ApplicationBloc,
                                ApplicationState>(
                              listener: (context, state) {
                                if (state is addapplicationAddSuccessstate) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return SuccessScreen();
                                    },
                                  ));
                                }
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () {
                                    Applicationmodel application =
                                        Applicationmodel(
                                      Universityname: university.Universityname,
                                      UniversityDescription:
                                          university.Description,
                                      collagename: university.Collegename,
                                      Coursename: university.Course_offered,
                                      status: "0",
                                      Ban: "0",
                                      Country: university.Country,
                                      Degree_offered: university.Degree_offered,
                                      collagecode: university.collagecode,
                                      uaser_uid: userData.uid,
                                      username: userData.name,
                                      userphone: userData.phone,
                                      userstate: userData.state,
                                      usercountry: userData.Country,
                                      userprofilephoto: userData.image,
                                      userphone_number: userData.phone,
                                      useremail: userData.email,
                                      Universityid: university.Universityid,
                                      Education_doc_url: Education,
                                      Sop_doc_url: sopUrl,
                                      Transcript_doc_Url: transcriptUrl,
                                      Travel_doc_url: TravelandEmigration,
                                    );
                                    context.read<ApplicationBloc>().add(
                                        Applicationaddevent(
                                            application: application));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: state is addapplicationloadingstate
                                      ? Loading_Widget()
                                      : Text(
                                          'Apply Now',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                );
                              },
                            );
                          }
                          return SizedBox();
                        },
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
