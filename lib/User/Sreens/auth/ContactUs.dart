import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Information"),
        centerTitle: true,
      ),
      body: SizedBox(
          width: 320, // Set a fixed width to fit content
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Shrink to fit content
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  contactInfoRow(Icons.email, "Email", "support@courseconnect.com"),
                  contactInfoRow(Icons.phone, "Phone", "+1 123 456 7890"),
                  contactInfoRow(Icons.language, "Website", "www.courseconnect.com"),
                ],
              ),
            ),
          ),
      ),
    );
  }

  Widget contactInfoRow(IconData icon, String title, String detail) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensures row does not expand unnecessarily
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 10),
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Flexible(
            child: Text(detail, style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContactUs(),
    theme: ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.white,
    ),
  ));
}
