import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsEnglish.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/MastersEnglishtest.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/Maters_academic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/selection_cubit.dart';

class Masters_Courses extends StatefulWidget {
  const Masters_Courses({super.key});

  @override
  State<Masters_Courses> createState() => _Masters_CoursesState();
}

class _Masters_CoursesState extends State<Masters_Courses> {
  int? selectedIndex; // Track selected course index
  String? selectedCourse; // Store selected course name

  // List of available courses
  final List<String> courses = [
    "MSc in Finance",
    "MSc in Economics",
    "MSc in Human Resource\n Management",
    "MSc in Marketing",
    "MSc in Digital Business",
    "MSc in Project Management",
    "MSc in Supply Chain & Logistics",
    "MSc in Computer Science",
    "MSc in Artificial Intelligence",
    "MSc in Data Science",
    "MSc in Cybersecurity",
    "MSc in Information Technology",
    "MSc in Biotechnology",
    "MSc in Physics",
    "MSc in Chemistry",
    "MSc in Mathematics",
    "MA in Psychology",
    "MA in Sociology",
    "MA in Journalism & Mass\n Communication",
    "MA in English Literature",
    "MA in History",
    "MA in Political Science",
    "MA in Fine Arts",
    "LLM (Master of Laws)",
    "Master in Criminology",
    "MSc in International Relations",
    "MSc in Public Policy",
    "Master in Social Work (MSW)",
    "MSc in Industrial Engineering",
    "General MBA",
    "MBA in Finance",
    "MBA in Marketing",
    "MBA in Human Resource Management",
    "MBA in International Business",
    "MBA in Entrepreneurship",
    "MBA in Business Analytics",
    "MBA in Supply Chain Management",
    "MBA in Digital Marketing",
    "MBA in Operations Management",
    "MBA in Healthcare Management",
    "MBA in Hospitality & Tourism Management",
    "MBA in Retail Management",
    "MBA in Agribusiness Management",
    "MBA in Sports Management",
    "MBA in Luxury Brand Management",
    "MBA in Real Estate Management",
    "MBA in Information Technology",
    "MBA in Data Science",
    "MBA in Cybersecurity Management",
    "MBA in AI & Machine Learning",
    "MBA in Blockchain & FinTech",
    "Executive MBA (EMBA)"
  ];

  // For storing filtered list based on search query
  List<String> filteredCourses = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCourses = courses; // Initially display all courses
    searchController.addListener(_filterCourses); // Add listener to the search field
  }

  // Function to filter courses based on search query
  void _filterCourses() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredCourses = courses.where((course) {
        return course.toLowerCase().contains(query); // Case-insensitive search
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back when tapped
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/country/main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What major do you want to pursue?",
                  style: TextStyle(
                      color: Color(0xff0A1F52),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search Course",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: filteredCourses.length, // Use filtered list for courses
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndex = null;
                          selectedCourse = null;
                        } else {
                          selectedIndex = index;
                          selectedCourse = filteredCourses[index];
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedIndex = index;
                                  selectedCourse = filteredCourses[index];
                                } else {
                                  selectedIndex = null;
                                  selectedCourse = null;
                                }
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            filteredCourses[index], // Display filtered course
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                if (selectedCourse != null) {
                  context
                      .read<SelectionCubit>()
                      .updateSelection("course", selectedCourse.toString());

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MastersEnglishtest(),
                    ),
                  );
                  print("Final Selected Course: $selectedCourse");
                } else {
                  print("Please choose a course");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please choose a course")),
                  );
                }
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: Color(0xff0A71CB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    selectedCourse == null ? "No Preference" : "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
