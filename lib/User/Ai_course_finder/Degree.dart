import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsEducation.dart';
import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBA_education.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/Masters_education.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';

class Degree extends StatefulWidget {
  const Degree({super.key});

  @override
  State<Degree> createState() => _DegreeState();
}

class _DegreeState extends State<Degree> {
  int? selectedIndex; // Track selected grid item index
  String? selectedDegree;

  final List<Map<String, dynamic>> category = [
    {
      "name": "Bachelors",
      "image": "assets/Country/img_7.png",
      "page": (String? selectedDegree) => BachelorsEducation(selecteddegree: selectedDegree),
    },
    {
      "name": "Masters",
      "image": "assets/Country/img_7.png",
      "page": (String? selectedDegree) => Masters_education(selecteddegree: selectedDegree),
    },
    {
      "name": "MBA",
      "image": "assets/Country/img_7.png",
      "page": (String? selectedDegree) => MbaEducation(selecteddegree: selectedDegree),
    },
  ];

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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Which degree do you wish \n to pursue?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0A1F52),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // Horizontal spacing
                runSpacing: 20, // Vertical spacing
                children: List.generate(category.length, (index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedDegree = category[index]["name"];
                      });
                    },
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? const Color(0xff085AA2) : Colors.transparent,
                          width: 3,
                        ),
                        color: isSelected ? const Color(0xff085AA2) : const Color(0xffE4E4E4),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              category[index]["image"]!,
                              height: 40,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category[index]["name"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 120),

              // Continue Button with Validation
              InkWell(
                onTap: () {
                  if (selectedDegree != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => category[selectedIndex!]["page"](selectedDegree),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a degree before proceeding."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 51,
                  width: 231,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
