import 'package:course_connect/Controller/Bloc/Booking/Booking_model/BookingModel.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}
final class BookingaddSuccess extends BookingState {}

final class Bookingfailerror extends BookingState {
  final String error;

  Bookingfailerror(this.error);
}
  final class BookingByIdLoaded extends BookingState {
  final Bookingmodel Bookingdata;
  BookingByIdLoaded(this.Bookingdata);
  }

