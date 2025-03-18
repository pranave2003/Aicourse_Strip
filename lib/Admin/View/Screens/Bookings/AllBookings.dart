
import 'package:course_connect/Admin/Model/Universitymodel/Bookingsmodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Allbookings());
}

class Allbookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bookings(),
    );
  }
}

class Bookings extends StatelessWidget {
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
                      Text("Landlord,",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0A71CB))),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 0.5, color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20, // Ensure a proper radius is set
                              backgroundColor: Colors.grey, // Fallback color
                              backgroundImage: AssetImage('assets/Profile/img.png'), // Corrected Path
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Landlord",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      child: Text("All Bookings",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Tab(
                      child: Text("Accepted Bookings",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Tab(
                      child: Text("Rejected Bookings",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),

            /// **Tab Content**
            Expanded(
              child: TabBarView(
                children: [
                  _buildTable1(), // New Landlords Tab
                  _buildTable2(), // New Landlords Tab
                  _buildTable3(), // New Landlords Tab

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// **Table UI**
  Widget _buildTable1() => SingleChildScrollView(

    scrollDirection: Axis.horizontal,
    child: DataTable(
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300), // Grey color for the header

      columnSpacing: 65,
      dataRowMaxHeight: 160,
      // columnSpacing: 20,
      // // Adjust spacing
      // dataRowMinHeight: 60,
      // // Minimum row height
      // dataRowMaxHeight: 100,

      // Maximum row height
      decoration: BoxDecoration(color: Colors.white),
      columns: [
        _buildColumn('S/NO'),
        _buildColumn('Name'),
        _buildColumn('Email'),
        _buildColumn('Phone number'),
        _buildColumn('Property Details'),
        _buildColumn('Rental Period'),
        // _buildColumn('ID proof'),
        _buildColumn('Action'),
      ],

      rows: List.generate(
        bookingsList.length,
            (index) {
          final landlord = bookingsList[index];
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
                  child: Text(landlord.Property_Details, softWrap: true),
                ),
              ),
              DataCell(Text(landlord.Rental_Period)),
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
Widget _buildTable2() => SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: DataTable(
    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300), // Grey color for the header
    columnSpacing: 70,
    horizontalMargin: 2.0, // Adjust spacing
    dataRowMinHeight: 60, // Minimum row height
    dataRowMaxHeight: 150, // Maximum row height
    columns: [
      _buildColumn('S/NO'),
      _buildColumn('Name'),
      _buildColumn('Email'),
      _buildColumn('Phone number'),
      _buildColumn('Property_details'),
      _buildColumn('Rental_Period'),
      _buildColumn('Action'),
    ],
    rows: List.generate(
      bookingsList.length,
          (index) {
        final landlord = bookingsList[index];
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
                child: Text(landlord.Property_Details, softWrap: true),
              ),
            ),
            DataCell(Text(landlord.Rental_Period)),
            DataCell(Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green, width: 2), // Red border
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
                      Icon(Icons.verified, color: Colors.green, size: 18), // Rejection Icon
                      SizedBox(width: 8),
                      Text(
                        "Accepted",
                        style: TextStyle(
                          color: Colors.green,
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
Widget _buildTable3() => SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: DataTable(
    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300), // Grey color for the header
    columnSpacing: 65,
    // Adjust spacing
    dataRowMinHeight: 60,
    // Minimum row height
    dataRowMaxHeight: 170,
    // Maximum row height
    decoration: BoxDecoration(color: Colors.white),
    columns: [
      _buildColumn('S/NO'),
      _buildColumn('Name'),
      _buildColumn('Email'),
      _buildColumn('Phone number'),
      _buildColumn('Property Details'),
      _buildColumn('Rental Period'),
      _buildColumn('Status'),
    ],
    rows: List.generate(
      bookingsList.length,
          (index) {
        final landlord = bookingsList[index];
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
                child: Text(landlord.Property_Details, softWrap: true),
              ),
            ),
            DataCell(Text(landlord.Rental_Period)),
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


// Helper function for styling the column headers
DataColumn _buildColumn(String label) {
  return DataColumn(
    label: Text(
      label,
      style: TextStyle(fontWeight: FontWeight.bold), // Make header text bold
    ),
  );
}


/// **Sample Data (Replace with actual data from API or DB)**

List<BookingsModel> bookingsList = [
  BookingsModel(
    S_NO: "1",
    Name: "John Doe",
    Email: "johndoe@gmail.com",
    Phone_no: "+123456789",
    Property_Details: "123 Main Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom",
    Rental_Period: "1 month",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr09piP6jki0WLDGQnRLC2rmn5XHPtBZJ6Mg&s",
  ),
  BookingsModel(
    S_NO: "2",
    Name: "John Doe",
    Email: "johndoe@gmail.com",
    Phone_no: "+123456789",
    Property_Details: "123 Main Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom",
    Rental_Period: "1 month",
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr09piP6jki0WLDGQnRLC2rmn5XHPtBZJ6Mg&s",
  ),
];


/// **Model Class for Landlord**
class BookingsModel {
  String S_NO, Name, Email, Phone_no, Property_Details, Rental_Period;

  BookingsModel({
    required this.S_NO,
    required this.Name,
    required this.Email,
    required this.Phone_no,
    required this.Property_Details,
    required this.Rental_Period, required String imageUrl,
  });
}




