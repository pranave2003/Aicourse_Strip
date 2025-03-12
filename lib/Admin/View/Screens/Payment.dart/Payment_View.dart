import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      "Welcome ",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Admin, ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0A71CB)),
                    ),
                  ],
                ),
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
                          "Admin",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment History",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(

              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(

                scrollDirection: Axis.vertical,

                child: DataTable(
                  // dividerThickness: 4.0,
                  headingRowColor: MaterialStateColor.resolveWith((
                      states) => Colors.grey.shade300),
                  // horizontalMargin: 2.0,

                  columnSpacing: 40,
                  // Adjust spacing
                  // dataRowMinHeight: 70,
                  // Minimum row height
                  dataRowMaxHeight: 180,

                  // columnSpacing: 15,
                  // dataRowHeight: 100,
                  decoration: BoxDecoration(color: Colors.white),

                  columns: [
                    _buildColumn('S/no'),
                    _buildColumn('Name'),
                    _buildColumn('Transaction id'),
                    _buildColumn('House\n Details'),
                    // _buildColumn('Token amount'),
                    _buildColumn('Payment \ndate & time'),
                    // _buildColumn('Landlord\n name'),
                    _buildColumn('Payment\n method'),
                    _buildColumn('Rent\n Period'),
                    _buildColumn('Status'),


                  ],

                  rows: [
                    _buildRow("1"),


                    _buildRow2("2"),
                  ],
                  // Example thickness value

                ),

              ),


            ),


          ),

        ],
      ),
    );
  }

  DataColumn _buildColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }

  DataRow _buildRow(String index) {
    return DataRow(
      cells: [
        DataCell(Text(index)), // S/no
        DataCell(Text("John Doe")), // Name
        DataCell(Text("TXN123456789")), // Transaction id
        DataCell(Text("Portchester House\n£300\n Mr. Smith")), // House name
        // DataCell(Text("£300")), // Token amount
        DataCell(Text("12 Mar 2024, 10:30 AM")), // Payment date & time
        // DataCell(Text("Mr. Smith")), // Landlord name
        DataCell(Text("Credit Card")), // Payment method
        DataCell(Text("March 2024 - April 2024")), // Rent Period
        // DataCell(Text("Completed")),
    DataCell(Row(
    children: [
    OutlinedButton(
    style: OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.green, width: 2), // Red border
    padding: EdgeInsets.symmetric(vertical: 12, horizontal:14),
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
    Icon(Icons.verified, color: Colors.greenAccent, size: 18), // Rejection Icon
    SizedBox(width: 8),
    Text(
    "Paid",
    style: TextStyle(
    color: Colors.green,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
    ),
    ],// Status
    ))],
    );
  }

  DataRow _buildRow2(String index) {
    return DataRow(
      cells: [
        DataCell(Text(index)), // S/no
        DataCell(Text("Jane Doe")), // Name
        DataCell(Text("TXN987654321")), // Transaction id
        DataCell(Text("Victoria House\n£400\nMrs. Johnson")), // House name
        // DataCell(Text("£400")), // Token amount
        DataCell(Text("15 Mar 2024, 02:15 PM")), // Payment date & time
        // DataCell(Text("Mrs. Johnson")), // Landlord name
        DataCell(Text("Bank Transfer")), // Payment method
        DataCell(Text("April 2024 - May 2024")), // Rent Period
        DataCell(Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.redAccent, width: 2), // Red border
                padding: EdgeInsets.symmetric(vertical: 12, horizontal:14),
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
                  Icon(Icons.verified, color: Colors.redAccent, size: 18), // Rejection Icon
                  SizedBox(width: 8),
                  Text(
                    "Pending",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],// Status
        ))],// Status,
    );
  }


}
