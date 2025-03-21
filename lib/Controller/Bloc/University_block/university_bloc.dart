import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'University_model/University_model.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(UniversityInitial()) {
    on<UniversityEvent>((event, emit) {
      // TODO: implement event handler
    });

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
  }
}
