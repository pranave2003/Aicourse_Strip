import 'package:course_connect/User/Ai_course_finder/Masters.dart/Masters_courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Masters_education extends StatefulWidget {
  const Masters_education({super.key});

  @override
  State<Masters_education> createState() => _Masters_educationState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Masters_education(),
    );
  }
}

class _Masters_educationState extends State<Masters_education> {
  String? _selectedValue; // Selected value
  List<String> items = ['IB', 'ICSE', 'CBSC', 'State'];
  int selectedIndex = -1; // Track selected container index
  String? selectedEducation;

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
                ),
              ),
              SizedBox(height: 180),
              InkWell(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Masters_Courses(),
    ),
    );
    },
                // onTap: () {
                //   print("object");
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






