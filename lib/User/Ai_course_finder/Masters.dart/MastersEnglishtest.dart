import 'package:course_connect/User/Ai_course_finder/Masters.dart/Masters_work.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class MastersEnglishtest extends StatefulWidget {
  const MastersEnglishtest({super.key});

  @override
  State<MastersEnglishtest> createState() => _MastersEnglishtestState();
}

class _MastersEnglishtestState extends State<MastersEnglishtest> {
  int? selectedIndex; // Track selected test index
  String? selectedTest; // Selected test name
  final TextEditingController percentageController = TextEditingController(); // Score input

  final List<String> englishTests = [
    "TOEFL",
    "IELTS",
    "PTE",
    "Test Not Taken Yet"
  ];

  // Function to get valid score range
  String getScoreRange() {
    switch (selectedTest) {
      case "TOEFL":
        return "Valid Score: 0 - 120";
      case "IELTS":
        return "Valid Score: 0 - 9";
      case "PTE":
        return "Valid Score: 10 - 90";
      default:
        return "";
    }
  }

  // Function to validate score
  bool isValidScore(String score) {
    if (selectedTest == "Test Not Taken Yet") return true;
    if (score.isEmpty) return false;

    double? scoreValue = double.tryParse(score);
    if (scoreValue == null) return false;

    switch (selectedTest) {
      case "TOEFL":
        return scoreValue >= 0 && scoreValue <= 120;
      case "IELTS":
        return scoreValue >= 0 && scoreValue <= 9;
      case "PTE":
        return scoreValue >= 10 && scoreValue <= 90;
      default:
        return false;
    }
  }

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
              "What English language test have\nyou taken?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0A1F52),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text(
                  "Scoring high in language tests\nincreases your options multifold.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: englishTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = englishTests[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          englishTests[index],
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

            if (selectedTest != null && selectedTest != "Test Not Taken Yet")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  getScoreRange(),
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            const Text(
              "Enter your score",
              style: TextStyle(color: Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.w600),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 200,
                child: TextFormField(
                  controller: percentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Score",
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

            const SizedBox(height: 30),

            InkWell(
              onTap: () {
                if (selectedTest != null) {
                  if (!isValidScore(percentageController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid score for $selectedTest")),
                    );
                    return;
                  }

                  context.read<SelectionCubit>().updateSelection("EnglishTest", selectedTest.toString());
                  context.read<SelectionCubit>().updateSelection("EnglishTest_percentage", percentageController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MastersWork()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No test selected")),
                  );
                }
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: blueColor,
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
