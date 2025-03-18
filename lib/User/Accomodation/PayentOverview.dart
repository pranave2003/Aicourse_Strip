import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaymentOverview(),
  ));
}

class PaymentOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Report"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PaymentDetailCard(title: "Booking Details", details: {
              "Booking ID": "B12345",
              "Accommodation": "Luxury Hotel",
              "Room Type": "Deluxe Suite",
              "Check-in": "2025-03-20",
              "Check-out": "2025-03-25",
              "Duration": "5 Nights",
            }),
            PaymentDetailCard(title: "Guest Information", details: {
              "Guest Name": "John Doe",
              "Email": "john.doe@example.com",
              "Phone": "+1234567890",
            }),
            PaymentDetailCard(title: "Payment Details", details: {
              "Payment ID": "TXN987654",
              "Payment Date": "2025-03-18",
              "Payment Method": "Credit Card",
              "Amount Paid": "\$500",
              "Currency": "USD",
              "Discount Applied": "10% off",
              "Taxes & Fees": "\$20",
              "Total Amount": "\$480",
            }),
            PaymentDetailCard(title: "Payment Status", details: {
              "Status": "Paid",
              "Refund Details": "N/A",
            }),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle invoice download
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Downloading Invoice...")),
                  );
                },
                icon: Icon(Icons.download),
                label: Text("Download Invoice"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetailCard extends StatelessWidget {
  final String title;
  final Map<String, String> details;

  PaymentDetailCard({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Column(
              children: details.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key, style: TextStyle(fontWeight: FontWeight.w500)),
                      Text(entry.value, style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
