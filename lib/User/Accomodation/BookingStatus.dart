import 'package:flutter/material.dart';
import 'BookingStatusTracking.dart'; // Import the second page

class BookingStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
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
              "Booking Status",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildBookingCard(
                    context,
                    "Your Booking is Confirmed!",
                    "Hello Nafiya, We are pleased to confirm your stay at Portchester House.",
                  ),
                  _buildBookingCard(
                    context,
                    "Your Booking is Confirmed!",
                    "Hello Nafiya, We are pleased to confirm your stay at Portchester House.",
                  ),
                  _buildBookingCard(
                    context,
                    "Your Booking is Confirmed!",
                    "Hello Nafiya, We are pleased to confirm your stay at Portchester House.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context, String title, String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Light grey background
        border: Border.all(color: Color(0xff0A71CB), width: 1.5), // Blue border
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        elevation: 0, // No shadow
        color: Colors.transparent, // Transparent card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingStatusTracking()),
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
                      // Add cancel functionality
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
