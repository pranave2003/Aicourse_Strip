import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../University_block/University_model/University_model.dart';
import '../University_block/university_bloc.dart';

// Define Coursefinder Events
@immutable

// class FetchAllUniversites extends CoursefinderEvent {
//   final String? searchQuery;
//   final String? Country;
//   final String? Course_offered;
//   final String? Degree_offered;
//   final String? AcadamicTest;
//   final String? AcadamicTestPercentage;
//   final String? Englishtest;
//   final String? Englishtestpercentage;
//   final String? highestEducation;
//   final String? highestEducationpercentage;
//   final String? Rank;
//
//   FetchAllUniversites({
//     this.searchQuery,
//     this.Country,
//     this.Course_offered,
//     this.Degree_offered,
//     this.AcadamicTest,
//     this.AcadamicTestPercentage,
//     this.Englishtest,
//     this.Englishtestpercentage,
//     this.highestEducation,
//     this.highestEducationpercentage,
//     this.Rank,
//   });
// }
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../University_block/University_model/University_model.dart';
import 'coursefinder_state.dart';

@immutable
abstract class CoursefinderEvent {}

class FetchAllUniversites extends CoursefinderEvent {
  final String? searchQuery;
  final String? Country;
  final String? Course_offered;
  final String? Degree_offered;
  final String? AcadamicTest;
  final String? AcadamicTestPercentage;
  final String? Englishtest;
  final String? Englishtestpercentage;
  final String? highestEducation;
  final String? highestEducationpercentage;
  final String? Rank;

  FetchAllUniversites({
    this.searchQuery,
    this.Country,
    this.Course_offered,
    this.Degree_offered,
    this.AcadamicTest,
    this.AcadamicTestPercentage,
    this.Englishtest,
    this.Englishtestpercentage,
    this.highestEducation,
    this.highestEducationpercentage,
    this.Rank,
  });
}

class CoursefinderBlock extends Bloc<CoursefinderEvent, CoursefinderState> {
  CoursefinderBlock() : super(CoursefinderInitial()) {
    on<FetchAllUniversites>((event, emit) async {
      emit(CoursefinderLoading());

      try {
        Query query = FirebaseFirestore.instance
            .collection('University')
            .orderBy("Rank", descending: false);

        if (event.Country?.isNotEmpty ?? false) {
          query = query.where('Country', isEqualTo: event.Country);
        }
        if (event.Degree_offered?.isNotEmpty ?? false) {
          query =
              query.where('Degree_offered', isEqualTo: event.Degree_offered);
        }
        if (event.highestEducation?.isNotEmpty ?? false) {
          query = query.where('highestEducation',
              isEqualTo: event.highestEducation);
        }
        if (event.Course_offered?.isNotEmpty ?? false) {
          query =
              query.where('Course_offered', isEqualTo: event.Course_offered);
        }
        if (event.Englishtest?.isNotEmpty ?? false) {
          query = query.where('Englishtest', isEqualTo: event.Englishtest);
        }
        if (event.AcadamicTest?.isNotEmpty ?? false) {
          query = query.where('AcadamicTest', isEqualTo: event.AcadamicTest);
        }
        if (event.Rank?.isNotEmpty ?? false) {
          query = query.where('Rank', isEqualTo: event.Rank);
        }

        QuerySnapshot snapshot = await query.get();

        List<University_model> universities = snapshot.docs.map((doc) {
          return University_model.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery?.isNotEmpty ?? false) {
          universities = universities.where((univ) {
            return univ.Country != null &&
                univ.Country!
                    .toLowerCase()
                    .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(CoursefinderLoaded(universities));
      } catch (e) {
        print(e);
        emit(CoursefinderFailError(e.toString()));
      }
    });
  }
}

// class CoursefinderBlock extends Bloc<CoursefinderEvent, CoursefinderState> {
//   CoursefinderBlock() : super(CoursefinderInitial()) {
//     on<FetchAllUniversites>((event, emit) async {
//       emit(CoursefinderLoading());
//       try {
//         CollectionReference driversCollection =
//             FirebaseFirestore.instance.collection('University');
//
//         Query query = driversCollection;
//         if (event.Country != null) {
//           query = query.where('Country', isEqualTo: event.Country);
//         }
//         if (event.Degree_offered != null) {
//           query =
//               query.where('Degree offered', isEqualTo: event.Degree_offered);
//         }
//         if (event.highestEducation != null) {
//           query = query.where('highestEducation',
//               isEqualTo: event.highestEducation);
//         }
//         if (event.Course_offered != null) {
//           query =
//               query.where('Course offered', isEqualTo: event.Course_offered);
//         }
//         if (event.Englishtest != null) {
//           query = query.where('English test', isEqualTo: event.Englishtest);
//         }
//         if (event.AcadamicTest != null) {
//           query = query.where('AcademicTest', isEqualTo: event.AcadamicTest);
//         }
//         if (event.Rank != null) {
//           query = query.where('Rank', isEqualTo: event.Rank);
//         }
//
//
//         QuerySnapshot snapshot = await query.get();
//
//         List<University_model> userss = snapshot.docs.map((doc) {
//           return University_model.fromMap(doc.data() as Map<String, dynamic>);
//         }).toList();
//
//         if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
//           userss = userss.where((driver) {
//             return driver.Country!
//                 .toLowerCase()
//                 .contains(event.searchQuery!.toLowerCase());
//           }).toList();
//         }
//
//         emit(CoursefinderLoaded(userss));
//       } catch (e) {
//         emit(CoursefinderFailError(e.toString()));
//       }
//     });
//   }
// }
