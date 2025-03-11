import 'package:flutter/material.dart';

void main() {
  runApp(NewLandlords());
}

class NewLandlords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landlord(),
    );
  }
}

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
                      Container(
                        height: 40,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search property",
                            prefixIcon: Icon(Icons.search,
                                color: Colors.grey, size: 21),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          child: Icon(Icons.person)),
                      SizedBox(width: 10),
                      CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          child: Icon(Icons.notification_add)),
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
                  _buildLandlordTable1(), // New Landlords Tab
                  _buildLandlordTable2(), // New Landlords Tab
                  _buildLandlordTable3(), // New Landlords Tab

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// **Table UI**
  Widget _buildLandlordTable1() => SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 20,
        // Adjust spacing
        dataRowMinHeight: 60,
        // Minimum row height
        dataRowMaxHeight: 100,

        // Maximum row height
        decoration: BoxDecoration(color: Colors.white),
        columns: [
          _buildColumn('S/NO'),
          _buildColumn('Name'),
          _buildColumn('Email'),
          _buildColumn('Phone number'),
          _buildColumn('Address'),
          _buildColumn('Gender'),
          _buildColumn('ID proof'),
          _buildColumn('Action'),
        ],

        rows: List.generate(
          landlords.length,
              (index) {
            final landlord = landlords[index];
            return DataRow(
              cells: [
                DataCell(Text(landlord.S_NO,
                    style: TextStyle(fontWeight: FontWeight.bold))),
                DataCell(Text(landlord.Name)),
                DataCell(Text(landlord.Email)),
                DataCell(Text(landlord.Phone_no)),
                DataCell(
                  SizedBox(
                    width: 200, // Set a fixed width for better alignment
                    child: Text(landlord.Address, softWrap: true),
                  ),
                ),
                DataCell(Text(landlord.Gender)),
                DataCell(Text(landlord.ID_Proof)),
                DataCell(Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.green, width: 2),
                        // Green border
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                      ),
                      onPressed: () {
                        // Handle Accept Action
                      },
                      child: Text(
                        "Accept",
                        style: TextStyle(color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red, width: 2),
                        // Red border
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                      ),
                      onPressed: () {
                        // Handle Reject Action
                      },
                      child: Text(
                        "Reject",
                        style: TextStyle(color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),

              ],
            );
          },
        ),
      ),
    );


  }
Widget _buildLandlordTable2() => SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: DataTable(
    columnSpacing: 20,
    // Adjust spacing
    dataRowMinHeight: 60,
    // Minimum row height
    dataRowMaxHeight: 100,
    // Maximum row height
    decoration: BoxDecoration(color: Colors.white),
    columns: [
      _buildColumn('S/NO'),
      _buildColumn('Name'),
      _buildColumn('Email'),
      _buildColumn('Phone number'),
      _buildColumn('Address'),
      _buildColumn('Gender'),
      _buildColumn('ID proof'),
      _buildColumn('Action'),
    ],
    rows: List.generate(
      landlords.length,
          (index) {
        final landlord = landlords[index];
        return DataRow(
          cells: [
            DataCell(Text(landlord.S_NO,
                style: TextStyle(fontWeight: FontWeight.bold))),
            DataCell(Text(landlord.Name)),
            DataCell(Text(landlord.Email)),
            DataCell(Text(landlord.Phone_no)),
            DataCell(
              SizedBox(
                width: 200, // Set a fixed width for better alignment
                child: Text(landlord.Address, softWrap: true),
              ),
            ),
            DataCell(Text(landlord.Gender)),
            DataCell(Text(landlord.ID_Proof)),
            DataCell(Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green, width: 2),
                    // Green border
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                  onPressed: () {
                    // Handle Accept Action
                  },
                  child: Text(
                    "View House",
                    style: TextStyle(color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            )),
          ],
        );
      },
    ),
  ),
);
Widget _buildLandlordTable3() => SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: DataTable(
    columnSpacing: 20,
    // Adjust spacing
    dataRowMinHeight: 60,
    // Minimum row height
    dataRowMaxHeight: 100,
    // Maximum row height
    decoration: BoxDecoration(color: Colors.white),
    columns: [
      _buildColumn('S/NO'),
      _buildColumn('Name'),
      _buildColumn('Email'),
      _buildColumn('Phone number'),
      _buildColumn('Address'),
      _buildColumn('Gender'),
      _buildColumn('ID proof'),
      _buildColumn('Status'),
    ],
    rows: List.generate(
      landlords.length,
          (index) {
        final landlord = landlords[index];
        return DataRow(
          cells: [
            DataCell(Text(landlord.S_NO,
                style: TextStyle(fontWeight: FontWeight.bold))),
            DataCell(Text(landlord.Name)),
            DataCell(Text(landlord.Email)),
            DataCell(Text(landlord.Phone_no)),
            DataCell(
              SizedBox(
                width: 200, // Set a fixed width for better alignment
                child: Text(landlord.Address, softWrap: true),
              ),
            ),
            DataCell(Text(landlord.Gender)),
            DataCell(Text(landlord.ID_Proof)),
            DataCell(Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red, width: 2), // Red border
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  onPressed: () {
                    // Handle Reject Action
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: Colors.red, size: 18), // Rejection Icon
                      SizedBox(width: 8),
                      Text(
                        "Rejected",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),

          ],
        );
      },
    ),
  ),
);





  /// **Reusable Column Builder**
  DataColumn _buildColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }

/// **Sample Data (Replace with actual data from API or DB)**
List<LandlordModel> landlords = [
  LandlordModel(
      S_NO: "1",
      Name: "John Doe",
      Email: "johndoe@gmail.com",
      Phone_no: "+123456789",
      Address: "123 Main Street\n marylebone\n London \n W1U 8EW \N United kingdom",
      Gender: "Male",
      ID_Proof: "Aadhar Card"),
  LandlordModel(
      S_NO: "2",
      Name: "Jane Smith",
      Email: "janesmith@gmail.com",
      Phone_no: "+987654321",
      Address: "456 Elm Street",
      Gender: "Female",
      ID_Proof: "Passport"),
];

/// **Model Class for Landlord**
class LandlordModel {
  String S_NO, Name, Email, Phone_no, Address, Gender, ID_Proof;

  LandlordModel({
    required this.S_NO,
    required this.Name,
    required this.Email,
    required this.Phone_no,
    required this.Address,
    required this.Gender,
    required this.ID_Proof,
  });
}



