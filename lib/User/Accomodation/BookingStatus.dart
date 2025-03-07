import 'package:flutter/material.dart';

class ApplicationStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Application Status",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildApplicationCard(
                    context,
                    "Your application to Toronto University is confirmed.",
                    Colors.grey[100]!, // Light grey for the first container
                  ),
                  _buildApplicationCard(
                    context,
                    "Your application for Master’s in Computer Science at XYZ University has been successfully submitted. The university will review your application, and you can expect an update by March 15, 2025.",
                    Colors.grey[300]!, // Grey for remaining containers
                  ),
                  _buildApplicationCard(
                    context,
                    "Your application for ABC University is incomplete. Please upload your Statement of Purpose (SOP) and Letter of Recommendation (LOR) before February 10, 2025, to avoid delays.",
                    Colors.grey[300]!, // Grey for remaining containers
                  ),
                  _buildApplicationCard(
                    context,
                    "You are eligible for the International Student Excellence Scholarship at JKL University. The deadline to apply is April 1, 2025.",
                    Colors.grey[300]!, // Grey for remaining containers
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCard(
      BuildContext context, String text, Color bgColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: bgColor, // Set background color dynamically
        border: Border.all(color: Color(0xff0A71CB), width: 2), // Blue border
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        elevation: 0, // Remove shadow since we are using a border
        color: Colors.transparent, // Make Card background transparent
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => BookingStatusTracking()),
                      // );
                    },
                    child: Text(
                      "View",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
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
