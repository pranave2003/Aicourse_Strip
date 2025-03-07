
import 'package:flutter/material.dart';

class BookingStatusTracking extends StatelessWidget {
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
            Row(
              children: [
                Text(
                  "Booking Status ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Tracking",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                children: [
                  _buildTrackingStep(
                    "Request Processing",
                    "Jan 10, 2025",
                    Icons.access_time,
                    Colors.grey,
                  ),
                  _buildTrackingStep(
                    "Booking Confirmed",
                    "Jan 12, 2025",
                    Icons.check_circle,
                    Colors.green,
                  ),
                  _buildTrackingStep(
                    "Payment Completed",
                    "Jan 13, 2025",
                    Icons.payment,
                    Colors.grey,
                  ),
                  _buildTrackingStep(
                    "Stay in progress",
                    "Jan 15, 2025",
                    Icons.house_outlined,
                    Colors.grey,
                  ),
                  _buildTrackingStep(
                    "Feedback",
                    "Jan 20, 2025",
                    Icons.feedback,
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingStep(String text, String date, IconData icon, Color iconColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: iconColor, size: 24),
            Container(
              width: 2,
              height: 40,
              color: Colors.grey[400], // Connector line between steps
            ),
          ],
        ),
        SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

