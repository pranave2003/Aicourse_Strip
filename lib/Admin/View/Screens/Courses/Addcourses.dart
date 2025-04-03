import 'package:flutter/material.dart';

void main() {
  runApp(Addcourses());
}

class Addcourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseFinderScreen(),
    );
  }
}

class CourseFinderScreen extends StatelessWidget {
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
                      Text("Welcome ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Admin,",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0A71CB))),
                    ],
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
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "AI Course Management",
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
                          "+Add",
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 20),

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
                    Tab(
                        child: Text("Bachelors",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Tab(
                        child: Text("Masters",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Tab(
                        child: Text("MBA",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
              ),

              /// **Tab Content**
              Container(
                height: 600, // Adjust height to fit content
                child: TabBarView(
                  children: [
                    CourseAdding1(),
                    CourseAdding2(),
                    CourseAdding3(),
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

// **Data for Dropdowns**
List<String> countryList = ["USA", "Canada", "UK", "Germany"];
List<String> courseList = ["Computer Science", "Business", "Engineering"];
List<String> experienceList = ["No Experience", "1-2 Years", "3-5 Years", "5+ Years"];

List<String> educationLevels = ["High School", "Bachelor’s", "Master’s"];
List<String> boards = ["CBSE", "ICSE", "State Board", "IB"];
List<String> percentages = ["Below 60%", "60-75%", "75-90%", "90%+"];

List<String> englishTests = ["IELTS", "TOEFL", "PTE"];
List<String> scores = ["Below 5.5", "5.5 - 6.5", "6.5 - 7.5", "7.5+"];

List<String> companyTypes = ["Startup", "MNC", "Government", "Freelancer"];
List<String>orgnizationTypes  = ["YES", "NO"];

List<String> durations = ["6 months", "1 year", "2 years", "More than 2 years"];
List<String> Research_paper = ["YES", "NO"];


// **Page 1: Bachelors**
class CourseAdding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          DropdownField(label: "Country Name", options: countryList),
          DropdownField(label: "Course Name", options: courseList),
          DropdownField(label: "Work Experience", options: experienceList),
          DropdownField(label: "Education Level", options: educationLevels),
          DropdownField(label: "Board", options: boards),
          DropdownField(label: "Percentage", options: percentages),
          DropdownField(label: "English Test", options: englishTests),
          DropdownField(label: "Score", options: scores),
          DropdownField(label: "Academic Test", options: englishTests),
          DropdownField(label: "Score", options: scores),
          DropdownField(label: "Extracurricular activities", options: companyTypes),
          DropdownField(label: "Organization",options:orgnizationTypes),
          DropdownField(label: "Choose Duration", options: durations),
        ],
      ),
    );
  }
}

// **Page 2: Masters**
class CourseAdding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          DropdownField(label: "Country Name", options: countryList),
          DropdownField(label: "Course Name", options: courseList),
          DropdownField(label: "Work Experience", options: experienceList),
          DropdownField(label: "Education Level", options: educationLevels),
          DropdownField(label: "Percentage", options: percentages),
          DropdownField(label: "English Test", options: englishTests),
          DropdownField(label: "Score", options: scores),
          DropdownField(label: "Academic Test", options: englishTests),
          DropdownField(label: "Score", options: scores),
          DropdownField(label: "Research Paper", options: Research_paper),

        ],
      ),
    );
  }
}

// **Page 3: MBA**
class CourseAdding3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          DropdownField(label: "Country Name", options: countryList),
          DropdownField(label: "Course Name", options: courseList),
          DropdownField(label: "Work Experience", options: experienceList),
          DropdownField(label: "Education Level", options: educationLevels),
          DropdownField(label: "Board", options: boards),
          DropdownField(label: "Percentage", options: percentages),
          DropdownField(label: "English Test", options: englishTests),
          DropdownField(label: "Score", options: scores),
          DropdownField(label: "Academic Test", options: englishTests),
          DropdownField(label: "Score", options: scores),
          DropdownField(label: "Company Type", options: companyTypes),
          DropdownField(label: "Organization",options:orgnizationTypes),
          DropdownField(label: "Choose Duration", options: durations),],
      ),
    );
  }
}

// **Stateful Dropdown Widget**
class DropdownField extends StatefulWidget {
  final String label;
  final List<String> options;

  DropdownField({
    required this.label,
    required this.options,
  });

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150, // Adjust width as needed
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
                      selectedValue = value;
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



