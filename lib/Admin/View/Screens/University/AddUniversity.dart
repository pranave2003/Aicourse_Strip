import 'package:flutter/material.dart';

class AddUniversity extends StatefulWidget {
  @override
  _AddUniversityState createState() => _AddUniversityState();
}

class _AddUniversityState extends State<AddUniversity> {
  String? selectedCountry;
  String? selectedDegree;
  String? selectedCourse;
  String? selectedEligibility;
  String? selectedRank;
  String? selectedFeeCourse;
  String? selectedScholarshipCourse;

  String admissionType = "Public"; // Default selected radio button
  DateTime? establishedDate;
  DateTime? admissionStartDate;
  DateTime? admissionEndDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Header Section**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Welcome ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Admin,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB))),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 0.5, color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 20, // Ensure a proper radius is set
                            backgroundColor: Colors.grey, // Fallback color
                            backgroundImage: AssetImage('assets/Profile/img.png'), // Corrected Path
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Admin",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),
            Text("Add University", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

            /// **Divider Line**
            SizedBox(height: 5),
            Divider(thickness: 2, color: Colors.grey),

            SizedBox(height: 20),
            buildTextField("University Name"),

            buildDropdown("Country", ["USA", "Canada", "India", "UK"], selectedCountry, (value) {
              setState(() => selectedCountry = value);
            }),

            /// **Admission Type (Radio Buttons)**
            Text("Admission Type:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Row(
              children: [
                Radio(
                  value: "Public",
                  groupValue: admissionType,
                  onChanged: (value) {
                    setState(() => admissionType = value.toString());
                  },
                ),
                Text("Public"),
                SizedBox(width: 20),
                Radio(
                  value: "Private",
                  groupValue: admissionType,
                  onChanged: (value) {
                    setState(() => admissionType = value.toString());
                  },
                ),
                Text("Private"),
              ],
            ),

            /// **Date Pickers for Established Date**
            buildDatePicker("Established Date", establishedDate, (date) {
              setState(() => establishedDate = date);
            }),

            /// **Admission Start & End Date in the Same Row**
            Row(
              children: [
                Expanded(
                  child: buildDatePicker("Admission Start Date", admissionStartDate, (date) {
                    setState(() => admissionStartDate = date);
                  }),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: buildDatePicker("Admission End Date", admissionEndDate, (date) {
                    setState(() => admissionEndDate = date);
                  }),
                ),
              ],
            ),

            buildDropdown("Degree Type", ["Bachelor", "Master", "PhD"], selectedDegree, (value) {
              setState(() => selectedDegree = value);
            }),

            buildDropdown("Course Name", ["CS", "IT", "Business"], selectedCourse, (value) {
              setState(() => selectedCourse = value);
            }),

            buildDropdown("Eligibility Criteria", ["12th Pass", "Graduate", "Postgraduate"], selectedEligibility, (value) {
              setState(() => selectedEligibility = value);
            }),

            buildDropdown("Rank", ["Top 10", "Top 50", "Top 100"], selectedRank, (value) {
              setState(() => selectedRank = value);
            }),

            SizedBox(height: 10),
            buildTextField("Description", maxLines: 3),

            buildDropdownWithAmount("Fee Details"),
            buildDropdownWithAmount("Scholarships"),
          ],
        ),
      ),
    );
  }

  /// **Reusable Dropdown Widget**
  Widget buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        value: selectedValue,
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }

  /// **Reusable Date Picker Widget**
  Widget buildDatePicker(String label, DateTime? selectedDate, Function(DateTime) onDatePicked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            onDatePicked(picked);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : "Select Date"),
              Icon(Icons.calendar_today, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  /// **Dropdown with Amount Input**
  Widget buildDropdownWithAmount(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropdown(label, ["Course 1", "Course 2"], selectedFeeCourse, (value) {
              setState(() => selectedFeeCourse = value);
            }),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: buildTextField("Enter Amount", keyboardType: TextInputType.number),
          ),
        ],
      ),
    );
  }

  /// **Reusable Text Field Widget**
  Widget buildTextField(String label, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }
}






