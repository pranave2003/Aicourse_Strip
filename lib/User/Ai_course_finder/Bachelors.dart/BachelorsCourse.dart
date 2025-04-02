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
  int? selectedIndex; // Track selected course index
  String? selectedCourse; // Store selected course name

  final List<String> courses = [
    "BBA (Bachelor of Business Administration)",
    "BCom (Bachelor of Commerce)",
    "BA in Business Management",
    "BSc in International Business",
    "BBA in Marketing",
    "BBA in Finance",
    "BBA in Human Resource Management",
    "BBA in Entrepreneurship",
    "BBA in Supply Chain Management",
    "BSc in Computer Science",
    "BSc in Information Technology (IT)",
    "BSc in Data Science",
    "BSc in AI & Machine Learning",
    "BSc in Biotechnology",
    "BSc in Environmental Science",
    "BA in Political Science",
    "BA in Sociology",
    "BA in History",
    "BA in English Literature",
    "BA in Journalism & Mass Communication",
    "BA in Fine Arts",
    "BA in Criminology",
    "BA in Public Administration",
    "BA in Economics",
    "BA in International Relations"
  ];

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
                itemCount: courses.length,
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
                          selectedCourse = courses[index];
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? const Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedIndex = index;
                                  selectedCourse = courses[index];
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
                              courses[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
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
                context.read<SelectionCubit>().updateSelection("course", selectedCourse.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BachelorsEnglish(),
                  ),
                );
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
