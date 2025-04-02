import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_academictest.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class BachelorsEnglish extends StatefulWidget {
  const BachelorsEnglish({super.key});

  @override
  State<BachelorsEnglish> createState() => _BachelorsEnglishState();
}

class _BachelorsEnglishState extends State<BachelorsEnglish> {
  int? selectedIndex;
  String? selectedTest;
  String? scoreRangeMessage; // New variable for score range message
  final TextEditingController percentageController = TextEditingController();

  final List<String> englishTests = ["TOEFL", "IELTS", "PTE", "Test Not Taken Yet"];

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
            image: AssetImage("assets/Country/img_6.png"),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text(
                  "Scoring high in language tests \nincreases your options multifold.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: englishTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = englishTests[index];

                        // Update score range message based on selected test
                        if (selectedTest == "TOEFL") {
                          scoreRangeMessage = "Valid score range: 0 - 120";
                        } else if (selectedTest == "IELTS") {
                          scoreRangeMessage = "Valid score range: 0 - 9";
                        } else if (selectedTest == "PTE") {
                          scoreRangeMessage = "Valid score range: 10 - 90";
                        } else {
                          scoreRangeMessage = null; // No score range for "Test Not Taken Yet"
                        }
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? const Color(0xff0A1F52) : Colors.grey,
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
            if (selectedTest != "Test Not Taken Yet" && selectedTest != null) ...[
              if (scoreRangeMessage != null) ...[
                Text(
                  scoreRangeMessage!, // Display the score range message
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
              ],
              const Text(
                "Enter your score",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: percentageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
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
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                if (selectedTest == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No Test selected")),
                  );
                  return;
                }

                if (selectedTest != "Test Not Taken Yet") {
                  double? score = double.tryParse(percentageController.text);
                  if (score == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid score")),
                    );
                    return;
                  }

                  if (selectedTest == "TOEFL" && (score < 0 || score > 120)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("TOEFL score must be between 0-120")),
                    );
                    return;
                  }

                  if (selectedTest == "IELTS" && (score < 0 || score > 9)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("IELTS score must be between 0-9")),
                    );
                    return;
                  }

                  if (selectedTest == "PTE" && (score < 10 || score > 90)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("PTE score must be between 10-90")),
                    );
                    return;
                  }

                  context.read<SelectionCubit>().updateSelection("EnglishTest_percentage", percentageController.text);
                }

                context.read<SelectionCubit>().updateSelection("EnglishTest", selectedTest!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Bachelors_academictest(),
                  ),
                );
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