// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(NewLandlords());
// }
//
// class NewLandlords extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Landlord(),
//     );
//   }
// }
//
// class Landlord extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// **Header Section**
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Text("Welcome ",
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.bold)),
//                       Text("Admin,",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff0A71CB))),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                           backgroundColor: Color(0xffD9D9D9),
//                           child: Icon(Icons.notification_add)),
//                       SizedBox(width: 10),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 14, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(width: 0.5, color: Colors.grey),
//                         ),
//                         child: Row(
//                           children: [
//                             const CircleAvatar(
//                               radius: 20, // Ensure a proper radius is set
//                               backgroundColor: Colors.grey, // Fallback color
//                               backgroundImage: AssetImage(
//                                   'assets/Profile/img.png'), // Corrected Path
//                             ),
//                             const SizedBox(width: 10),
//                             const Text(
//                               "Admin",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//             /// **Tab Bar**
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TabBar(
//                 labelColor: Colors.black,
//                 indicatorColor: Colors.blue,
//                 tabs: [
//                   Tab(
//                       child: Text("New Landlords",
//                           style: TextStyle(fontWeight: FontWeight.bold))),
//                   Tab(
//                       child: Text("Accepted Landlords",
//                           style: TextStyle(fontWeight: FontWeight.bold))),
//                   Tab(
//                       child: Text("Rejected Landlords",
//                           style: TextStyle(fontWeight: FontWeight.bold))),
//                 ],
//               ),
//             ),
//
//             /// **Tab Content**
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   _buildLandlordTable1(), // New Landlords Tab
//                   _buildLandlordTable2(), // New Landlords Tab
//                   _buildLandlordTable3(), // New Landlords Tab
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// **Table UI**
//   Widget _buildLandlordTable1() => SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: DataTable(
//           headingRowColor: MaterialStateColor.resolveWith(
//               (states) => Colors.grey.shade300), // Grey color for the header
//
//           columnSpacing: 45,
//           dataRowMaxHeight: 100,
//           // columnSpacing: 20,
//           // // Adjust spacing
//           // dataRowMinHeight: 60,
//           // // Minimum row height
//           // dataRowMaxHeight: 100,
//
//           // Maximum row height
//           decoration: BoxDecoration(color: Colors.white),
//           columns: [
//             _buildColumn('S/NO'),
//             _buildColumn('Name'),
//             _buildColumn('Email'),
//             _buildColumn('Phone number'),
//             _buildColumn('Address'),
//             _buildColumn('Gender'),
//             _buildColumn('ID proof'),
//             _buildColumn('Action'),
//           ],
//
//           rows: List.generate(
//             landlords.length,
//             (index) {
//               final landlord = landlords[index];
//               return DataRow(
//                 cells: [
//                   DataCell(Text(landlord.S_NO,
//                       style: TextStyle(fontWeight: FontWeight.bold))),
//                   DataCell(Text(landlord.Name)),
//                   DataCell(Text(landlord.Email)),
//                   DataCell(Text(landlord.Phone_no)),
//                   DataCell(
//                     SizedBox(
//                       width: 200, // Set a fixed width for better alignment
//                       child: Text(landlord.Address, softWrap: true),
//                     ),
//                   ),
//                   DataCell(Text(landlord.Gender)),
//                   DataCell(Text(landlord.ID_Proof)),
//                   DataCell(Row(
//                     children: [
//                       OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.green, width: 2),
//                           // Green border
//                           padding: EdgeInsets.symmetric(
//                               vertical: 12, horizontal: 20),
//                         ),
//                         onPressed: () {
//                           // Handle Accept Action
//                         },
//                         child: Text(
//                           "Accept",
//                           style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(color: Colors.red, width: 2),
//                           // Red border
//                           padding: EdgeInsets.symmetric(
//                               vertical: 12, horizontal: 20),
//                         ),
//                         onPressed: () {
//                           // Handle Reject Action
//                         },
//                         child: Text(
//                           "Reject",
//                           style: TextStyle(
//                               color: Colors.red,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   )),
//                 ],
//               );
//             },
//           ),
//         ),
//       );
// }
//
// Widget _buildLandlordTable2() => SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         headingRowColor: MaterialStateColor.resolveWith(
//             (states) => Colors.grey.shade300), // Grey color for the header
//         columnSpacing: 20,
//         horizontalMargin: 2.0, // Adjust spacing
//         dataRowMinHeight: 60, // Minimum row height
//         dataRowMaxHeight: 100, // Maximum row height
//         columns: [
//           _buildColumn('S/NO'),
//           _buildColumn('Name'),
//           _buildColumn('Email'),
//           _buildColumn('Phone number'),
//           _buildColumn('Address'),
//           _buildColumn('Gender'),
//           _buildColumn('ID proof'),
//           _buildColumn('Action'),
//         ],
//         rows: List.generate(
//           landlords.length,
//           (index) {
//             final landlord = landlords[index];
//             return DataRow(
//               cells: [
//                 DataCell(Text(landlord.S_NO,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//                 DataCell(Text(landlord.Name)),
//                 DataCell(Text(landlord.Email)),
//                 DataCell(Text(landlord.Phone_no)),
//                 DataCell(
//                   SizedBox(
//                     width: 200, // Set a fixed width for better alignment
//                     child: Text(landlord.Address, softWrap: true),
//                   ),
//                 ),
//                 DataCell(Text(landlord.Gender)),
//                 DataCell(Text(landlord.ID_Proof)),
//                 DataCell(Row(
//                   children: [
//                     OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.green, width: 2),
//                         // Green border
//                         padding:
//                             EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                       ),
//                       onPressed: () {
//                         // Handle Accept Action
//                       },
//                       child: Text(
//                         "View House",
//                         style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 )),
//               ],
//             );
//           },
//         ),
//       ),
//     );
// Widget _buildLandlordTable3() => SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         headingRowColor: MaterialStateColor.resolveWith(
//             (states) => Colors.grey.shade300), // Grey color for the header
//         columnSpacing: 20,
//         // Adjust spacing
//         dataRowMinHeight: 60,
//         // Minimum row height
//         dataRowMaxHeight: 100,
//         // Maximum row height
//         decoration: BoxDecoration(color: Colors.white),
//         columns: [
//           _buildColumn('S/NO'),
//           _buildColumn('Name'),
//           _buildColumn('Email'),
//           _buildColumn('Phone number'),
//           _buildColumn('Address'),
//           _buildColumn('Gender'),
//           _buildColumn('ID proof'),
//           _buildColumn('Status'),
//         ],
//         rows: List.generate(
//           landlords.length,
//           (index) {
//             final landlord = landlords[index];
//             return DataRow(
//               cells: [
//                 DataCell(Text(landlord.S_NO,
//                     style: TextStyle(fontWeight: FontWeight.bold))),
//                 DataCell(Text(landlord.Name)),
//                 DataCell(Text(landlord.Email)),
//                 DataCell(Text(landlord.Phone_no)),
//                 DataCell(
//                   SizedBox(
//                     width: 200, // Set a fixed width for better alignment
//                     child: Text(landlord.Address, softWrap: true),
//                   ),
//                 ),
//                 DataCell(Text(landlord.Gender)),
//                 DataCell(Text(landlord.ID_Proof)),
//                 DataCell(Row(
//                   children: [
//                     OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(
//                             color: Colors.red, width: 2), // Red border
//                         padding:
//                             EdgeInsets.symmetric(vertical: 12, horizontal: 20),
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(10), // Rounded corners
//                         ),
//                       ),
//                       onPressed: () {
//                         // Handle Reject Action
//                       },
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.verified,
//                               color: Colors.red, size: 18), // Rejection Icon
//                           SizedBox(width: 8),
//                           Text(
//                             "Rejected",
//                             style: TextStyle(
//                               color: Colors.red,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//
// // Helper function for styling the column headers
// DataColumn _buildColumn(String label) {
//   return DataColumn(
//     label: Text(
//       label,
//       style: TextStyle(fontWeight: FontWeight.bold), // Make header text bold
//     ),
//   );
// }
//
// /// **Sample Data (Replace with actual data from API or DB)**
// List<LandlordModel> landlords = [
//
// ];
//
// /// **Model Class for Landlord**
// class LandlordModel {
//   String S_NO, Name, Email, Phone_no, Address, Gender, ID_Proof;
//
//   LandlordModel({
//     required this.S_NO,
//     required this.Name,
//     required this.Email,
//     required this.Phone_no,
//     required this.Address,
//     required this.Gender,
//     required this.ID_Proof,
//     required name,
//     required email,
//     required password,
//     required phone,
//   });
//
//   get password => null;
//
//   get state => null;
//
//   get phone => null;
// }
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
                              backgroundImage: AssetImage(
                                  'assets/Profile/img.png'),
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
                  Tab(child: Text("New Landlords",
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  Tab(child: Text("Accepted Landlords",
                      style: TextStyle(fontWeight: FontWeight.bold))),
                  Tab(child: Text("Rejected Landlords",
                      style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),

            /// **Tab Content**
            Expanded(
              child: TabBarView(
                children: [
                  _buildLandlordTable(landlords), // New Landlords
                  _buildLandlordTable(acceptedLandlords), // Accepted
                  _buildLandlordTable(rejectedLandlords), // Rejected
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Table UI**
  Widget _buildLandlordTable(List<LandlordModel> landlords) =>
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.grey.shade300),
          columnSpacing: 45,
          dataRowMaxHeight: 100,
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
                  DataCell(SizedBox(
                    width: 200,
                    child: Text(landlord.Address, softWrap: true),
                  )),
                  DataCell(Text(landlord.Gender)),
                  DataCell(Text(landlord.ID_Proof)),
                  DataCell(Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.green, width: 2),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                        ),
                        onPressed: () {
                          // Handle Accept Action
                        },
                        child: Text(
                          "Accept",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red, width: 2),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                        ),
                        onPressed: () {
                          // Handle Reject Action
                        },
                        child: Text(
                          "Reject",
                          style: TextStyle(
                              color: Colors.red,
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

// Helper function for styling the column headers
DataColumn _buildColumn(String label) {
  return DataColumn(
    label: Text(
      label,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}

/// **Sample Data**
List<LandlordModel> landlords = [
  LandlordModel(
    S_NO: "1",
    Name: "John Doe",
    Email: "johndoe@example.com",
    Phone_no: "+123456789",
    Address: "123 Main Street, New York, USA",
    Gender: "Male",
    ID_Proof: "Passport",
  ),
  LandlordModel(
    S_NO: "2",
    Name: "Jane Smith",
    Email: "janesmith@example.com",
    Phone_no: "+987654321",
    Address: "456 Elm Street, Los Angeles, USA",
    Gender: "Female",
    ID_Proof: "Driver's License",
  ),
];

List<LandlordModel> acceptedLandlords = [
  LandlordModel(
    S_NO: "3",
    Name: "Michael Johnson",
    Email: "michaeljohnson@example.com",
    Phone_no: "+9988776655",
    Address: "654 Birch Street, San Francisco, USA",
    Gender: "Male",
    ID_Proof: "National ID",
  ),
];

List<LandlordModel> rejectedLandlords = [
  LandlordModel(
    S_NO: "4",
    Name: "Emily Davis",
    Email: "emilydavis@example.com",
    Phone_no: "+5566778899",
    Address: "321 Pine Street, Houston, USA",
    Gender: "Female",
    ID_Proof: "Passport",
  ),
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
