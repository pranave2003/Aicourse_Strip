import 'package:course_connect/Controller/Bloc/Booking/Booking_model/BookingModel.dart';


sealed class  BookingAuthEvent{}
class Booking_Add_event extends BookingAuthEvent {

  final Bookingmodel Booking;
  Booking_Add_event({required this.Booking});
}
