import 'package:flutter/material.dart';

class ViewPayment extends StatefulWidget {
  const ViewPayment({super.key});

  @override
  State<ViewPayment> createState() => _ViewPaymentState();
}

class _ViewPaymentState extends State<ViewPayment> {
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Landlord, ",
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
                  CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: Icon(Icons.notification_add)),
                  SizedBox(width: 10),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
                          backgroundImage:
                          AssetImage('assets/Profile/img.png'), // Corrected Path
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Landlord",
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.grey.shade300),
                  columnSpacing: 40,
                  dataRowMaxHeight: 180,
                  decoration: BoxDecoration(color: Colors.white),
                  columns: [
                    _buildColumn('S/no'),
                    _buildColumn('Name'),
                    _buildColumn('Transaction id'),
                    _buildColumn('Property Details'),
                    _buildColumn('Token Amount'),
                    _buildColumn('Payment \ndate & time'),
                    _buildColumn('Rent\n Period'),
                    _buildColumn('Status'),
                  ],
                  rows: [
                    _buildRow(
                      "1",
                      "John Doe",
                      "TXN123456789",
                      "Portchester House\n123 Main St\nLondon",
                      "£300",
                      "12 Mar 2024, 10:30 AM",
                      "March 2024 - April 2024",
                      "Paid",
                      Colors.green,
                    ),
                    _buildRow(
                      "2",
                      "Jane Doe",
                      "TXN987654321",
                      "Victoria House\n456 Queen St\nLondon",
                      "£400",
                      "15 Mar 2024, 02:15 PM",
                      "April 2024 - May 2024",
                      "Pending",
                      Colors.redAccent,
                    ),
                  ],
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

  DataRow _buildRow(
      String index,
      String name,
      String transactionId,
      String propertyName,
      String tokenAmount,
      String paymentDate,
      String rentPeriod,
      String status,
      Color statusColor,
      ) {
    return DataRow(
      cells: [
        DataCell(Text(index)), // S/no
        DataCell(Text(name)), // Name
        DataCell(Text(transactionId)), // Transaction id
        DataCell(Text(propertyName)), // Property Name
        DataCell(Text(tokenAmount)), // Token Amount
        DataCell(Text(paymentDate)), // Payment date & time
        DataCell(Text(rentPeriod)), // Rent Period
        DataCell(Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: statusColor, width: 2), // Status color
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              onPressed: () {
                // Handle Action
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified, color: statusColor, size: 18), // Status Icon
                  SizedBox(width: 8),
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
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
  }
}
