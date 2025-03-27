import 'package:course_connect/Admin/View/Screens/Courses/Addcourses.dart';
import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_activities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Admin/View/Screens/Courses/Addcourses.dart';
import '../../../Controller/Bloc/selection_cubit.dart';

class Bachelors_academictest extends StatefulWidget {
  const Bachelors_academictest({
    super.key,
  });

  @override
  State<Bachelors_academictest> createState() => _Bachelors_academictestState();
}

class _Bachelors_academictestState extends State<Bachelors_academictest> {
  int? selectedIndex; // Track selected container index
  String? selectedacademicTest; // Selected test name
  final TextEditingController percentageController =
      TextEditingController(); // Controller for text input

  // List of English language tests
  final List<String> academicTests = [
    "ACT",
    "SAT",
    "JEE ",
    "NEET ",
    "CUET",
    "TEST NOT TAKEN"
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
            image: AssetImage("assets/Country/img_6.png"),
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
                  "Which Academic test have you \n taken OR planning to take?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff0A1F52),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded,
                    color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text(
                  "Scoring high in language tests \nincreases your options multifold.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dynamically generated list of test options
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: academicTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedacademicTest = academicTests[index];
                        print(selectedacademicTest);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          academicTests[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Percentage Input Field (Placed directly below ListView)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 200,
                child: TextFormField(
                  controller: percentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Percentage  %",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),

            SizedBox(height: 30),

            // Continue Button
            InkWell(
              onTap: () {
                if (selectedacademicTest != null) {
                  context.read<SelectionCubit>().updateSelection(
                      "Acadamictest", selectedacademicTest.toString());
                  context.read<SelectionCubit>().updateSelection(
                      "AcadamicTestpercentage",
                      percentageController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bachelors_activities(),
                    ),
                  );
                  print("Selected academic test: $selectedacademicTest");
                } else {
                  print("Percentage: ${percentageController.text}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No academic test selected")),
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

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
