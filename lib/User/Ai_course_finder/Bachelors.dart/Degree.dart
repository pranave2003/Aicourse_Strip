import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsEducation.dart';
import 'package:course_connect/User/Ai_course_finder/MBA.dart/MBA_education.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/Masters_education.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
// import 'package:course_connect/User/Ai_course_finder/BachelorsPage.dart';
// import 'package:course_connect/User/Ai_course_finder/MastersPage.dart';
// import 'package:course_connect/User/Ai_course_finder/MBAPage.dart';

class Degree extends StatefulWidget {
  const Degree({super.key});

  @override
  State<Degree> createState() => _DegreeState();
}

class _DegreeState extends State<Degree> {
  int? selectedIndex; // Track selected grid item index
  String? selectedDegree;

  final List<Map<String, dynamic>> category = [
    {"name": "Bachelors", "image": "assets/Country/img_7.png", "page": BachelorsEducation()},
    {"name": "Masters", "image": "assets/Country/img_7.png", "page": Masters_education()},
    {"name": "MBA", "image": "assets/Country/img_7.png", "page": MbaEducation()},
  ];

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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
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

                      // Navigate to respective page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => category[index]["page"],
                        ),
                      );
                    },
                    child: Container(
                      width: 160, // Fixed width for alignment
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? Color(0xff085AA2) : Colors.transparent,
                          width: 3,
                        ),
                        color: isSelected ? Color(0xff085AA2) : Color(0xffE4E4E4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16),
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
            ],
          ),
        ),
      ),
    );
  }
}
