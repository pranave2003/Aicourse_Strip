
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
  FetchAllUniversites({this.searchQuery});
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
        CollectionReference universityCollection =
        FirebaseFirestore.instance.collection('University');

        Query query = universityCollection;
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
        List<University_model> universityList =
        uniqueUniversities.values.toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          universityList = universityList.where((university) {
            return university.Universityname!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(CoursefinderLoaded(universityList));
      } catch (e) {
        emit(CoursefinderFailError(e.toString()));
      }
    });
  }
}
