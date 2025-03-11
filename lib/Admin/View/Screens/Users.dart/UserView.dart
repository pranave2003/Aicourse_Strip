import 'package:flutter/material.dart';

class Userview extends StatefulWidget {
  const Userview({super.key});

  @override
  State<Userview> createState() => _UserviewState();
}

class _UserviewState extends State<Userview> {
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
                      style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  Container(
                    height: 40,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 5),
                        hintText: 'Search property',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 21,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Color(0xffD9D9D9),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.person)),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Color(0xffD9D9D9),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notification_add)),
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
                  "User View Page",
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
                  headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade300),
                  columnSpacing: 40,
                  dataRowMaxHeight: 70,
                  decoration: BoxDecoration(color: Colors.white),
                  columns: [
                    _buildColumn('S/no'),
                    _buildColumn('Name'),
                    _buildColumn('Phone number'),
                    _buildColumn('Email'),
                    _buildColumn('Country'),
                    _buildColumn('State'),
                    _buildColumn('District'),
                    _buildColumn('Street'),
                    _buildColumn('Action'),
                  ],
                  rows: [
                    _buildRow("1"),
                    _buildRow2("2"),
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

  DataRow _buildRow(String index) {
    return DataRow(
      cells: [
        DataCell(Text(index)), // S/no
        DataCell(Text("John Doe")), // Name
        DataCell(Text("+1 123-456-7890")), // Phone number
        DataCell(Text("johndoe@example.com")), // Email
        DataCell(Text("United States")), // Country
        DataCell(Text("California")), // State
        DataCell(Text("Los Angeles")), // District
        DataCell(Text("123 Baker Street")), // Street
        DataCell(Row(
          children: [
            SizedBox(width: 10), // Space between buttons
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 30), // Increase icon size
              onPressed: () {
                _showDeleteConfirmationDialog(context, index);
              },
              constraints: BoxConstraints(
                minWidth: 50, // Adjust width
                minHeight: 50, // Adjust height
              ),
            )

          ],
        )), // Action
      ],
    );
  }

  DataRow _buildRow2(String index) {
    return DataRow(
      cells: [
        DataCell(Text(index)), // S/no
        DataCell(Text("Devid John")), // Name
        DataCell(Text("+44 987-654-3210")), // Phone number
        DataCell(Text("devid@example.com")), // Email
        DataCell(Text("United Kingdom")), // Country
        DataCell(Text("London")), // State
        DataCell(Text("Westminster")), // District
        DataCell(Text("456 Oxford Street")), // Street
        DataCell(Row(
          children: [
            SizedBox(width: 10), // Space between buttons
            // IconButton(
            //   icon: Icon(Icons.delete, color: Colors.red,weight:20,),
            //   onPressed: () {
            //     _showDeleteConfirmationDialog(context, index);
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 30), // Increase icon size
              onPressed: () {
                _showDeleteConfirmationDialog(context, index);
              },
              constraints: BoxConstraints(
                minWidth: 50, // Adjust width
                minHeight: 50, // Adjust height
              ),
            )

          ],
        )), // Action
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete this user?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                print("User $index deleted"); // Perform delete action
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}




