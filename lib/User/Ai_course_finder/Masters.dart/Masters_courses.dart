import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsEnglish.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/MastersEnglishtest.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/Maters_academic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Masters_Courses extends StatefulWidget {
  const Masters_Courses({super.key});

  @override
  State<Masters_Courses> createState() => _Masters_CoursesState();
}

class _Masters_CoursesState extends State<Masters_Courses> {
  Set<int> selectedIndices = {}; // Track selected course indices
  List<String> selectedCourses = []; // Store selected course names

  // List of available courses
  final List<String> courses = [
    "MSc in Finance",
    "MSc in Economics",
    "MSc in Human Resource Management",
    "MSc in Marketing",
    "MSc in Digital Business",
    "MSc in Project Management",
    "MSc in Supply Chain & Logistics",
    "MSc in Computer Science",
    "MSc in Artificial Intelligence",
    "MSc in Data Science",
    "MSc in Cybersecurity",
    "MSc in Information Technology",
    "MTech in Civil /"
        "MTech in Mechanical ",
  "MTech in Electrical Engineering",
    "MSc in Biotechnology",
    "MSc in Physics / Chemistry / Mathematics",
    "MD (Doctor of Medicine)",
    "MDS (Master of Dental Surgery)",
    "MPharm (Master of Pharmacy)",
    "MSc in Public Health",
    "MSc in Nursing",
    "MSc in Medical Lab Technology",
    "MA in Psychology",
    "MA in Sociology",
    "MA in Journalism & Mass Communication",
    "MA in English Literature",
    "MA in History",
    "MA in Political Science",
    "MA in Fine Arts",
    "LLM (Master of Laws)",
    "Master in Criminology",
    "MSc in International Relations",
    "MSc in Public Policy",
    "Master in Social Work (MSW)",
    "MTech in Computer Science",
    "MTech in Mechanical Engineering",
    "MTech in Electrical Engineering",
    "MTech in Robotics",
    "MSc in Industrial Engineering"
  ];

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
            image: AssetImage("assets/country/img_6.png"),
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
                itemCount: courses.length, // Number of courses
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndices.contains(index);
                  return GestureDetector(

                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndices.remove(index);
                          selectedCourses.remove(courses[index]);
                          MaterialPageRoute(
                            builder: (context) => Maters_academic(),

                        );
                        } else {
                          selectedIndices.add(index);
                          selectedCourses.add(courses[index]);
                        }
                        print("Selected Courses: $selectedCourses");
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
                                  selectedIndices.add(index);
                                  selectedCourses.add(courses[index]);
                                } else {
                                  selectedIndices.remove(index);
                                  selectedCourses.remove(courses[index]);
                                }
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            courses[index],
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
                if (selectedCourses != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MastersEnglishtest(),
                    ),
                  );
                  print("Final Selected Courses: $selectedCourses");
                }
                else {
                  print("Please choose courses");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please choose courses")),
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
                    selectedCourses.isEmpty ? "No Preference" : "Continue",
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






