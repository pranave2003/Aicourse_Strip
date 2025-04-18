import 'package:course_connect/Controller/Bloc/Booking/Booking_model/BookingModel.dart';


sealed class  BookingAuthEvent{}
class Booking_Add_event extends BookingAuthEvent {

  final Bookingmodel Booking;
  Booking_Add_event({required this.Booking});
}
class FetchBookings extends BookingAuthEvent {
  final String? searchQuery;
final String? landlordid;
  final String? userid;

  FetchBookings({required this.searchQuery,this.landlordid,this.userid});


}



// acccept or reject


class AcceptOrRejectBookings extends BookingAuthEvent {
  final String? bookingid;
  final String? Status;
  AcceptOrRejectBookings({this.bookingid, this.Status});
}