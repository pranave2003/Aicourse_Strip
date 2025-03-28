import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBA_Academic.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class MBAEnglish extends StatefulWidget {
  const MBAEnglish({super.key});

  @override
  State<MBAEnglish> createState() => _MBAEnglishState();
}

class _MBAEnglishState extends State<MBAEnglish> {
  int? selectedIndex;
  String? selectedTest;
  final TextEditingController percentageController = TextEditingController();

  final Map<String, String> testScoreRanges = {
    "TOEFL": "60 - 120",
    "IELTS": "6 - 9",
    "PTE": "50 - 90",
    "Test Not Taken Yet": "No score required"
  };

  final Map<String, List<int>> testScoreLimits = {
    "TOEFL": [60, 120],
    "IELTS": [6, 9],
    "PTE": [50, 90],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
            const Text(
              "What English language test have\n you taken OR planning to take?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0A1F52),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: testScoreRanges.keys.length,
              itemBuilder: (context, index) {
                String test = testScoreRanges.keys.elementAt(index);
                bool isSelected = selectedTest == test;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedTest = test;
                      percentageController.clear();
                    });
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: isSelected ? Color(0xff0A1F52) : Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        test,
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
            if (selectedTest != null && selectedTest != "Test Not Taken Yet") ...[
              Text(
                "Valid Score Range: ${testScoreRanges[selectedTest]}",
                style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 200,
                  child: TextFormField(
                    controller: percentageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter your score",
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
            ],
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                if (selectedTest == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No Test selected")),
                  );
                  return;
                }

                if (selectedTest != "Test Not Taken Yet") {
                  int? score = int.tryParse(percentageController.text);
                  if (score == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter a valid score")),
                    );
                    return;
                  }

                  List<int>? range = testScoreLimits[selectedTest];
                  if (range == null || score < range[0] || score > range[1]) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid score for the selected test")),
                    );
                    return;
                  }
                }

                context.read<SelectionCubit>().updateSelection("EnglishTest", selectedTest.toString());
                context.read<SelectionCubit>().updateSelection("EnglishTest_percentage", percentageController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MbaAcademic(),
                  ),
                );
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: blueColor ?? Color(0xff0A71CB),
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