//
//
// import 'package:flutter/material.dart';
//
// class AddUniversity extends StatefulWidget {
//   @override
//   _AddUniversityState createState() => _AddUniversityState();
// }
//
// class _AddUniversityState extends State<AddUniversity> {
//   String? selectedCountry;
//   String? selectedDegree;
//   String? selectedCourse;
//   String? selectedEligibility;
//   String? selectedRank;
//   String? selectedFeeCourse;
//   String? selectedScholarshipCourse;
//
//   String admissionType = "Public"; // Default selected radio button
//   DateTime? establishedDate;
//   DateTime? admissionStartDate;
//   DateTime? admissionEndDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// **Header Section**
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text("Welcome ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                     Text("Admin,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB))),
//                   ],
//                 ),
//                     SizedBox(width: 10),
//                     const SizedBox(width: 20),
//                     Row(
//                       children: [
//                         SizedBox(width: 10),
//                         CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
//                         SizedBox(width: 10),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(width: 0.5, color: Colors.grey),
//                           ),
//                           child: Row(
//                             children: [
//                               const CircleAvatar(
//                                 radius: 20, // Ensure a proper radius is set
//                                 backgroundColor: Colors.grey, // Fallback color
//                                 backgroundImage: AssetImage('assets/Profile/img.png'),
//                               ),
//                               const SizedBox(width: 10),
//                               const Text(
//                                 "Admin",
//                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     ),
//
//           // Container(
//                     //   padding: const EdgeInsets.symmetric(
//                     //       horizontal: 14, vertical: 6),
//                     //   decoration: BoxDecoration(
//                     //       color: Colors.white,
//                     //       borderRadius: BorderRadius.circular(20),
//                     //       border:
//                     //       Border.all(width: 0.5, color: Colors.grey)),
//                     //   child: Row(
//                     //     children: const [
//                     //       CircleAvatar(
//                     //         backgroundImage:
//                     //         AssetImage('assets/profiles/img_2.png'),
//                     //       ),
//                     //       SizedBox(width: 10),
//                     //       Text("Admin",
//                     //           style: TextStyle(
//                     //               fontSize: 16,
//                     //               fontWeight: FontWeight.bold)),
//                     //     ],
//                     //   ),
//                     // ),
//                     // CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.person)),
//
//
//             SizedBox(height: 20),
//             Text("Add University", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//
//             /// **Divider Line**
//             SizedBox(height: 5),
//             Divider(thickness: 2, color: Colors.grey),
//
//             SizedBox(height: 20),
//             buildTextField("University Name"),
//
//             buildDropdown("Country", ["USA", "Canada", "India", "UK"], selectedCountry, (value) {
//               setState(() => selectedCountry = value);
//             }),
//
//             /// **Admission Type (Radio Buttons)**
//             Text("Admission Type:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//             Row(
//               children: [
//                 Radio(
//                   value: "Public",
//                   groupValue: admissionType,
//                   onChanged: (value) {
//                     setState(() => admissionType = value.toString());
//                   },
//                 ),
//                 Text("Public"),
//                 SizedBox(width: 20),
//                 Radio(
//                   value: "Private",
//                   groupValue: admissionType,
//                   onChanged: (value) {
//                     setState(() => admissionType = value.toString());
//                   },
//                 ),
//                 Text("Private"),
//               ],
//             ),
//
//             /// **Date Pickers for Established Date**
//             buildDatePicker("Established Date", establishedDate, (date) {
//               setState(() => establishedDate = date);
//             }),
//
//             /// **Admission Start & End Date in the Same Row**
//             Row(
//               children: [
//                 Expanded(
//                   child: buildDatePicker("Admission Start Date", admissionStartDate, (date) {
//                     setState(() => admissionStartDate = date);
//                   }),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: buildDatePicker("Admission End Date", admissionEndDate, (date) {
//                     setState(() => admissionEndDate = date);
//                   }),
//                 ),
//               ],
//             ),
//
//             buildDropdown("Degree Type", ["Bachelor", "Master", "PhD"], selectedDegree, (value) {
//               setState(() => selectedDegree = value);
//             }),
//
//             buildDropdown("Course Name", ["CS", "IT", "Business"], selectedCourse, (value) {
//               setState(() => selectedCourse = value);
//             }),
//
//             buildDropdown("Eligibility Criteria", ["12th Pass", "Graduate", "Postgraduate"], selectedEligibility, (value) {
//               setState(() => selectedEligibility = value);
//             }),
//
//             buildDropdown("Rank", ["Top 10", "Top 50", "Top 100"], selectedRank, (value) {
//               setState(() => selectedRank = value);
//             }),
//
//             SizedBox(height: 10),
//             // buildImageUploadField(),
//             SizedBox(height: 10),
//             buildTextField("Description", maxLines: 3),
//
//             buildDropdownWithAmount("Fee Details"),
//             buildDropdownWithAmount("Scholarships"),
//       ),
//       );
//   }
//
//   /// **Reusable Dropdown Widget**
//   Widget buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: DropdownButtonFormField<String>(
//         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
//         value: selectedValue,
//         items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
//         onChanged: onChanged,
//       ),
//     );
//   }
//
//   /// **Reusable Date Picker Widget**
//   Widget buildDatePicker(String label, DateTime? selectedDate, Function(DateTime) onDatePicked) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: InkWell(
//         onTap: () async {
//           DateTime? picked = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(2000),
//             lastDate: DateTime(2100),
//           );
//           if (picked != null) {
//             onDatePicked(picked);
//           }
//         },
//         child: InputDecorator(
//           decoration: InputDecoration(
//             labelText: label,
//             border: OutlineInputBorder(),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : "Select Date"),
//               Icon(Icons.calendar_today, color: Colors.grey),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// **Dropdown with Amount Input**
//   Widget buildDropdownWithAmount(String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: buildDropdown(label, ["Course 1", "Course 2"], selectedFeeCourse, (value) {
//               setState(() => selectedFeeCourse = value);
//             }),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             flex: 1,
//             child: buildTextField("Enter Amount", keyboardType: TextInputType.number),
//           ),
//           SizedBox(width: 10),
//           InkWell(
//             onTap: () {},
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [Text("Add", style: TextStyle(color: Colors.white)), Icon(Icons.add, color: Colors.white, size: 18)],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// **Reusable Text Field Widget**
//   Widget buildTextField(String label, {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: TextFormField(
//         maxLines: maxLines,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
//       ),
//     );
//   }
// }
