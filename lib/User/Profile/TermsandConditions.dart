import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms & Conditions"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to Course Connect!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Course Connect provides an AI-driven platform to help students find universities, "
                    "apply seamlessly with document collection, and book accommodations after completing applications.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Terms Section
              Text(
                "1. Acceptance of Terms",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "By using Course Connect, you agree to these terms and conditions. If you do not agree, please do not use this application.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                "2. AI Course Finder",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Our AI-based system suggests universities based on your preferences. However, final admission decisions depend on the universities themselves.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                "3. University Applications & Document Collection",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Users must provide accurate information when submitting university applications. Course Connect is not responsible for incorrect submissions or university decisions.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                "4. Accommodation Pre-Booking",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "After completing your university application, Course Connect assists in finding suitable accommodations. We act as a facilitator, and booking confirmations depend on the property providers.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                "5. Privacy Policy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Your personal data is securely stored and used only for university applications and accommodation assistance. We do not sell user data to third parties.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                "6. Changes to Terms",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Course Connect reserves the right to modify these terms at any time. Users will be notified of significant changes.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Accept & Continue"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
