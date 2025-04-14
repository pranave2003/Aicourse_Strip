import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBAEnglish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class MBA_Courses extends StatefulWidget {
  const MBA_Courses({super.key});

  @override
  State<MBA_Courses> createState() => _MBA_CoursesState();
}

class _MBA_CoursesState extends State<MBA_Courses> {
  int? selectedIndex;
  String? selectedCourse;

  final TextEditingController searchController = TextEditingController();

  final List<String> allCourses = [
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

  List<String> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = List.from(allCourses);
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredCourses = allCourses
          .where((course) => course.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
            const Text(
              "What major do you want to pursue?",
              style: TextStyle(
                color: Color(0xff0A1F52),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCourse == filteredCourses[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedCourse = filteredCourses[index];
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
                                selectedIndex = index;
                                selectedCourse = filteredCourses[index];
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              filteredCourses[index],
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
                if (selectedCourse != null) {
                  context
                      .read<SelectionCubit>()
                      .updateSelection("course", selectedCourse!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MBAEnglish()),
                  );
                } else {
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
