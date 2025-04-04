import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../University_block/University_model/University_model.dart';
import '../University_block/university_bloc.dart';

// Define Coursefinder Events
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

// Define Coursefinder States
@immutable
abstract class CoursefinderState {}

class CoursefinderInitial extends CoursefinderState {}

class CoursefinderLoading extends CoursefinderState {}

class CoursefinderLoaded extends CoursefinderState {
  final List<University_model> universities;
  CoursefinderLoaded(this.universities);
}

class CoursefinderFailError extends CoursefinderState {
  final String error;
  CoursefinderFailError(this.error);
}

class CoursefinderBlock extends Bloc<CoursefinderEvent, CoursefinderState> {
  CoursefinderBlock() : super(CoursefinderInitial()) {
    on<FetchAllUniversites>((event, emit) async {
      emit(CoursefinderLoading());
      try {
        CollectionReference driversCollection =
            FirebaseFirestore.instance.collection('University');

        Query query = driversCollection;
        if (event.Country != null) {
          query = query.where('Country', isEqualTo: event.Country);
        }
        if (event.Degree_offered != null) {
          query =
              query.where('Degree offered', isEqualTo: event.Degree_offered);
        }
        if (event.highestEducation != null) {
          query = query.where('highestEducation',
              isEqualTo: event.highestEducation);
        }
        if (event.Course_offered != null) {
          query =
              query.where('Course offered', isEqualTo: event.Course_offered);
        }
        if (event.Englishtest != null) {
          query = query.where('English test', isEqualTo: event.Englishtest);
        }
        if (event.AcadamicTest != null) {
          query = query.where('AcademicTest', isEqualTo: event.AcadamicTest);
        }
        if (event.Rank != null) {
          query = query.where('Rank', isEqualTo: event.Rank);
        }


        QuerySnapshot snapshot = await query.get();

        List<University_model> userss = snapshot.docs.map((doc) {
          return University_model.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          userss = userss.where((driver) {
            return driver.Country!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(CoursefinderLoaded(userss));
      } catch (e) {
        emit(CoursefinderFailError(e.toString()));
      }
    });
  }
}
