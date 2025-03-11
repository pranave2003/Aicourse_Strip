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
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
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
                        onPressed: () {}, icon: Icon(Icons.notification_add)),
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
                    _buildColumn('Name'),
                    _buildColumn('Transaction id'),
                    _buildColumn('House name'),
                    _buildColumn('Token amount'),
                    _buildColumn('Payment date&'),
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





