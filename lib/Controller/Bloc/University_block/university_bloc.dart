import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'University_model/University_model.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
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
            "Universitytype": event.University.Universitytype,
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
  }
}
