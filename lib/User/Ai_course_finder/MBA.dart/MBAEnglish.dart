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

  final List<String> englishTests = [
    "TOEFL",
    "IELTS",
    "PTE",
    "Test Not Taken Yet"
  ];

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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What English language test have\n you taken OR planning to take?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff0A1F52),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                const SizedBox(width: 10),
                Text(
                  "Scoring high in language tests \nincreases your options multifold.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // List of Test Options (Fixed with SizedBox)
            SizedBox(
              height: 250, // ✅ Prevents UI overflow
              child: ListView.builder(
                itemCount: englishTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = englishTests[index];
                        print(selectedTest);
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

            const Text(
              "Enter your score",
              style: TextStyle(color: Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.w600),
            ),

            // Score Input
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

            // Continue Button
            InkWell(
              onTap: () {
                if (selectedTest != null) {
                  context
                      .read<SelectionCubit>()
                      .updateSelection("EnglishTest", selectedTest.toString());
                  context.read<SelectionCubit>().updateSelection(
                      "EnglishTest_percentage",
                      percentageController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MbaAcademic(),
                    ),
                  );
                  print("Selected test: $selectedTest");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No Test selected")),
                  );
                }
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: blueColor ?? Color(0xff0A71CB), // ✅ Fix in case `blueColor` is undefined
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
