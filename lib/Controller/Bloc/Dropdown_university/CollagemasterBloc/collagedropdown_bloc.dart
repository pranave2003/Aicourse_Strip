import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../University_block/University_model/Universitycollage.dart';

part 'collagedropdown_event.dart';
part 'collagedropdown_state.dart';

class CollagedropdownBloc
    extends Bloc<CollagedropdownEvent, CollagedropdownState> {
  CollagedropdownBloc() : super(CollagedropdownInitial()) {
    on<FetchCollegeDetailsByName>((event, emit) async {
      try {
        emit(collagedropdownloading()); // loading state

        final snapshot = await FirebaseFirestore.instance
            .collection('Collage_university')
            .where('Collegename', isEqualTo: event.collegename)
            .get();

        if (snapshot.docs.isNotEmpty) {
          final data = snapshot.docs.first.data();
          Collagemodel college = Collagemodel.fromMap(data);
          emit(CollageFullDataLoaded(college));
        } else {
          emit(Error("College not found"));
        }
      } catch (e) {
        emit(Error(e.toString()));
      }
    });
  }
}
