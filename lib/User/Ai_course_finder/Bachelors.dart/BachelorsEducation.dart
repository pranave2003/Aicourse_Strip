import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsCourse.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
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
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/country/img_6.png"),
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                    seletedEducation = "Grade 12";
                  });
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: selectedIndex == 0 ? const Color(0xff0A1F52) : Colors.grey,
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
                  });
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: selectedIndex == 1 ? const Color(0xff0A1F52) : Colors.grey,
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
              const SizedBox(height: 30),
              const Text("What is your expected or gained \n percentage?",
                  style: TextStyle(color: Color(0xff0B1F50), fontSize: 20)),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DropdownButton<String>(
                  value: _selectedValue,
                  hint: const Text('Select Board'),
                  dropdownColor: Colors.grey[300],
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
                  underline: const SizedBox(),
                ),
              ),
              const SizedBox(height: 180),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: highesteducationpercentage,
                  keyboardType: TextInputType.number,
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
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  double? percentage = double.tryParse(highesteducationpercentage.text);

                  if (seletedEducation == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a degree first"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (percentage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a valid percentage"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // Validation based on selected degree
                  if (seletedEducation == "Grade 12" &&
                      (percentage < 0 || percentage > 100)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Percentage must be between 0-100 for Grade 12"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (seletedEducation == "Undergraduate diploma" &&
                      (percentage < 30 || percentage > 100)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "Percentage must be between 30-100 for Undergraduate diploma"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // Save selection
                  context.read<SelectionCubit>().updateSelection(
                      "selectedDegree", widget.selecteddegree.toString());
                  context.read<SelectionCubit>().updateSelection(
                      "highestEducation", seletedEducation.toString());
                  context.read<SelectionCubit>().updateSelection(
                      "highestEducation_percentage",
                      highesteducationpercentage.text);

                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BachelorsCourse(),
                    ),
                  );
                },
                child: Container(
                  height: 51,
                  width: 231,
                  decoration: BoxDecoration(
                      color: blueColor,
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
}
