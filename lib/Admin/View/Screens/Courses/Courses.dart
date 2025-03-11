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
                  Container(
                    height: 40,
                    width: 400,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: .5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 6),
                        hintText: 'Search university or courses',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 21,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xffD9D9D9),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications)),
                    ),
                  )
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
                // ElevatedButton.icon(
                //   onPressed: () {
                //     // Action to add a course
                //   },
                //   icon: const Icon(Icons.add),
                //   label: const Text("Add"),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xff0A71CB),
                //     foregroundColor: Colors.white,
                //     padding:
                //     const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //   ),
                // ),
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
                                    color: Colors.black),
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

