import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsEnglish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class BachelorsCourse extends StatefulWidget {
  const BachelorsCourse({super.key});

  @override
  State<BachelorsCourse> createState() => _BachelorsCourseState();
}

class _BachelorsCourseState extends State<BachelorsCourse> {
  int? selectedIndex;
  String? selectedCourse;

  final List<String> courses = [
    "BA (Hons) in English",
    "BSc in Mathematics",
    "BSc in Physics",
    "BSc in Chemistry",
    "BSc in Statistics",
    "BSc in Computer Applications (BCA)",
    "BSc in Microbiology",
    "BSc in Genetics",
    "BSc in Zoology",
    "BSc in Agriculture",

    "Bachelor of Economics (BEcon)",
    "Bachelor of Accounting",
    "Bachelor of Business Analytics",
    "Bachelor of Financial Markets",
    "Bachelor of International Business and Economics",
    "BBA (Bachelor of Business Administration)",
    "Bachelor of Commerce (B.Com)",
    "Bachelor of Management Studies (BMS)",
    "Bachelor of Marketing",
    "Bachelor of Entrepreneurship",
    "Bachelor in Hospitality & Tourism Management",
    "BA in Psychology",
    "BA in Anthropology",
    "BA in Philosophy",
    "BA in Linguistics",
    "BA in Gender Studies",
    "BA in Cultural Studies",
    "BA  in Computer Science",




    "BA in Development Studies",
    "BA in Global Studies",
    "BA in Peace and Conflict Studies"
  ];

  String searchQuery = "";
  List<String> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = courses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Country/main.png"),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                    filteredCourses = courses
                        .where((course) =>
                        course.toLowerCase().contains(searchQuery))
                        .toList();
                    if (selectedCourse != null &&
                        !filteredCourses.contains(selectedCourse)) {
                      selectedIndex = null;
                      selectedCourse = null;
                    }
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Search Course",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  bool isSelected = selectedCourse == course;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndex = null;
                          selectedCourse = null;
                        } else {
                          selectedIndex = index;
                          selectedCourse = course;
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected
                            ? const Color(0xff0A1F52)
                            : Colors.grey,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedIndex = index;
                                  selectedCourse = course;
                                } else {
                                  selectedIndex = null;
                                  selectedCourse = null;
                                }
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              course,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
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
                if (selectedCourse == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please choose a course")),
                  );
                  return;
                }
                if (selectedCourse != null) {
                  context
                      .read<SelectionCubit>()
                      .updateSelection("course", selectedCourse.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BachelorsEnglish(),
                    ),
                  );
                };
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: const Color(0xff0A71CB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
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
