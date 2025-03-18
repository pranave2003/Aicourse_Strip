
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
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
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Feedback Management",
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
                  columnSpacing: 150,
                  dataRowMaxHeight: 80,
                  decoration: BoxDecoration(color: Colors.white),
                  columns: [
                    _buildColumn('User details'),
                    _buildColumn('Star rating'),
                    _buildColumn('Written feedback'),
                    _buildColumn('Date'),
                    _buildColumn('Edit/Delete'),
                  ],
                  rows: [
                    _buildRow("John Doe", "johndoe@example.com", "123-456-7890", 4, "Great place to stay!", "2024-03-15"),
                    _buildRow("Alice Smith", "alice@example.com", "987-654-3210", 5, "Loved the experience!", "2024-03-16"),
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

  DataRow _buildRow(String name, String email, String phone, int rating, String feedback, String date) {
    return DataRow(
      cells: [
        DataCell(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(email, style: TextStyle(color: Colors.grey)),
            Text(phone, style: TextStyle(color: Colors.grey)),
          ],
        )),
        DataCell(Row(
          children: [
            Text(rating.toString()),
            SizedBox(width: 5),
            Icon(Icons.star, color: Colors.amber, size: 20),
          ],
        )),
        DataCell(Text(feedback)),
        DataCell(Text(date)),
        DataCell(Row(
          children: [
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red, size: 24),
              onPressed: () {
                _showDeleteConfirmationDialog(context, name);
              },
            ),
          ],
        )),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Deletion"),
          content: Text("Are you sure you want to delete feedback from $name?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                print("Feedback from $name deleted");
                Navigator.of(context).pop();
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
