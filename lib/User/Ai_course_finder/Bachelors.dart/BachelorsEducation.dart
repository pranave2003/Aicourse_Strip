import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsCourse.dart';
// import 'package:course_connect/User/Ai_course_finder/BachelorsCourse.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class BachelorsEducation extends StatefulWidget {
  const BachelorsEducation({
    super.key,
    required this.selecteddegree,
  });
  final selecteddegree;

  @override
  State<BachelorsEducation> createState() => _BachelorsEducationState();
}

class _BachelorsEducationState extends State<BachelorsEducation> {
  String? _selectedValue; // Selected value
  List<String> items = ['IB', 'ICSE', 'CBSC', 'State'];
  int selectedIndex = -1; // Track selected container index
  String? seletedEducation;
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
              image: AssetImage("assets/country/img_6.png"),
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    seletedEducation = "Grade 12";
                    print(seletedEducation);
                  });
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: selectedIndex == 0 ? Color(0xff0A1F52) : Colors.grey,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                      child: Text(
                    "Grade 12",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 0 ? Colors.white : Colors.black,
                    ),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                    seletedEducation = "Undergraduate diploma";
                    print(seletedEducation);
                  });
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: selectedIndex == 1 ? Color(0xff0A1F52) : Colors.grey,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                      child: Text(
                    "Undergraduate diploma",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 1 ? Colors.white : Colors.black,
                    ),
                  )),
                ),
              ),
              SizedBox(height: 30),
              Text("What is your expected or gained \n percentage?",
                  style: TextStyle(color: Color(0xff0B1F50), fontSize: 20)),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey, // Change button color to grey
                  borderRadius:
                      BorderRadius.circular(8), // Optional: Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 12), // Adds padding
                child: DropdownButton<String>(
                  value: _selectedValue,
                  hint: Text('Select Board'),
                  dropdownColor: Colors.grey[300], // Dropdown menu color
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                  underline: SizedBox(), // Removes the default underline
                ),
              ),
              SizedBox(height: 180),
              Container(
                width: 200, // Adjust this value to control the underline length
                child: TextFormField(
                  controller: highesteducationpercentage,
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
              SizedBox(height: 50),
              InkWell(
                //   onTap: () {
                //     print("object");
                //   },
                onTap: () {
                  if (seletedEducation != null) {
                    context.read<SelectionCubit>().updateSelection(
                        "selectedDegree", widget.selecteddegree.toString());
                    context.read<SelectionCubit>().updateSelection(
                        "highestEducation", seletedEducation.toString());
                    context.read<SelectionCubit>().updateSelection(
                        "highestEducation_percentage",
                        highesteducationpercentage.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BachelorsCourse(),
                      ),
                    );
                    print("Selected Degree: $seletedEducation");
                  } else {
                    print("No educational qualification selected");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please select a degree first")),
                    );
                  }
                },

                child: Container(
                  height: 51,
                  width: 231,
                  decoration: BoxDecoration(
                      color: blueColor,
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
}
