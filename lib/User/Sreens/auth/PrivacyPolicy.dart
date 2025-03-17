import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Introduction
            Text(
              "Privacy Policy - Course Connect",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Course Connect is an AI-powered course recommendation and university application platform. "
                  "We help students find suitable courses, apply to universities, upload documents, and book accommodations after admission.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Information Collection
            sectionTitle("1. Information We Collect"),
            bulletPoint("Personal Information (Name, Email, Phone Number, Nationality, Date of Birth)"),
            bulletPoint("Education Details (Last Qualification, GPA, Course Preferences)"),
            bulletPoint("Application Documents (Transcripts, SOPs, IELTS/TOEFL, Passport)"),
            bulletPoint("Accommodation Preferences"),
            SizedBox(height: 20),

            // How We Use Data
            sectionTitle("2. How We Use Your Information"),
            bulletPoint("To recommend suitable university courses using AI"),
            bulletPoint("To process university applications and document verification"),
            bulletPoint("To facilitate accommodation booking after university acceptance"),
            bulletPoint("To improve user experience with personalized recommendations"),
            SizedBox(height: 20),

            // Data Security
            sectionTitle("3. Data Security"),
            Text(
              "We implement strong security measures to protect your personal data. "
                  "Sensitive data is encrypted and securely stored. We do not share your information with third parties without consent.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // Third-Party Services
            sectionTitle("4. Third-Party Services"),
            Text(
              "We may use third-party services for document verification and accommodation booking. "
                  "These services have their own privacy policies, and we encourage users to review them.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),

            // User Rights
            sectionTitle("5. Your Rights"),
            bulletPoint("You can update or delete your personal data at any time."),
            bulletPoint("You can request access to the information we hold about you."),
            bulletPoint("You can opt-out of marketing communications."),
            SizedBox(height: 20),

            // Contact Info
            sectionTitle("6. Contact Us"),
            Text(
              "For any privacy concerns, please contact us at: support@courseconnect.com",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Method for section title styling
  Widget sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Method for bullet points
  Widget bulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
