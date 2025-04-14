import 'package:cloud_firestore/cloud_firestore.dart';
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

        print("University and Booking Details saved successfully.");
        emit(BookingaddSuccess());
      } catch (e) {
        final errorMsg = e.toString().split(']').last;
        print("Error: $errorMsg");
        emit(Bookingfailerror(errorMsg));
      }
    });
  }
}
