import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_connect/Controller/Bloc/Applycourse/ApplicationModel/ApplicationModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:meta/meta.dart';
import 'package:course_connect/Utils/image_downloader.dart';
part 'application_event.dart';
part 'application_state.dart';

final userid_global = FirebaseAuth.instance.currentUser!.uid;

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationInitial()) {
    on<Applicationaddevent>(
      (event, emit) async {
        print("object");
        emit(addapplicationloadingstate());
        try {
          var applicationID = FirebaseFirestore.instance
              .collection("Applications")
              .doc(); // Generate ID
          String ApplicationId = applicationID.id; // Get the generated ID

          await applicationID.set({
            "status": "0",
            "applicationid": ApplicationId,
            "Universityname": event.application.Universityname,
            "UniversityDescription": event.application.UniversityDescription,
            "collagename": event.application.collagename,
            "Coursename": event.application.Coursename,
            "Ban": "0",
            "Country": event.application.Country,
            "Degree_offered": event.application.Degree_offered,
            "collagecode": event.application.collagecode,
            "uaser_uid": event.application.uaser_uid,
            "Gender": event.application.Gender,
            "username": event.application.username,
            "userphone": event.application.userphone,
            "userstate": event.application.userstate,
            "usercountry": event.application.usercountry,
            "userprofilephoto": event.application.userprofilephoto,
            "userphone_number": event.application.userphone_number,
            "useremail": event.application.useremail,
            "Universityid": event.application.Universityid,
            "Education_doc_url": event.application.Education_doc_url,
            "Sop_doc_url": event.application.Sop_doc_url,
            "Transcript_doc_Url": event.application.Transcript_doc_Url,
            "Travel_doc_url": event.application.Travel_doc_url,
          });
          print(" Application added done...");
          emit(addapplicationAddSuccessstate());
        } catch (e) {
          emit(addapplicationFailerrorstate(
              error: e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );
    on<FetchApplication>((event, emit) async {
      emit(ApplicationLoading());
      try {
        CollectionReference Applicationcollection =
            FirebaseFirestore.instance.collection('Applications');

        Query query = Applicationcollection;
        query = query.where("uaser_uid", isEqualTo: event.uaser_uid);

        QuerySnapshot snapshot = await query.get();

        List<Applicationmodel> userss = snapshot.docs.map((doc) {
          return Applicationmodel.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          userss = userss.where((Application) {
            return Application.Universityname!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(Application_loaded(userss));
      } catch (e) {
        emit(Applicationfailerror(e.toString()));
      }
    });
    on<FetchApplicationDetailsById>((event, emit) async {
      emit(Applicationgetloading());

      if (event.Application_id != null) {
        print("fetch Application detaisl");
        try {
          final doc = await FirebaseFirestore.instance
              .collection('Applications')
              .doc(event.Application_id)
              .get();

          if (doc.exists) {
            Applicationmodel userData = Applicationmodel.fromMap(doc.data()!);
            emit(ApplicationLoaded(userData));
          } else {
            emit(Applicationfailerror("Application not found"));
          }
        } catch (e) {
          emit(Applicationfailerror(e.toString()));
        }
      }
    });

    on<DownloadImageFromFirebase>((event, emit) async {
      emit(ImageDownloading());

      try {
        final ref = FirebaseStorage.instance.ref(event.firebasePath);
        final url = await ref.getDownloadURL();

        // if (kIsWeb) {
        //   // Trigger browser download
        //   final anchor = html.AnchorElement(href: url)
        //     ..target = 'blank'
        //     ..download = event.firebasePath.split('/').last
        //     ..click();
        //
        //   emit(ImageDownloaded(url));
        // }
        if (kIsWeb) {
          final fileName = event.firebasePath.split('/').last;
          triggerDownload(
              url, fileName); // This comes from image_downloader.dart
          emit(ImageDownloaded(url));
        } else {
          // mobile logic (e.g., use path_provider + dio or open_file etc.)
        }
      } catch (e) {
        emit(ImageDownloadError("Failed: ${e.toString()}"));
      }
    });
    on<AcceptOrRejectApplication>((event, emit) async {
      emit(AcceptorrejectLoadingstate());

      try {
        FirebaseFirestore.instance
            .collection("Applications")
            .doc(event.applicationid)
            .update({"status": event.Status.toString()});
        emit(RefreshApplication());
      } catch (e) {
        emit(AcceptorrejectErrorstate(e.toString()));
      }
    });
  }
}
