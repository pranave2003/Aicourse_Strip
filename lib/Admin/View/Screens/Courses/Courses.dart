import 'package:flutter/material.dart';

class Coursemodel {
  final String countryName;
  final String degreeName;
  final String course;
  final String educationLevel;
  final String englishTest;

  Coursemodel({
    required this.countryName,
    required this.degreeName,
    required this.course,
    required this.educationLevel,
    required this.englishTest,
  });
}

class Courses_main extends StatefulWidget {
  const Courses_main({super.key});

  @override
  State<Courses_main> createState() => _Courses_mainState();
}

class _Courses_mainState extends State<Courses_main> {
  List<Coursemodel> students = [
    Coursemodel(
      countryName: "United States",
      degreeName: "Bachelors",
      course: "Physics",
      educationLevel: "Plus two",
      englishTest: "IELTS",
    ),
    Coursemodel(
      countryName: "United Kingdom",
      degreeName: "Masters",
      course: "Computer Science",
      educationLevel: "Graduate",
      englishTest: "TOEFL",
    ),
    Coursemodel(
      countryName: "Canada",
      degreeName: "Bachelors",
      course: "Engineering",
      educationLevel: "Plus two",
      englishTest: "PTE",
    ),
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
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AI Course Management",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Divider(thickness: 2, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey.shade300),
                  horizontalMargin:2.0,
                  columnSpacing: 40,
                  dataRowMaxHeight: 70,

                  // columnSpacing: 50,
                  // // Adjust spacing
                  // dataRowMinHeight: 10,
                  // Minimum row height
                  // dataRowMaxHeight: 180,

                  decoration: BoxDecoration(color: Colors.white),
                  columns: [
                    _buildColumn('Country Name'),
                    _buildColumn('Degree Name'),
                    _buildColumn('Course'),
                    _buildColumn('Education Level'),
                    _buildColumn('English Test'),
                    _buildColumn('Action'),
                  ],
                  rows: List.generate(
                    students.length,
                        (index) {
                      final student = students[index];
                      return DataRow(
                        cells: [
                          DataCell(Text(
                            student.countryName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataCell(Text(student.degreeName)),
                          DataCell(Text(student.course)),
                          DataCell(Text(student.educationLevel)),
                          DataCell(Text(student.englishTest)),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_red_eye,
                                    color: Colors.green),
                                onPressed: () {
                                  print('View button pressed');
                                },
                              ),
                              // IconButton(
                              //   icon: Icon(Icons.edit, color: Colors.black),
                              //   onPressed: () {
                              //     print('Edit button pressed');
                              //   },
                              // ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    students.removeAt(index);
                                  });
                                },
                              ),
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
            fontSize: 18),
      ),
    );
  }
}

