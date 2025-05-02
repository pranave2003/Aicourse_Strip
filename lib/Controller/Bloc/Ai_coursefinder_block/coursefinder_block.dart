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
  final double? AcadamicTestPercentage;
  final String? Englishtest;
  final double? Englishtestpercentage;
  final String? highestEducation;
  final double? highestEducationpercentage;
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
        Query query = FirebaseFirestore.instance.collection('University');

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

        query = query.where('Englishtestpercentage',
            isLessThanOrEqualTo: event.Englishtestpercentage);
        print(event.Englishtestpercentage);

        query = query.where('AcadamicTestPercentage',
            isLessThanOrEqualTo: event.AcadamicTestPercentage);
        print(event.AcadamicTestPercentage);

        query = query.where('highestEducationpercentage',
            isLessThanOrEqualTo: event.highestEducationpercentage);

        print(event.highestEducationpercentage);
        if (event.AcadamicTest?.isNotEmpty ?? false) {
          query = query.where('AcadamicTest', isEqualTo: event.AcadamicTest);
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
