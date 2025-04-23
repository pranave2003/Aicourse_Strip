import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBA_Companytype.dart';
import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBA_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class MbaAcademic extends StatefulWidget {
  const MbaAcademic({super.key});

  @override
  State<MbaAcademic> createState() => _MbaAcademicState();
}

class _MbaAcademicState extends State<MbaAcademic> {
  int? selectedIndex;
  String? selectedacademicTest;
  String? selectedTestRange;
  final TextEditingController percentageController = TextEditingController();

  final List<String> englishTests = [
      "GRE",
      "GMAT",
      "CAT",
      "CMAT",
      "Not Required",

  ];

  final Map<String, String> testRanges = {
    "GMAT": "200 - 800",
    "GRE": "260 - 340",
    "CAT": "0 - 100",
    "XAT": "0 - 100",
    "CMAT": "0 - 100",
    "MAT": "0 - 100",
    "NMAT": "0 - 360",
    "TEST NOT TAKEN": "No Score Required",
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
              "Which Standardized MBA entrance \n exams have you taken OR planning to take?",
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
                  "Scoring high in language tests \nincreases your options multi fold.",
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
                        selectedacademicTest = englishTests[index];
                        selectedTestRange = testRanges[selectedacademicTest]!;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
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

            // Display score range in red above the score input field
            if (selectedacademicTest != "TEST NOT TAKEN") ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Score Range: ${selectedTestRange ?? ''}",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 200,
                  child: TextFormField(
                    controller: percentageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Score",
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

            SizedBox(height: 30),

            InkWell(
              onTap: () {
                if (selectedacademicTest != null) {
                  bool isValid = selectedacademicTest == "TEST NOT TAKEN";
                  int? score = int.tryParse(percentageController.text);

                  if (!isValid) {
                    switch (selectedacademicTest) {
                      case "GMAT":
                        isValid = score != null && score >= 200 && score <= 800;
                        break;
                      case "GRE":
                        isValid = score != null && score >= 260 && score <= 340;
                        break;
                      case "CAT":
                      case "XAT":
                      case "CMAT":
                      case "MAT":
                        isValid = score != null && score >= 0 && score <= 100;
                        break;
                      case "NMAT":
                        isValid = score != null && score >= 0 && score <= 360;
                        break;
                    }
                  }

                  if (isValid) {
                    context.read<SelectionCubit>().updateSelection(
                        "Acadamictest", selectedacademicTest.toString());
                    context.read<SelectionCubit>().updateSelection(
                        "AcadamicTestpercentage", percentageController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MBA_work(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid score for the selected test")),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No Academic Test selected")),
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