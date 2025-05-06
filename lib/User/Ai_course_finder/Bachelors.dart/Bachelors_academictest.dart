import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_Knowledge.dart';
import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/selection_cubit.dart';

class Bachelors_academictest extends StatefulWidget {
  const Bachelors_academictest({super.key});

  @override
  State<Bachelors_academictest> createState() => _Bachelors_academictestState();
}

class _Bachelors_academictestState extends State<Bachelors_academictest> {
  int? selectedIndex;
  String? selectedacademicTest;
  final TextEditingController percentageController = TextEditingController();

  final List<String> academicTests = ["ACT", "SAT", "CUET", "TEST NOT TAKEN"];

  // Score ranges for validation
  final Map<String, String> testScoreRanges = {
    "ACT": "1 - 36",
    "SAT": "400 - 1600",
    "CUET": "0 - 1500",
  };

  bool isValidScore(String test, String score) {
    if (score.isEmpty) return false;
    double? value = double.tryParse(score);
    if (value == null) return false;

    switch (test) {
      case "ACT":
        return value >= 1 && value <= 36;
      case "SAT":
        return value >= 400 && value <= 1600;
      case "CUET":
        return value >= 0 && value <= 1500;
      case "TEST NOT TAKEN":
        return true; // No validation required
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
              "Which Academic test have you  taken ?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff0A1F52), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: academicTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedacademicTest = academicTests[index];
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
            if (selectedacademicTest != "TEST NOT TAKEN") ...[
              Text(
                "Enter your score",
                style: const TextStyle(color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: percentageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Score",
                      hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              if (selectedacademicTest != null && testScoreRanges.containsKey(selectedacademicTest!))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Valid score range: ${testScoreRanges[selectedacademicTest]}",
                    style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
            ],
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                if (selectedacademicTest == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No academic test selected")),
                  );
                  return;
                }
                if (selectedacademicTest != "TEST NOT TAKEN" &&
                    !isValidScore(selectedacademicTest!, percentageController.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Invalid score for $selectedacademicTest. "
                            "Valid range: ${testScoreRanges[selectedacademicTest]}",
                      ),
                    ),
                  );
                  return;
                }
                if(selectedacademicTest!=null) {
                  context.read<SelectionCubit>().updateSelection(
                      "Acadamictest", selectedacademicTest.toString());
                  context.read<SelectionCubit>().updateSelection(
                      "AcadamicTestpercentage", percentageController.text);
                };
                Navigator.push(context, MaterialPageRoute(builder: (context) => Bachelors_Knowledge()));
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(color: const Color(0xff0A71CB), borderRadius: BorderRadius.circular(30)),
                child: const Center(
                  child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
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
