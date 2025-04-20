import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_connect/User/Ai_course_finder/University.md';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'University_model/University_model.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  UniversityBloc() : super(UniversityInitial()) {
    on<UniversityEvent>((event, emit) {});

    on<University_Add_Event>(
      (event, emit) async {
        emit(UniversityLoading());
        try {
          var orderRef = FirebaseFirestore.instance
              .collection("University")
              .doc(); // Generate ID
          String universityId = orderRef.id; // Get the generated ID

          await orderRef.set({
            "Universityid": universityId,
            "Universityimage": event.University.UniversityimageURL,
            "Rank": event.University.Rank,
            "Established_date": event.University.Established_date,
            "Universityname": event.University.Universityname,
            "Description": event.University.Description,
            "Admission_startdate": event.University.Admission_startdate,
            "Admission_enddate": event.University.Admission_enddate,
            "Degree_offered": event.University.Degree_offered,
            "Course_offered": event.University.Course_offered,
            "Tuition_fees": event.University.Tuition_fees,
            "Duration": event.University.Duration,
            "Schoolarship_details": event.University.Schoolarship_details,
            "Eligibility_criteria": event.University.Eligibility_criteria,
            "Terms_and_conditions": event.University.Terms_and_conditions,
            "Country": event.University.Country,
            "Ban": "0",
            "status": "1",
            "Onesignal_id": "on signal id",
            "AcadamicTest": event.University.AcadamicTest,
            "AcadamicTestPercentage": event.University.AcadamicTestPercentage,
            "Englishtest": event.University.Englishtest,
            "Englishtestpercentage": event.University.Englishtestpercentage,
            "highestEducation": event.University.highestEducation,
            "highestEducationpercentage":
                event.University.highestEducationpercentage,
            "collagecode": event.University.collagecode,
            "Collegename": event.University.Collegename

            // "state": event.University.state,
            // "city": event.University.city
          });
          print("done...");
          emit(UniversityaddSuccess());
        } catch (e) {
          emit(Universityfailerror(e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );

    on<FetchUniversity>((event, emit) async {
      emit(UniversitysLoading());
      try {
        CollectionReference Universitycollection =
            FirebaseFirestore.instance.collection('University');

        Query query = Universitycollection;
        query = query.orderBy("Rank", descending: false);
        QuerySnapshot snapshot = await query.get();

        List<University_model> userss = snapshot.docs.map((doc) {
          return University_model.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          userss = userss.where((University) {
            return University.Universityname!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(University_loaded(userss));
      } catch (e) {
        emit(Universitysfailerror(e.toString()));
      }
    });

    on<Fetchcourse_colleges>((event, emit) async {
      emit(UniversitysLoading());
      try {
        CollectionReference Universitycollection =
            FirebaseFirestore.instance.collection('University');

        Query query = Universitycollection;
        query = query.where("Universityname", isEqualTo: event.University);
        query = query.where("Collegename", isEqualTo: event.college);
        QuerySnapshot snapshot = await query.get();

        List<University_model> userss = snapshot.docs.map((doc) {
          return University_model.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          userss = userss.where((University) {
            return University.Course_offered!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(University_loaded(userss));
      } catch (e) {
        emit(Universitysfailerror(e.toString()));
      }
    });

    on<FetchAllUniversites>((event, emit) async {
      emit(UniversitysLoading());
      try {
        CollectionReference Universitycollection =
            FirebaseFirestore.instance.collection('University');

        Query query = Universitycollection;
        query = query.orderBy("Rank", descending: false);

        QuerySnapshot snapshot = await query.get();

        // Use a map to store unique university names
        Map<String, University_model> uniqueUniversities = {};

        for (var doc in snapshot.docs) {
          University_model university =
              University_model.fromMap(doc.data() as Map<String, dynamic>);

          // If the university name is not in the map, add it
          if (!uniqueUniversities.containsKey(university.Universityname)) {
            uniqueUniversities[university.Universityname!] = university;
          }
        }

        // Convert the map values back to a list
        List<University_model> userss = uniqueUniversities.values.toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          userss = userss.where((University) {
            return University.Universityname!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(University_loaded(userss));
      } catch (e) {
        emit(Universitysfailerror(e.toString()));
      }
    });

    on<Fetchallcollage>((event, emit) async {
      emit(UniversitysLoading());
      try {
        CollectionReference Universitycollection =
            FirebaseFirestore.instance.collection('University');

        Query query = Universitycollection.where("Universityname",
            isEqualTo: event.University);
        QuerySnapshot snapshot = await query.get();

        // Use a Set to store unique university names
        Set<String> uniqueNames = {};
        List<University_model> universityList = [];

        for (var doc in snapshot.docs) {
          University_model university =
              University_model.fromMap(doc.data() as Map<String, dynamic>);

          // Add only if it's not already in the set
          if (university.Collegename != null &&
              uniqueNames.add(university.Collegename!)) {
            universityList.add(university);
          }
        }

        // Sort the full list alphabetically before filtering
        universityList.sort((a, b) => a.Collegename!.compareTo(b.Collegename!));

        // If searchQuery is empty, reset the list to full sorted list
        if (event.searchQuery == null || event.searchQuery!.isEmpty) {
          emit(University_loaded(universityList));
          return;
        }

        // Apply search filtering
        List<University_model> filteredList =
            universityList.where((university) {
          return university.Collegename!
              .toLowerCase()
              .contains(event.searchQuery!.toLowerCase());
        }).toList();

        emit(University_loaded(filteredList));
      } catch (e) {
        emit(Universitysfailerror(e.toString()));
      }
    });

    on<FetchCourseDetailsById>((event, emit) async {
      emit(Coursesgetloading());

      if (event.CourseUniversity_id != null) {
        print("fetch university detaisl");
        try {
          final doc = await FirebaseFirestore.instance
              .collection('University')
              .doc(event.CourseUniversity_id)
              .get();

          if (doc.exists) {
            University_model userData = University_model.fromMap(doc.data()!);
            emit(UniversityModel(userData));
          } else {
            emit(UniversitysCoursefailerror("Course not found"));
          }
        } catch (e) {
          emit(UniversitysCoursefailerror(e.toString()));
        }
      }
    });
    // delete University
    on<DeleteUniversity>(
      (event, emit) async {
        emit(UniversityLoading());
        try {
          FirebaseFirestore.instance
              .collection("University")
              .doc(event.Universityid)
              .delete(); // Generate ID
          emit(RefreshUniversity());
        } catch (e) {
          emit(Universitysfailerror(e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );
    on<University_Edit_Event>(
      (event, emit) async {
        emit(UniversityLoading());
        try {
          FirebaseFirestore.instance
              .collection("University")
              .doc(event.University.Universityid)
              .update({
            "Universityimage": event.University.UniversityimageURL,
            "Rank": event.University.Rank,
            "Established_date": event.University.Established_date,
            "Universityname": event.University.Universityname,
            "Description": event.University.Description,
            "Admission_startdate": event.University.Admission_startdate,
            "Admission_enddate": event.University.Admission_enddate,
            "Degree_offered": event.University.Degree_offered,
            "Course_offered": event.University.Course_offered,
            "Tuition_fees": event.University.Tuition_fees,
            "Duration": event.University.Duration,
            "Schoolarship_details": event.University.Schoolarship_details,
            "Eligibility_criteria": event.University.Eligibility_criteria,
            "Terms_and_conditions": event.University.Terms_and_conditions,
            "Country": event.University.Country,
            "Ban": "0",
            "status": "1",
            "Onesignal_id": "on signal id",
            "AcadamicTest": event.University.AcadamicTest,
            "AcadamicTestPercentage": event.University.AcadamicTestPercentage,
            "Englishtest": event.University.Englishtest,
            "Englishtestpercentage": event.University.Englishtestpercentage,
            "highestEducation": event.University.highestEducation,
            "highestEducationpercentage":
                event.University.highestEducationpercentage,
            "collagecode": event.University.collagecode,
            // "city": event.University.city,
            // "state": event.University.state,
            "Collegename": event.University.Collegename
          }); // Generate ID
          emit(UniversityaddSuccess());
        } catch (e) {
          emit(Universityfailerror(e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );

    //   upload image

    on<UploadUniversityphoto>((event, emit) async {
      try {
        emit(ImageuploadLoading());

        // ✅ Open file picker
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.image, // Pick only image files
          withData: true, // Required for web
        );

        if (result == null) {
          emit(ProfileImageFailure("No picked the image"));

          print("No image selected.");
          return; // User canceled selection
        }

        String fileName =
            "University/${DateTime.now().millisecondsSinceEpoch}.jpg";
        Reference storageRef = _firebaseStorage.ref().child(fileName);
        UploadTask uploadTask;

        if (kIsWeb) {
          // ✅ Web: Upload image as bytes
          Uint8List imageData = result.files.first.bytes!;
          uploadTask = storageRef.putData(imageData);
        } else {
          // ✅ Mobile: Upload image as a File
          File imageFile = File(result.files.first.path!);
          uploadTask = storageRef.putFile(imageFile);
        }

        // ✅ Wait for the upload to complete
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        print("Uploaded Image URL: $downloadUrl");

        emit(Imageuploadedurl(downloadUrl));
      } catch (e) {
        print("Error: $e");
        emit(ProfileImageFailure("Failed to upload image"));
      }
    });
  }
}
