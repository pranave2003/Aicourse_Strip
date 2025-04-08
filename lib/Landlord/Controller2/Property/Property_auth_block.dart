import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_connect/Landlord/Controller2/Property/Property_auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'Property_Auth/Property_Model/PropertyModel.dart';
part 'Property_auth_event.dart';

class PropertyAuthBlock extends Bloc<PropertyAuthEvent, PropertyAuthState> {
  PropertyAuthBlock() : super(PropertyInitial()) {
    on<PropertyAuthEvent>((event, emit) {});

    on<Property_Add_Event>(
      (event, emit) async {
        emit(PropertyLoading());
        try {
          var orderRef = FirebaseFirestore.instance
              .collection("Property")
              .doc(); // Generate ID
          String PropertyId = orderRef.id; // Get the generated ID

          await orderRef.set({
            "propertyId": PropertyId, // ✅ Fixed
            "LandlordId": event.Property.LandlordId, // ✅ Fixed
            "propertyName": event.Property.propertyName, // ✅ Fixed
            "propertyAddress": event.Property.propertyAddress, // ✅ Fixed
            "propertyArea": event.Property.propertyArea, // ✅ Fixed
            "country": event.Property.country,
            "state": event.Property.state,
            "ban": event.Property.ban, // ✅ Fixed
            "oneSignalId": event.Property.oneSignalId, // ✅ Fixed
            "city": event.Property.city,
            "roomTypes": event.Property.roomTypes,
            "roomSizes": event.Property.roomSizes,
            "availableFrom": event.Property.availableFrom,
            "moveInDate": event.Property.moveInDate,
            "propertyImageURL": event.Property.propertyImageURL, // ✅ Fixed
            "aboutProperty": event.Property.aboutProperty, // ✅ Fixed
            "bedroom": event.Property.bedroom,
            "bathroom": event.Property.bathroom,
            "kitchen": event.Property.kitchen,
            "furnishingOptions": event.Property.furnishingOptions,
            "propertyAmountWeek": event.Property.propertyAmountWeek, // ✅ Fixed
            "propertyAmountMonth":
                event.Property.propertyAmountMonth, // ✅ Fixed
            "tokenAmount": event.Property.tokenAmount,
            "sexualOrientations": event.Property.sexualOrientations,
            "minimumStay": event.Property.minimumStay,
            "maximumStay": event.Property.maximumStay,
            "ownerName": event.Property.ownerName,
            "ownerPhone": event.Property.ownerPhone,
            "ownershipProof": event.Property.ownershipProof,
            "parking": event.Property.parking,
            "billStatus": event.Property.billStatus, // ✅ Fixed
            "pets": event.Property.pets,
            "smoking": event.Property.smoking,
          });
          print("done...");

          emit(PropertyaddSuccess());
        } catch (e) {
          emit(PropertyFailError(e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );
    on<FetchPropertyDetailsById>((event, emit) async {
      emit(Propertygetloading());

      if (event.Property_id != null) {
        print("fetch university detaisl");
        try {
          final doc = await FirebaseFirestore.instance
              .collection('Property')
              .doc(event.Property_id)
              .get();

          if (doc.exists) {
            Property_Model userData = Property_Model.fromMap(doc.data()!);
            emit(PropertyLoadedbyid(userData));
          } else {
            emit(Propertyfailerror("User profile not found"));
          }
        } catch (e) {
          emit(Propertyfailerror(e.toString()));
        }
      }
    });
    on<FetchProperty>((event, emit) async {
      emit(PropertyLoading());
      try {
        CollectionReference Propertycollection =
            FirebaseFirestore.instance.collection('Property');

        Query query = Propertycollection;
        QuerySnapshot snapshot = await query.get();

        List<Property_Model> userss = snapshot.docs.map((doc) {
          return Property_Model.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          userss = userss.where((Property) {
            return Property.propertyName!
                .toLowerCase()
                .contains(event.searchQuery!.toLowerCase());
          }).toList();
        }

        emit(PropertyLoaded(userss));
      } catch (e) {
        emit(Propertyfailerror(e.toString()));
      }
    });
    on<DeleteProperty>(
          (event, emit) async {
        emit(Propertygetloading());
        try {
          FirebaseFirestore.instance
              .collection("Property")
              .doc(event.Property_id)
              .delete(); // Generate ID
          emit(RefreshProperty());
        } catch (e) {
          emit(Propertyfailerror(e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );
    on<Property_Edit_Event>(
          (event, emit) async {
        emit(PropertyLoading());
        try {
          FirebaseFirestore.instance
              .collection("Property")
              .doc(event.Property.propertyId)
              .update({
            "LandlordId": event.Property.LandlordId, // ✅ Fixed
            "propertyName": event.Property.propertyName, // ✅ Fixed
            "propertyAddress": event.Property.propertyAddress, // ✅ Fixed
            "propertyArea": event.Property.propertyArea, // ✅ Fixed
            "country": event.Property.country,
            "state": event.Property.state,
            "ban": event.Property.ban, // ✅ Fixed
            "oneSignalId": event.Property.oneSignalId, // ✅ Fixed
            "city": event.Property.city,
            "roomTypes": event.Property.roomTypes,
            "roomSizes": event.Property.roomSizes,
            "availableFrom": event.Property.availableFrom,
            "moveInDate": event.Property.moveInDate,
            "propertyImageURL": event.Property.propertyImageURL, // ✅ Fixed
            "aboutProperty": event.Property.aboutProperty, // ✅ Fixed
            "bedroom": event.Property.bedroom,
            "bathroom": event.Property.bathroom,
            "kitchen": event.Property.kitchen,
            "furnishingOptions": event.Property.furnishingOptions,
            "propertyAmountWeek": event.Property.propertyAmountWeek, // ✅ Fixed
            "propertyAmountMonth":
            event.Property.propertyAmountMonth, // ✅ Fixed
            "tokenAmount": event.Property.tokenAmount,
            "sexualOrientations": event.Property.sexualOrientations,
            "minimumStay": event.Property.minimumStay,
            "maximumStay": event.Property.maximumStay,
            "ownerName": event.Property.ownerName,
            "ownerPhone": event.Property.ownerPhone,
            "ownershipProof": event.Property.ownershipProof,
            "parking": event.Property.parking,
            "billStatus": event.Property.billStatus, // ✅ Fixed
            "pets": event.Property.pets,
            "smoking": event.Property.smoking,
          }); // Generate ID
          emit(RefreshProperty());
        } catch (e) {
          emit(Propertyfailerror(e.toString().split("]").last));
          print("Authenticated Error : ${e.toString().split(']').last}");
        }
      },
    );
  }
}
