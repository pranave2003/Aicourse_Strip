import 'package:flutter/material.dart';

import 'Tabs/Acceptedlandloards.dart';
import 'Tabs/Pending_landloard.dart';
import 'Tabs/RejectedLandloards.dart';

class Landlord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Header Section**
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Welcome ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Admin,",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0A71CB))),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          child: Icon(Icons.notification_add)),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 0.5, color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              backgroundImage:
                                  AssetImage('assets/Profile/img.png'),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Admin",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// **Tab Bar**
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                      child: Text("New Landlords",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Tab(
                      child: Text("Accepted Landlords",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Tab(
                      child: Text("Rejected Landlords",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),

            /// **Tab Content**
            Expanded(
              child: TabBarView(
                children: [
                  Pending_Landloard_wrapper(), // New Landlords
                  Accept_Landloard_wrapper(), // New Landlords
                  Reject_Landloard_wrapper(), // New Landlords
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Table UI**
}

// Helper function for styling the column headers
