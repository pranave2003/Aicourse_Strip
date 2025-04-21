import 'package:course_connect/User/Ai_course_finder/Masters.dart/Masters_courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class Masters_education extends StatefulWidget {
  const Masters_education({super.key, required this.selecteddegree});
  final selecteddegree;

  @override
  State<Masters_education> createState() => _Masters_educationState();
}

class _Masters_educationState extends State<Masters_education> {
  String? _selectedValue; // Selected value
  List<String> items = ['IB', 'ICSE', 'CBSC', 'State'];
  int selectedIndex = -1; // Track selected container index
  String? selectedEducation;
  TextEditingController highesteducationpercentage = TextEditingController();

  // Function to validate the entered percentage based on selected education
  bool isValidPercentage(String education, String percentage) {
    if (percentage.isEmpty) return false;

    double? value = double.tryParse(percentage);
    if (value == null) return false;

    // Different validation ranges based on education level
    switch (education) {
      case "Undergraduate Degree":
      case "Undergraduate Diploma":
        return value >= 30 && value <= 100; // Typical range for undergraduate
      case "Postgraduate Degree":
      case "Postgraduate Diploma":
        return value >= 40 && value <= 100; // Higher cut-off for postgraduates
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Back button icon
            onPressed: () {
              Navigator.pop(context); // Navigate back when tapped
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "What is your highest \n education level?",
                    style: TextStyle(
                        color: Color(0xff0A1F52),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildEducationOption("Undergraduate Degree", 0),
              _buildEducationOption("Undergraduate Diploma", 1),
              _buildEducationOption("Postgraduate Degree", 2),
              _buildEducationOption("Postgraduate Diploma", 3),
              const SizedBox(height: 30),
              const Text(
                "What is your expected or gained \n percentage?",
                style: TextStyle(color: Color(0xff0B1F50), fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200, // Adjust this value to control the underline length
                child: TextFormField(
                  controller: highesteducationpercentage, // FIXED: Controller Assigned
                  decoration: const InputDecoration(
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
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  keyboardType: TextInputType.number, // Allow only numbers
                ),
              ),
              if (selectedEducation != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Valid percentage range: ${selectedEducation!.contains("Postgraduate") ? "40 - 100" : "30 - 100"}",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              const SizedBox(height: 100),
              InkWell(
                onTap: () {
                  if (selectedEducation == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Please select an education level")),
                    );
                    return;
                  }

                  if (!isValidPercentage(
                      selectedEducation!, highesteducationpercentage.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Invalid percentage for $selectedEducation. "
                              "Valid range: ${selectedEducation!.contains("Postgraduate") ? "40 - 100" : "30 - 100"}",
                        ),
                      ),
                    );
                    return;
                  }

                  context.read<SelectionCubit>().updateSelection(
                      "selectedDegree", widget.selecteddegree.toString());
                  context.read<SelectionCubit>().updateSelection(
                      "highestEducation", selectedEducation.toString());
                  context.read<SelectionCubit>().updateSelection(
                      "highestEducation_percentage",
                      highesteducationpercentage.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Masters_Courses(),
                    ),
                  );
                },
                child: Container(
                  height: 51,
                  width: 231,
                  decoration: BoxDecoration(
                      color: const Color(0xff0A71CB),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildEducationOption(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          selectedEducation = text;
        });
      },
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: selectedIndex == index ? const Color(0xff0A1F52) : Colors.grey,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            )),
      ),
    );
  }
}
