
import 'package:flutter/material.dart';

class Property extends StatefulWidget {
  const Property({super.key});

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  // Example property data
  final List<Map<String, String>> properties = [
    {
      'S/no': '1',
      'Property Name': 'Sunrise Apartments',
      'Address': '123 Main St, NY',
      'Property Cost': '\$200,000',
      'Available from': 'April 2025',
      'Image': 'assets/Property/img.png',
    },
    {
      'S/no': '2',
      'Property Name': 'Ocean View Villa',
      'Address': '456 Beach Rd, CA',
      'Property Cost': '\$500,000',
      'Available from': 'April 2025',
      'Image': 'assets/Property/img_1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    const Text("Welcome ",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text("Landlord, ",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0A71CB))),
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
                          backgroundImage: AssetImage('assets/Profile/img_3.png'), // Corrected Path
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
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Property Management",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                horizontalMargin: 2.0,
                columnSpacing: 75,
                dataRowMaxHeight: 120,
                headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.grey.shade300),
                columns: [
                  _buildColumn('S/no'),
                  _buildColumn('Property Name'),
                  _buildColumn('Address'),
                  _buildColumn('Property Cost'),
                  _buildColumn('Available from'),
                  _buildColumn('Image'),
                  _buildColumn('Action'),
                ],
                rows: properties.map((property) {
                  return DataRow(
                    cells: [
                      DataCell(Text(property['S/no'] ?? '')),
                      DataCell(Text(property['Property Name'] ?? '')),
                      DataCell(Text(property['Address'] ?? '')),
                      DataCell(Text(property['Property Cost'] ?? '')),
                      DataCell(Text(property['Available from'] ?? '')),
                      DataCell(
                        property['Image'] != null
                            ? SizedBox(
                          width: 80, // Increased width
                          height: 80, // Increased height
                          child: Image.asset(
                            property['Image']!,
                            fit: BoxFit.cover,
                          ),
                        )
                            : const SizedBox(),
                      ),
                      DataCell(Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye, color: Colors.green),
                            iconSize: 30.0,
                            onPressed: () {
                              print('View button pressed');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            iconSize: 30.0,
                            onPressed: () {
                              _showDeleteConfirmationDialog(context, property['S/no'] ?? '');
                            },
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
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
            color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}

void _showDeleteConfirmationDialog(BuildContext context, String propertyId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this property?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              print("Property with ID $propertyId deleted"); // Perform delete action
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

