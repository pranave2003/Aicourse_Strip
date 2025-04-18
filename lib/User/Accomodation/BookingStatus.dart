
import 'package:course_connect/Controller/Bloc/Booking/BookingAuthEvent.dart';
import 'package:course_connect/Controller/Bloc/Booking/Booking_authblock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BookingTracking.dart'; // Import the second page
class Viewbookingmainwrapper1 extends StatelessWidget {
  const Viewbookingmainwrapper1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      BookingAuthblock()
        ..add(FetchBookings(searchQuery: null,)),
      child: BookingStatus(),
    );
  }
}
String _getStatusText(String? status) {
  switch (status) {
    case '1':
      return 'Approved';
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
              child: ListView(
                children: [
                  _buildBookingCard(context),
                  _buildBookingCard(context),
                  _buildBookingCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context) {
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
                "Your Booking is Confirmed!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Hello Nafiya, We are pleased to confirm your stay at Portchester house.",
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
