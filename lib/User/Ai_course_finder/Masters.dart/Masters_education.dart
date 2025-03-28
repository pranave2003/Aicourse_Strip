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
              SizedBox(height: 30),
              Text(
                "What is your expected or gained \n percentage?",
                style: TextStyle(color: Color(0xff0B1F50), fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                width: 200, // Adjust this value to control the underline length
                child: TextFormField(
                  controller: highesteducationpercentage, // FIXED: Controller Assigned
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
