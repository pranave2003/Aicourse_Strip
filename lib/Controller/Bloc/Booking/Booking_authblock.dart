import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_model/BookingModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BookingState.dart';
import 'BookingAuthEvent.dart';

class BookingAuthblock extends Bloc<BookingAuthEvent, BookingState> {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  BookingAuthblock() : super(BookingInitial()) {
    on<BookingAuthEvent>((event, emit) {});

    on<Booking_Add_event>((event, emit) async {
      emit(BookingLoading());
      try {
        // 1. Add University Booking
        var bookingRef =
        FirebaseFirestore.instance.collection("Bookings").doc();
        String bookingId = bookingRef.id;
        event.Booking.bookingid = bookingId;

        await bookingRef.set(event.Booking.toMap());

        // 2. Add Booking Details (maybe to a subcollection or separate collection)
        var bookingDetailsRef = FirebaseFirestore.instance
            .collection("Bookings")
            .doc(bookingId);

        String detailId = bookingDetailsRef.id;
        event.Booking.bookingid = detailId;

        await bookingDetailsRef.set({
          "bookingid": detailId,
          "propertyId": event.Booking.propertyId,
          "landlordId": event.Booking.landlordId,
          "userid": event.Booking.userid,
          "status": event.Booking.status,
          "username": event.Booking.username,
          "userphonenumber": event.Booking.userphonenumber,
          "propertyName": event.Booking.propertyName,
          "checkindate": event.Booking.checkindate,
          "checkoutdate": event.Booking.checkoutdate,
          "ownername": event.Booking.ownername,
          "owneremail": event.Booking.owneremail,
          "bookingdate": event.Booking.bookingdate,
          "tokenamount": event.Booking.tokenamount,
          "bookingtime": event.Booking.bookingtime,
          "propertystate": event.Booking.propertystate,
          "propertycity": event.Booking.propertycity,
          "propertycountry": event.Booking.propertycountry,
          "propertyaddress": event.Booking.propertyaddress,
          "propertyImageURL": event.Booking.propertyImageURL,
          "propertyTotal": event.Booking.propertyTotal,
          "landlordname": event.Booking.landlordname,
          "landlordphone": event.Booking.landlordphone,
          "useremail": event.Booking.useremail,
        });

        print("Booking Details saved successfully.");
        emit(BookingaddSuccess());
      } catch (e) {
        final errorMsg = e
            .toString()
            .split(']')
            .last;
        print("Error: $errorMsg");
        emit(Bookingfailerror(errorMsg));
      }
    });
    on<FetchBookings>((event, emit) async {
      emit(BookingLoading());
      try {
        CollectionReference ShopesCollection =
        FirebaseFirestore.instance.collection('Bookings');

        Query query = ShopesCollection;
        query = query.where("status", isEqualTo: event.status);

        QuerySnapshot snapshot = await query.get();

        List<Bookingmodel> Landloared = snapshot.docs.map((doc) {
          return Bookingmodel.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();

        // if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
        //   Landloared = Landloared.where((landlored) {
        //     return landlored.name!
        //         .toLowerCase()
        //         .contains(event.searchQuery!.toLowerCase());
        //   }).toList();
        // }

        emit(BookingLoaded(Landloared));
      } catch (e) {
        emit(Bookingfailerror(e.toString()));
      }
    });

    //   update by id Accept or reject

    on<AcceptOrRejectBookings>((event, emit) async {
      emit(AcceptorrejectLoadingstate());

      try {
        FirebaseFirestore.instance
            .collection("Bookings")
            .doc(event.bookingid)
            .update({"status": event.Status.toString()});
        emit(Acceptorrejectstate());
      } catch (e) {
        emit(AcceptorrejectErrorstate(e.toString()));
      }
    });
  }}
