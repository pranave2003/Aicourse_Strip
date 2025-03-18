import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            iconSection(Icons.info, "About Course Connect"),
            sectionContent(
                "Course Connect is an AI-powered study abroad platform that simplifies university selection, application submission, and document collection. Once your application is complete, we help you book accommodations hassle-free."),
            SizedBox(height: 20),

            iconSection(Icons.flag, "Our Mission"),
            sectionContent(
                "Our mission is to empower students worldwide by providing a seamless and AI-driven university application process. We aim to eliminate the complexity of choosing the right course and institution, making higher education more accessible and stress-free."),
            SizedBox(height: 20),

            iconSection(Icons.star, "Why Choose Us?"),
            bulletPoint(Icons.auto_awesome, "AI-Powered Course Finder to match you with the best programs."),
            bulletPoint(Icons.school, "University Application Support with streamlined document collection."),
            bulletPoint(Icons.file_copy, "Secure Document Upload for hassle-free processing."),
            bulletPoint(Icons.home, "Accommodation Pre-Booking after successful application."),
            bulletPoint(Icons.speed, "Fast and Reliable with real-time updates on application status."),
          ],
        ),
      ),
    );
  }

  Widget iconSection(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 28, color: Colors.black),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget sectionContent(String content) {
    return Padding(
      padding: EdgeInsets.only(left: 38.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget bulletPoint(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.green),
          SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
