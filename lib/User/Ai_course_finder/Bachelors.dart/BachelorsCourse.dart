import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/BachelorsEnglish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BachelorsCourse extends StatefulWidget {
  const BachelorsCourse(
      {super.key,
      required this.Country,
      required this.selecteddegree,
      required this.highestEducationpercentage,
      required this.highestEducation,
      required this.Board});
  final Country;
  final selecteddegree;
  final highestEducationpercentage;
  final highestEducation;
  final Board;
  @override
  State<BachelorsCourse> createState() => _BachelorsCourseState();
}

class _BachelorsCourseState extends State<BachelorsCourse> {
  int? selectedIndex; // Track only one selected course index
  String? selectedCourse; // Store the selected course name

  @override
  void initState() {
    print("bc course");
    print(widget.selecteddegree);
    print(widget.Country);
    print(widget.highestEducationpercentage);
    print(widget.highestEducation);
    super.initState();
  }

  final List<String> courses = [
    "BBA (Bachelor of Business Administration)",
    "BCom (Bachelor of Commerce)",
    "BA in Business Management",
    "BSc in International Business",
    "BBA in Marketing",
    "BBA in Finance",
    "BBA in Human Resource Management",
    "BBA in Entrepreneurship",
    "BBA in Supply Chain Management",
    "BSc in Computer Science",
    "BSc in Information Technology (IT)",
    "BTech / BE",
    "BSc in Data Science",
    "BSc in AI & Machine Learning",
    "BSc in Biotechnology",
    "BSc in Environmental Science",
    "BA in Political Science",
    "BA in Sociology",
    "BA in History",
    "BA in English Literature",
    "BA in Journalism & Mass Communication",
    "BA in Fine Arts",
    "LLB (Bachelor of Laws)",
    "BA in Criminology",
    "BA in Public Administration",
    "BA in Economics",
    "BA in International Relations"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Country/img_6.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What major do you want to pursue?",
                  style: TextStyle(
                      color: Color(0xff0A1F52),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search Course",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndex = null;
                          selectedCourse = null;
                        } else {
                          selectedIndex = index;
                          selectedCourse = courses[index];
                        }
                        print("Selected Course: $selectedCourse");
                      });
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedIndex = index;
                                  selectedCourse = courses[index];
                                } else {
                                  selectedIndex = null;
                                  selectedCourse = null;
                                }
                              });
                            },
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            courses[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                if (selectedCourse != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BachelorsEnglish(
                        Country: widget.Country,
                        selecteddegree: widget.selecteddegree,
                        highestEducation: widget.highestEducation,
                        Board: widget.Board,
                        highestEducationpercentage:
                            widget.highestEducationpercentage,
                        Course_offered: selectedCourse,
                      ),
                    ),
                  );
                  print("Selected Course: $selectedCourse");
                } else {
                  print("No course selected");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please choose a course")),
                  );
                }
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: Color(0xff0A71CB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    selectedCourse == null ? "No Preference" : "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
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
