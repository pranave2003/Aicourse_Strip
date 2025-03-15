import 'package:course_connect/User/Ai_course_finder/MBA_Academic.dart';
import 'package:course_connect/User/Ai_course_finder/MBA_Companytype.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MBA_Courses extends StatefulWidget {
  const MBA_Courses({super.key});

  @override
  State<MBA_Courses> createState() => _MBA_CoursesState();
}

class _MBA_CoursesState extends State<MBA_Courses> {
  Set<int> selectedIndices = {}; // Track selected course indices
  List<String> selectedCourses = []; // Store selected course names

  // List of available courses
  final List<String> courses = [
    "General MBA",
    "MBA in Finance",
    "MBA in Marketing",
    "MBA in Human Resource Management",
    "MBA in International Business",
    "MBA in Entrepreneurship",
    "MBA in Business Analytics",
    "MBA in Supply Chain Management",
    "MBA in Digital Marketing",
    "MBA in Operations Management",
    "MBA in Healthcare Management",
    "MBA in Hospitality & Tourism Management",
    "MBA in Retail Management",
    "MBA in Agribusiness Management",
    "MBA in Sports Management",
    "MBA in Luxury Brand Management",
    "MBA in Real Estate Management",
    "MBA in Information Technology",
    "MBA in Data Science",
    "MBA in Cybersecurity Management",
    "MBA in AI & Machine Learning",
    "MBA in Blockchain & FinTech",
    "Executive MBA (EMBA)",
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
                itemCount: courses.length, // Number of courses
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndices.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndices.remove(index);
                          selectedCourses.remove(courses[index]);
                        } else {
                          selectedIndices.add(index);
                          selectedCourses.add(courses[index]);
                        }
                        print("Selected Courses: $selectedCourses");
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
                                  selectedIndices.add(index);
                                  selectedCourses.add(courses[index]);
                                } else {
                                  selectedIndices.remove(index);
                                  selectedCourses.remove(courses[index]);
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
                if (selectedCourses != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MbaAcademic(),
                    ),
                  );
                  print("Final Selected Courses: $selectedCourses");
                }
                else {
                  print("Please choose courses");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please choose courses")),
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
                    selectedCourses.isEmpty ? "No Preference" : "Continue",
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






//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Masters_Courses extends StatefulWidget {
//   const Masters_Courses({super.key});
//
//   @override
//   State<Masters_Courses> createState() => _Masters_CoursesState();
// }
//
// class _Masters_CoursesState extends State<Masters_Courses> {
//   Set<int> selectedIndices = {}; // Track selected course indices
//   List<String> selectedCourses = []; // Store selected course names
//
//   // List of available courses
//   final List<String> courses = [
//     "Artificial Intelligence (AI)"
//         "Machine Learning (ML)"
//         "Data Science & Analytics"
//         "Cybersecurity"
//         "Software Engineering"
//         "Mechanical Engineering"
//         "Civil Engineering"
//         "Electrical & Electronics Engineering"
//         "Renewable Energy"
//         "Robotics & Automation"
//         "Master of Business Administration (MBA)"
//         "Finance & Investment"
//         "Marketing Management"
//         "International Business"
//         "Human Resource Management (HRM)"
//         "Supply Chain & Logistics"
//         "Entrepreneurship & Innovation"
//         "Business Analytics"
//         "Computer Science"
//         "Information Technology (IT)"
//         "Cloud Computing"
//         "Blockchain Technology"
//         "Game Development"
//         "Web & Mobile App Development"
//         "Internet of Things (IoT)"
//         "Public Health"
//         "Nursing & Midwifery"
//         "Pharmacy & Pharmacology"
//         "Biotechnology"
//         "Biomedical Sciences"
//         "Healthcare Management"
//         "Physiotherapy"
//         "Nutrition & Dietetics"
//         "Psychology"
//         "Sociology"
//         "Political Science"
//         "International Relations"
//         "Criminology"
//         "Journalism & Mass Communication"
//         "History & Anthropology"
//         "Cultural Studies"
//         "Master of Laws (LLM)"
//         "Corporate Law"
//         "International Law"
//         "Human Rights Law"
//         "Criminal Law"
//         "Environmental Law"
//         "Environmental Science"
//         "Climate Change Studies"
//         "Sustainable Development"
//         "Marine Biology"
//         "Chemistry"
//         "Physics"
//         "Mathematics & Statistics"
//         "Fine Arts"
//         "Graphic Design"
//         "Fashion Design"
//         "Animation & Multimedia"
//         "Film & Media Studies"
//         "Interior Design"
//         "Master of Education (M.Ed)"
//         "Teaching English as a Second Language (TESOL)"
//         "Special Education"
//         "Curriculum & Instruction Design"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back), // Back button icon
//           onPressed: () {
//             Navigator.pop(context); // Navigate back when tapped
//           },
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/country/img_6.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "What major do you want to pursue?",
//                   style: TextStyle(
//                       color: Color(0xff0A1F52),
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: "Search Course",
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(width: 1, color: Colors.black)),
//                 ),
//               ),
//             ),
//
//
//
//
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 itemCount: courses.length, // Number of courses
//                 itemBuilder: (context, index) {
//                   bool isSelected = selectedIndices.contains(index);
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if (isSelected) {
//                           selectedIndices.remove(index);
//                           selectedCourses.remove(courses[index]);
//                         } else {
//                           selectedIndices.add(index);
//                           selectedCourses.add(courses[index]);
//                         }
//                         print("Selected Courses: $selectedCourses");
//                       });
//                     },
//                     child: Container(
//                       height: 50,
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         color: isSelected ? Color(0xff0A1F52) : Colors.grey,
//                       ),
//                       child: Row(
//                         children: [
//                           Checkbox(
//                             value: isSelected,
//                             onChanged: (value) {
//                               setState(() {
//                                 if (value == true) {
//                                   selectedIndices.add(index);
//                                   selectedCourses.add(courses[index]);
//                                 } else {
//                                   selectedIndices.remove(index);
//                                   selectedCourses.remove(courses[index]);
//                                 }
//                               });
//                             },
//                             activeColor: Colors.white,
//                             checkColor: Colors.black,
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             courses[index],
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: isSelected ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 30),
//             InkWell(
//               onTap: () {
//                 if (selectedCourses.isNotEmpty){
//                   print("Final Selected Courses: $selectedCourses");
//                 }else
//                 {
//                   print("please choose courses");
//                 }
//
//               },
//               child: Container(
//                 height: 51,
//                 width: 231,
//                 decoration: BoxDecoration(
//                   color: Color(0xff0A71CB),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child:  Center(
//                   child:
//                   Text(
//                     selectedCourses.isEmpty?
//                     "No Preference":"Continue",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
