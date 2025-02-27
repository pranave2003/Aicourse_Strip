import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BachelorsCourse extends StatefulWidget {
  const BachelorsCourse({super.key});

  @override
  State<BachelorsCourse> createState() => _BachelorsCourseState();
}

class _BachelorsCourseState extends State<BachelorsCourse> {
  Set<int> selectedIndices = {}; // Track selected course indices
  List<String> selectedCourses = []; // Store selected course names

  // List of available courses
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
    "BTech / BE (Bachelor of Technology / Engineering)",
    "BSc in Data Science",
    "BSc in Artificial Intelligence & Machine Learning",
    "BSc in Biotechnology",
    "BSc in Environmental Science",
    "BA in Political Science",
    "BA in Sociology",
    "BA in History",
    "BA in English Literature",
    "BA in Journalism & Mass Communication",
    "BA in Fine Arts",
    "MBBS (Bachelor of Medicine & Surgery)",
    "BDS (Bachelor of Dental Surgery)",
    "BPharm (Bachelor of Pharmacy)",
    "BPT (Bachelor of Physiotherapy)",
    "BSc in Nursing",
    "BSc in Nutrition & Dietetics",
    "BSc in Medical Lab Technology",
    "BTech in Computer Science",
    "BTech in Mechanical Engineering",
    "BTech in Electrical Engineering",
    "BTech in Civil Engineering",
    "BTech in Electronics & Communication",
    "BTech in Aerospace Engineering",
    "LLB (Bachelor of Laws)",
    "BA in Criminology",
    "BA in Public Administration",
    "BA in Economics",
    "BA in International Relations",
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
                if (selectedCourses.isNotEmpty) {
                  print("Final Selected Courses: $selectedCourses");
                } else {
                  print("Please choose courses");
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