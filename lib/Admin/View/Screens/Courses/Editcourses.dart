
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Editcourses(),
  ));
}

class Editcourses extends StatefulWidget {
  @override
  _EditcoursesState createState() => _EditcoursesState();
}

class _EditcoursesState extends State<Editcourses> {
  String selectedCourse = 'Bachelors';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('AI Course Editing Page'),
        actions: [
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text("Save Changes"),
          // )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text('Bachelors'),
                  selected: selectedCourse == 'Bachelors',
                  onSelected: (bool selected) {
                    setState(() {
                      selectedCourse = 'Bachelors';
                    });
                  },
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text('Masters'),
                  selected: selectedCourse == 'Masters',
                  onSelected: (bool selected) {
                    setState(() {
                      selectedCourse = 'Masters';
                    });
                  },
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text('MBA'),
                  selected: selectedCourse == 'MBA',
                  onSelected: (bool selected) {
                    setState(() {
                      selectedCourse = 'MBA';
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(child: getFormFields()),
        ],
      ),
    );
  }

  Widget getFormFields() {
    switch (selectedCourse) {
      case 'Bachelors':
        return BachelorsForm();
      case 'Masters':
        return MastersForm();
      case 'MBA':
        return MBAForm();
      default:
        return Container();
    }
  }
}

class BachelorsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        DropdownField(label: "Country Name", initialValue: "India"),
        DropdownField(label: "Course Name", initialValue: "Msc Physics"),
        DropdownField(label: "Work Experience", initialValue: "6 months"),
        DropdownField(label: "Education Level", initialValue: "Undergraduate Diploma"),
        DropdownField(label: "Board", initialValue: "CBSE"),
        DropdownField(label: "Percentage", initialValue: "70%"),
        DropdownField(label: "English Test", initialValue: "IELTS"),
        DropdownField(label: "Score", initialValue: "540"),
        DropdownField(label: "Academic Test", initialValue: "GRU"),
        DropdownField(label: "Score", initialValue: "46"),
        DropdownField(label: "Company Type", initialValue: "Select type"),
        DropdownField(label: "Organization", initialValue: "Select type"),
        DropdownField(label: "Choose Duration", initialValue: "Select Duration"),
      ],
    );
  }
}

class MastersForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        DropdownField(label: "Country Name", initialValue: "India"),
        DropdownField(label: "Course Name", initialValue: "Msc Physics"),
        DropdownField(label: "Work Experience", initialValue: "6 months"),
        DropdownField(label: "Education Level", initialValue: "Undergraduate Diploma"),
        DropdownField(label: "Board/Institute", initialValue: "CBSE"),
        DropdownField(label: "Percentage", initialValue: "70%"),
        DropdownField(label: "English Test", initialValue: "IELTS"),
        DropdownField(label: "Score", initialValue: "540"),
        DropdownField(label: "Academic Test", initialValue: "GRU"),
        DropdownField(label: "Score", initialValue: "46"),
        DropdownField(label: "Research Paper", initialValue: "Yes"),
      ],
    );
  }
}

class MBAForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        DropdownField(label: "Country Name", initialValue: "India"),
        DropdownField(label: "Course Name", initialValue: "Msc Physics"),
        DropdownField(label: "Work Experience", initialValue: "6 months"),
        DropdownField(label: "Education Level", initialValue: "Undergraduate Diploma"),
        DropdownField(label: "Board", initialValue: "CBSE"),
        DropdownField(label: "Percentage", initialValue: "70%"),
        DropdownField(label: "English Test", initialValue: "IELTS"),
        DropdownField(label: "Score", initialValue: "540"),
        DropdownField(label: "Academic Test", initialValue: "GRU"),
        DropdownField(label: "Score", initialValue: "46"),
        DropdownField(label: "Company Type", initialValue: "Select type"),
        DropdownField(label: "Organization", initialValue: "Select type"),
        DropdownField(label: "Choose Duration", initialValue: "Select Duration"),
      ],
    );
  }
}

class DropdownField extends StatefulWidget {
  final String label;
  final String initialValue;

