import 'package:course_connect/User/Ai_course_finder/Alldetails.dart';
import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBA_DetailsOverall.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/Maters_academic.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/MastersEnglishtest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class MBA_work extends StatefulWidget {
  const MBA_work({super.key});

  @override
  State<MBA_work> createState() => _MBA_workState();
}

class _MBA_workState extends State<MBA_work> {
  int? selectedIndex;
  String? selectedTest;
  int experienceMonths = 0;

  final List<String> testOptions = ["Yes", "No"];

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
            image: AssetImage("assets/country/main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Do you have any work experience?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0A1F52),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text("Adds value to your profile.", style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 30),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(testOptions.length, (index) {
                bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = testOptions[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? const Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          testOptions[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            if (selectedTest == "Yes") ...[
              const Text(
                "How much work experience do you have?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: experienceMonths.toDouble(),
                onChanged: (value) {
                  setState(() {
                    experienceMonths = value.toInt();
                  });
                },
                min: 0,
                max: 60,
                divisions: 10,
                label: "$experienceMonths months",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(width: 20),
                  Text("0"),
                  Spacer(),
                  Text("60+ months"),
                  SizedBox(width: 20),
                ],
              ),
            ],

            const SizedBox(height: 150),

            InkWell(
              onTap: () {
                // Validation logic
                if (selectedTest == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select if you have work experience")),
                  );
                } else if (selectedTest == "Yes" && experienceMonths == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select your work experience months")),
                  );
                } else {
                  context.read<SelectionCubit>().updateSelection("Work", selectedTest.toString());
                  context.read<SelectionCubit>().updateSelection("Month", experienceMonths.toString());

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BachelorsDetailsOverall()),
                  );
                }
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