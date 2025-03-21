
import 'package:flutter/material.dart';

void main() {
  runApp(Editcourses());
}

class Editcourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditCourseScreen(),
    );
  }
}

class EditCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Header Section**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Edit ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Course,",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0A71CB))),
                    ],
                  ),
                  Row(
                    children: [
                      // Container(
                      //   height: 40,
                      //   width: 300,
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       fillColor: Colors.white,
                      //       hintText: "Search University or courses",
                      //       prefixIcon: Icon(Icons.search,
                      //           color: Colors.grey, size: 21),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(18)),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 10),
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
                      // CircleAvatar(
                      //     backgroundColor: Color(0xffD9D9D9),
                      //     child: Icon(Icons.notification_add)),
                      // SizedBox(width: 10),
                      // CircleAvatar(
                      //   radius: 20, // Ensure a proper radius is set
                      //   backgroundColor: Colors.grey, // Fallback color
                      //   backgroundImage: AssetImage('assets/Profile/img.png'), // Corrected Path
                      // ),

                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ai COURSES  Editing Page",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        // Add action here
                      },
                      borderRadius: BorderRadius.circular(8), // Smooth border effect on tap
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                        decoration: BoxDecoration(
                          color: Colors.blue, // Blue background
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                        child: Text(
                          "+Save",
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /// **Tab Bar**
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(child: Text("Bachelors", style: TextStyle(fontWeight: FontWeight.bold))),
                    Tab(child: Text("MCA", style: TextStyle(fontWeight: FontWeight.bold))),
                    Tab(child: Text("MBA", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
              ),

              /// **Tab Content**
              Container(
                height: 600, // Adjust height to fit content
                child: TabBarView(
                  children: [
                    EditBachelorsPage(),
                    EditMcaPage(),
                    EditMbaPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// **Dropdown Data**
List<String> countryList = ["USA", "Canada", "UK", "Germany"];
List<String> bachelorsCourses = ["Computer Science", "Mechanical", "Biotechnology"];
List<String> mcaCourses = ["Software Engineering", "Cybersecurity", "Data Science"];
List<String> mbaCourses = ["Finance", "Marketing", "Human Resources"];
List<String> experienceList = ["No Experience", "1-2 Years", "3-5 Years", "5+ Years"];
List<String> educationLevels = ["High School", "Bachelor’s", "Master’s"];
List<String> boards = ["CBSE", "ICSE", "State Board", "IB"];
List<String> percentages = ["Below 60%", "60-75%", "75-90%", "90%+"];
List<String> englishTests = ["IELTS", "TOEFL", "PTE"];
List<String> scores = ["Below 5.5", "5.5 - 6.5", "6.5 - 7.5", "7.5+"];

// **Page 1: Bachelors (Edit)**
class EditBachelorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          DropdownField(label: "Country Name", options: countryList, initialValue: "USA"),
          DropdownField(label: "Course Name", options: bachelorsCourses, initialValue: "Computer Science"),
          DropdownField(label: "Board", options: boards, initialValue: "CBSE"),
          DropdownField(label: "Percentage", options: percentages, initialValue: "75-90%"),
          DropdownField(label: "English Test", options: englishTests, initialValue: "IELTS"),
          DropdownField(label: "Score", options: scores, initialValue: "6.5 - 7.5"),
        ],
      ),
    );
  }
}

// **Page 2: MCA (Edit)**
class EditMcaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          DropdownField(label: "Country Name", options: countryList, initialValue: "Canada"),
          DropdownField(label: "MCA Specialization", options: mcaCourses, initialValue: "Software Engineering"),
          DropdownField(label: "Work Experience", options: experienceList, initialValue: "1-2 Years"),
          DropdownField(label: "English Test", options: englishTests, initialValue: "TOEFL"),
          DropdownField(label: "Score", options: scores, initialValue: "7.5+"),
        ],
      ),
    );
  }
}

// **Page 3: MBA (Edit)**
class EditMbaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          DropdownField(label: "Country Name", options: countryList, initialValue: "UK"),
          DropdownField(label: "MBA Specialization", options: mbaCourses, initialValue: "Finance"),
          DropdownField(label: "Work Experience", options: experienceList, initialValue: "3-5 Years"),
          DropdownField(label: "GMAT Score", options: scores, initialValue: "6.5 - 7.5"),
        ],
      ),
    );
  }
}

// **Stateful Dropdown Widget**
class DropdownField extends StatefulWidget {
  final String label;
  final List<String> options;
  final String initialValue;

  DropdownField({
    required this.label,
    required this.options,
    required this.initialValue,
  });

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              widget.label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedValue,
                  items: widget.options
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  hint: Text("Select ${widget.label}"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