  DropdownField({required this.label, required this.initialValue});

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedValue,
                items: [widget.initialValue, "Option 1", "Option 2"]
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// //
// // import 'package:flutter/material.dart';
// //
// //
// // void main() {
// //   runApp(Editcourses());
// // }
// //
// //
// // class Editcourses extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: CourseFinderScreen(),
// //     );
// //   }
// // }
// //
// // class CourseFinderScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return DefaultTabController(
// //       length: 3, //
// //       // Three tabs
// //       child: Scaffold(
// //         backgroundColor: Colors.white,
// //         body: SingleChildScrollView(
// //           padding: const EdgeInsets.all(20),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               /// **Header Section**
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Text("Welcome ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// //                       Text("Admin,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB))),
// //                     ],
// //                   ),
// //                   Row(
// //                     children: [
// //                       Container(
// //                         height: 40,
// //                         width: 300,
// //                         child: TextField(
// //                           decoration: InputDecoration(
// //                             filled: true,
// //                             fillColor: Colors.white,
// //                             hintText: "Search University or courses",
// //                             prefixIcon: Icon(Icons.search, color: Colors.grey, size: 21),
// //                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(width: 10),
// //                       CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.person)),
// //                       SizedBox(width: 10),
// //                       CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //
// //               SizedBox(height: 20),
// //
// //               /// **Tab Bar**
// //               Container(
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(10),
// //                 ),
// //                 child: TabBar(
// //
// //                   labelColor: Colors.black,
// //                   indicatorColor: Colors.blue,
// //                   tabs: [
// //                     Tab(child: Text("Bachelors", style: TextStyle(fontWeight: FontWeight.bold))),
// //                     Tab(child: Text("Masters", style: TextStyle(fontWeight: FontWeight.bold))),
// //                     Tab(child: Text("MBA", style: TextStyle(fontWeight: FontWeight.bold))),
// //                   ],
// //                 ),
// //
// //               ),
// //
// //               /// **Tab Content**
// //               Container(
// //                 height: 600, // Adjust height to fit content
// //                 child: TabBarView(
// //                   children: [
// //                     Editcourse1(),
// //                     Editcourse2(),
// //                     Editcourse3(),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // class Editcourse1 extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: ListView(
// //         children: [
// //           dropdownField("Country Name",preselectedValue:"india"),
// //           dropdownField("Country Name", preselectedValue:"India"),
// //           dropdownField("Course Name", preselectedValue:"Msc Physics"),
// //           dropdownField("Work Experience",preselectedValue: "6 months"),
// //           dropdownField("Education Level",preselectedValue: "Undergraduate Diploma"),
// //           dropdownField("Board",preselectedValue: "CBSE"),
// //           dropdownField("Percentage",preselectedValue: "70%"),
// //           dropdownField("English Test",preselectedValue: "IELTS"),
// //           dropdownField("Score",preselectedValue: "540"),
// //           dropdownField("Academic Test",preselectedValue: "GRU"),
// //           dropdownField("Score",preselectedValue: "46"),
// //           dropdownField("Company Type",preselectedValue: "Select type"),
// //           dropdownField("Organization", preselectedValue:"Select type"),
// //           dropdownField("Choose Duration",preselectedValue: "Select Duration"),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // Page 2: Masters
// // class Editcourse2 extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: ListView(
// //         children: [
// //           dropdownField("Country Name",preselectedValue: "India"),
// //           dropdownField("Course Name",preselectedValue: "Msc Physics"),
// //           dropdownField("Work Experience",preselectedValue: "6 months"),
// //           dropdownField("Education Level", preselectedValue:"Undergraduate Diploma"),
// //           dropdownField("Board/Institute",preselectedValue: "CBSE"),
// //           dropdownField("Percentage",preselectedValue: "70%"),
// //           dropdownField("English Test",preselectedValue: "IELTS"),
// //           dropdownField("Score", preselectedValue:"540"),
// //           dropdownField("Academic Test",preselectedValue: "GRU"),
// //           dropdownField("Score",preselectedValue: "46"),
// //           dropdownField("Research Paper",preselectedValue: "Yes"),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // Page 3: MBA
// // class Editcourse3 extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: ListView(
// //         children: [
// //           dropdownField("Country Name",preselectedValue: "India"),
// //           dropdownField("Course Name",preselectedValue: "Msc Physics"),
// //           dropdownField("Work Experience", preselectedValue:"6 months"),
// //           dropdownField("Education Level",preselectedValue: "Undergraduate Diploma"),
// //           dropdownField("Board",preselectedValue: "CBSE"),
// //           dropdownField("Percentage",preselectedValue: "70%"),
// //           dropdownField("English Test",preselectedValue: "IELTS"),
// //           dropdownField("Score",preselectedValue: "540"),
// //           dropdownField("Academic Test",preselectedValue: "GRU"),
// //           dropdownField("Score",preselectedValue: "46"),
// //           dropdownField("Company Type",preselectedValue: "Select type"),
// //           dropdownField("Organization",preselectedValue: "Select type"),
// //           dropdownField("Choose Duration",preselectedValue: "Select Duration"),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // Common Dropdown Field Widget
// // Widget dropdownField(String label ,{required String preselectedValue}) {
// //   return Padding(
// //     padding: const EdgeInsets.symmetric(vertical: 8.0),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //         SizedBox(height: 5),
// //         Container(
// //           padding: EdgeInsets.symmetric(horizontal: 10),
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.grey),
// //             borderRadius: BorderRadius.circular(5),
// //           ),
// //           child: DropdownButtonHideUnderline(
// //             child: DropdownButton<String>(
// //               isExpanded: true,
// //               items: ["Select $label", "Option 1", "Option 2"]
// //                   .map((e) => DropdownMenuItem(child: Text(e), value: e))
// //                   .toList(),
// //               onChanged: (value) {},
// //               hint: Text("Select $label"),
// //             ),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// //
// //
// //
// // // Page 1: Bachelors
// //
