import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../University_block/University_model/Universitycollage.dart';

part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(DropdownInitial()) {
    on<Fetchcatogorybydropdown>((event, emit) async {
      try {
        emit(
            fetchcatogorydropdownloading()); // Emit loading state before fetching data

        await for (var snapshot in FirebaseFirestore.instance
            .collection('University')
            // .where("service", isEqualTo: event.service)
            .snapshots()) {
          // Use a Set to avoid duplicate categories
          Set<String> domainSet =
              snapshot.docs.map((doc) => doc['Collegename'] as String).toSet();

          List<String> uniqueDomain = domainSet.toList();

          print("Unique Domain: $uniqueDomain");

          if (!emit.isDone) {
            emit(catogoryLoadedDOMAIN(uniqueDomain));
          }
        }
      } catch (e) {
        if (!emit.isDone) {
          emit(FetchcatogotyError(e.toString()));
        }
      }
    });

    on<Fetchcatcollagebydropdown>((event, emit) async {
      try {
        emit(
            fetchcollagedropdownloading()); // Emit loading state before fetching data

        await for (var snapshot in FirebaseFirestore.instance
            .collection('Collage_university')
            // .where("service", isEqualTo: event.service)
            .snapshots()) {
          // Use a Set to avoid duplicate categories
          Set<String> domainSet =
              snapshot.docs.map((doc) => doc['Collegename'] as String).toSet();

          List<String> uniqueDomain = domainSet.toList();

          print("Unique Domain: $uniqueDomain");

          if (!emit.isDone) {
            emit(CollageLoadedDOMAIN(uniqueDomain));
          }
        }
      } catch (e) {
        if (!emit.isDone) {
          emit(FetchcatogotyError(e.toString()));
        }
      }
    });
  }
}
