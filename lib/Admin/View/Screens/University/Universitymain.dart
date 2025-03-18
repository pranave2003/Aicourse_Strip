import 'package:flutter/material.dart';
import '../../../Model/Universitymodel/Universitymodel.dart';
import 'EditUniversity.dart';

class University_main extends StatefulWidget {
  const University_main({super.key});

  @override
  State<University_main> createState() => _University_mainState();
}

class _University_mainState extends State<University_main> {
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "University Management",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Divider(thickness: 23,height:10,color: Colors.red,),
                const SizedBox(
                  width: 18,
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              // Background color
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth:
                        MediaQuery.of(context).size.width, // Ensures full width
                  ),
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300),

                    // border: TableBorder(
                    //   verticalInside: BorderSide(
                    //       color: Colors.black,
                    //       width: 1), // Vertical line between columns
                    //   horizontalInside: BorderSide(
                    //       color: Colors.grey, width: 0.5), // Horizontal lines
                    // ),
                    decoration: BoxDecoration(color: Colors.white),
                    columns: [
                      _buildColumn('University '),
                      _buildColumn('country'),
                      _buildColumn('Type'),
                      _buildColumn('Established'),
                      _buildColumn('Action'),
                    ],

                    rows: List.generate(
                      students.length,
                      (index) {
                        final student = students[index];
                        return DataRow(

                          cells: [
                            DataCell(Text(
                              student.University_name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataCell(Text(student.Country)),
                            DataCell(Text(student.Type)),
                            DataCell(Text(student.Established)),
                            DataCell(Row(
                              children: [
                        IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.green),
                        iconSize: 30.0,
                        onPressed: () {
                        print('View all  button pressed');
                        },),IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        iconSize: 30.0,
                        onPressed: () {
                        print('Delete button pressed');
                        },),
                              ],
                            )),
                          ],
                        );
                      },
                    ),
                  ),
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
            fontSize: 20),
      ),
    );
  }
}
