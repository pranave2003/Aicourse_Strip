import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBAEnglish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class MBA_Courses extends StatefulWidget {
  const MBA_Courses({super.key});

  @override
  State<MBA_Courses> createState() => _MBA_CoursesState();
}

class _MBA_CoursesState extends State<MBA_Courses> {
  int? selectedIndex; // Track selected course index
  String? selectedCourse; // Store selected course name

  // List of available courses
  final List<String> courses = [
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
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Set the selected index
                        selectedCourse = courses[index]; // Set the selected course
                        print("Selected Course: $selectedCourse");
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
                                selectedIndex = index; // Set the selected index
                                selectedCourse = courses[index]; // Set the selected course
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
                // Validation logic to check if a course is selected
                if (selectedCourse != null) {
                  context
                      .read<SelectionCubit>()
                      .updateSelection("course", selectedCourse!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MBAEnglish(),
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