import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBA_courses.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/Masters_courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class MbaEducation extends StatefulWidget {
  const MbaEducation({
    super.key,
    required this.selecteddegree,
  });
  final selecteddegree;

  @override
  State<MbaEducation> createState() => _MbaEducationState();
}

class _MbaEducationState extends State<MbaEducation> {
  String? _selectedValue; // Selected value
  List<String> items = ['IB', 'ICSE', 'CBSC', 'State'];
  int selectedIndex = -1; // Track selected container index
  String? selectedEducation;
  TextEditingController highesteducationpercentage = TextEditingController();

  // Percentage ranges for each education level
  final Map<String, String> educationRanges = {
    "Undergraduate Degree": "50 - 100%",
    "Undergraduate Diploma": "45 - 100%",
    "Postgraduate Degree": "55 - 100%",
    "Postgraduate Diploma": "50 - 100%",
  };

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
              image: AssetImage("assets/country/main.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
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
              SizedBox(height: 10),
              _buildEducationOption("Undergraduate Degree", 0),
              _buildEducationOption("Undergraduate Diploma", 1),
              _buildEducationOption("Postgraduate Degree", 2),
              _buildEducationOption("Postgraduate Diploma", 3),

              // Display percentage range dynamically
              if (selectedEducation != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Percentage Range: ${educationRanges[selectedEducation]}",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),

              SizedBox(height: 30),
              Text(
                "What is your expected or gained \n percentage?",
                style: TextStyle(color: Color(0xff0B1F50), fontSize: 20),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // Change button color to grey
                  borderRadius:
                  BorderRadius.circular(8), // Optional: Rounded corners
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 200, // Adjust this value to control the underline length
                child: TextFormField(
                  controller: highesteducationpercentage, // ✅ FIXED: Moved outside InputDecoration
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
                  keyboardType: TextInputType.number, // Optional: Allow only numbers
                ),
              ),
              SizedBox(height: 180),
              InkWell(
                onTap: () {
                  // Validation logic based on selected education level
                  if (selectedEducation == null) {
                    // No education level selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select your education level.")),
                    );
                    return;
                  }

                  double? percentage = double.tryParse(highesteducationpercentage.text);
                  if (percentage == null) {
                    // Invalid percentage input
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter a valid percentage.")),
                    );
                    return;
                  }

                  // Define percentage ranges based on education level
                  bool isValid = false;
                  switch (selectedEducation) {
                    case "Undergraduate Degree":
                      isValid = percentage >= 50 && percentage <= 100; // Example range
                      break;
                    case "Undergraduate Diploma":
                      isValid = percentage >= 45 && percentage <= 100; // Example range
                      break;
                    case "Postgraduate Degree":
                      isValid = percentage >= 55 && percentage <= 100; // Example range
                      break;
                    case "Postgraduate Diploma":
                      isValid = percentage >= 50 && percentage <= 100; // Example range
                      break;
                  }

                  if (!isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Percentage is not valid for the selected education level.")),
                    );
                    return;
                  }

                  // If all validations pass, proceed to the next screen
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
                      builder: (context) => MBA_Courses(),
                    ),
                  );
                },
                child: Container(
                  height: 51,
                  width: 231,
                  decoration: BoxDecoration(
                      color: Color(0xff0A71CB),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
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
          print(selectedEducation);
        });
      },
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: selectedIndex == index ? Color(0xff0A1F52) : Colors.grey,
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
