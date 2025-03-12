import 'package:flutter/material.dart';

class ViewHouses extends StatefulWidget {
  const ViewHouses({super.key});

  @override
  State<ViewHouses> createState() => _ViewHousesState();
}

class _ViewHousesState extends State<ViewHouses> {
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
                  "Property View Page",
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
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300),
                  horizontalMargin:2.0,

                  columnSpacing: 50,
                  // Adjust spacing
                  dataRowMinHeight: 70,
                  // Minimum row height
                  dataRowMaxHeight: 180,

                  // columnSpacing: 15,
                  // dataRowHeight: 100,
                  decoration: BoxDecoration(color: Colors.white),

                  columns: [
                    _buildColumn('S/no'),
                    _buildColumn('Property Name'),
                    _buildColumn('Token Amount'),
                    _buildColumn('Image'),
                    _buildColumn('Address'),
                    _buildColumn('About Property'),
                    _buildColumn('Period'),
                    _buildColumn('Property Information'),

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
        DataCell(Text(index)),
        DataCell(Text("Portchester House")),
        DataCell(Text("300 Pounds")),
        DataCell(Text("img.jpg")),
        DataCell(Text(
            "25 Baker Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom")),
        DataCell(Text(
            "sqft: 1200\nRooms: 2\nBathrooms: 2\nFurnishing: Furnished\nKitchen: Yes")),
        DataCell(Text("1 Month")),
        DataCell(Text("Located near Boston University")),
      ],
    );

  }
  DataRow _buildRow2(String index) {
    return DataRow(
      cells: [
        DataCell(Text(index)),
        DataCell(Text("Victoria house")),
        DataCell(Text("300 Pounds")),
        DataCell(Text("img.jpg")),
        DataCell(Text(
            "25 Baker Street\nMarylebone\nLondon\nW1U 8EW\nUnited Kingdom")),
        DataCell(Text(
            "sqft: 1200\nRooms: 2\nBathrooms: 2\nFurnishing: Furnished\nKitchen: Yes")),
        DataCell(Text("1 Month")),
        DataCell(Text("Located near Boston University")),
      ],
    );

  }
}





