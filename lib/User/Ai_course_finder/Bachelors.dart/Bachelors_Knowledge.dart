import 'package:course_connect/User/Ai_course_finder/Alldetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class Bachelors_Knowledge extends StatefulWidget {
  const Bachelors_Knowledge({super.key});

  @override
  State<Bachelors_Knowledge> createState() => _Bachelors_KnowledgeState();
}

class _Bachelors_KnowledgeState extends State<Bachelors_Knowledge> {
  int? selectedIndex;
  String? selectedAnswer;

  final List<String> testOptions = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Are you aware of your colleges application deadlines?",
                // "Do you know the application deadlines for the universities you're interested in?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff0A1F52),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: testOptions.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedAnswer = testOptions[index];
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
                          testOptions[index],
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

            InkWell(
              onTap: () {
                if (selectedAnswer != null) {
                  context.read<SelectionCubit>().updateSelection("selectedAnswer", selectedAnswer.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BachelorsDetailsOverall(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select an option")),
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
