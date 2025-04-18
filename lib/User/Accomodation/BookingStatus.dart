
import 'package:course_connect/Controller/Bloc/Applycourse/application_bloc.dart';
import 'package:course_connect/Controller/Bloc/Booking/BookingAuthEvent.dart';
import 'package:course_connect/Controller/Bloc/Booking/BookingState.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_authblock.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_model/BookingModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Widget/Constands/Loading.dart';
import 'BookingTracking.dart'; // Import the second page
class Viewbookingmainwrapper1 extends StatelessWidget {
  const Viewbookingmainwrapper1({super.key});


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
      BookingAuthblock()
        ..add(FetchBookings(searchQuery: null,userid: userid_global1)),
      child: BookingStatus(),
    );
  }
}
String _getStatusText(String? status) {
  switch (status) {
    case '1':
      return 'Confirmed';
    case '2':
      return 'Rejected';
    case '0':
    default:
      return 'Pending';
  }
}

Color _getStatusColor(String? status) {
  switch (status) {
    case '1':
      return Colors.green;
    case '2':
      return Colors.red;
    case '0':
    default:
      return Colors.orange;
  }
}
class BookingStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking status",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: BlocConsumer<BookingAuthblock, BookingState>(
                listener: (context, state) {
                  if (state is RefreshBooking) {
                    context
                        .read<BookingAuthblock>()
                        .add(FetchBookings(searchQuery: null));
                  }
                },
                builder: (context, state) {
                  if (state is BookingLoading) {
                    return Center(child: Loading_Widget());
                  } else if (state is Bookingfailerror) {
                    return Center(child: Text(state.error.toString()));
                  } else if (state is BookingLoaded) {
                    return ListView.builder(
                      itemCount: state.booking.length,
                      itemBuilder: (context, index) {
                        final booking = state.booking[index];
                        return _buildBookingCard(
                          context,
                          booking,
                          Colors.grey[100]!,
                        );
                      },
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBookingCard(BuildContext context,Bookingmodel booking, Color bgColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff0A71CB), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Booking is  ${_getStatusText(booking.status)}!",
                style: TextStyle(fontWeight: FontWeight.bold,color: _getStatusColor(booking.status,),fontSize: 18),
              ),
              SizedBox(height: 4),
              Text(
                "Hello ${booking.username},  We are pleased to confirm your stay at ${booking.propertyName} ",
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingTracking()),
                      );
                    },
                    child: Text(
                      "View",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      // Add cancel functionality if needed
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
