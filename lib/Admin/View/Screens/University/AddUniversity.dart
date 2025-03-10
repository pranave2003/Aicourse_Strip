

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
                    Container(
                      height: 40,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search University",
                          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 21),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.person)),
                    SizedBox(width: 10),
                    CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
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
            // buildImageUploadField(),
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
          SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text("Add", style: TextStyle(color: Colors.white)), Icon(Icons.add, color: Colors.white, size: 18)],
              ),
            ),
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




// // import 'package:flutter/material.dart';
// //
// // class AddUniversity extends StatefulWidget {
// //   @override
// //   _AddUniversityState createState() => _AddUniversityState();
// // }
// //
// // class _AddUniversityState extends State<AddUniversity> {
// //   String? selectedCountry;
// //   String? selectedDegree;
// //   String? selectedCourse;
// //   String? selectedEligibility;
// //   String? selectedRank;
// //   String? selectedFee;
// //   String? selectedScholarship;
// //   String admissionType = "Public"; // Default selection
// //
// //   DateTime? establishedDate;
// //   DateTime? admissionStartDate;
// //   DateTime? admissionEndDate;
// //
// //   Future<void> _selectDate(BuildContext context, DateTime? initialDate, Function(DateTime) onDateSelected) async {
// //     DateTime? pickedDate = await showDatePicker(
// //       context: context,
// //       initialDate: initialDate ?? DateTime.now(),
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(2100),
// //     );
// //     if (pickedDate != null) {
// //       onDateSelected(pickedDate);
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Welcome + Search + Profile
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Row(
// //                   children: [
// //                     Text("Welcome ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// //                     Text("Admin,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB))),
// //                   ],
// //                 ),
// //                 Row(
// //                   children: [
// //                     Container(
// //                       height: 40,
// //                       width: 400,
// //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
// //                       child: TextField(
// //                         decoration: InputDecoration(
// //                           filled: true,
// //                           fillColor: Colors.white,
// //                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
// //                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
// //                           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: Colors.blue)),
// //                           contentPadding: EdgeInsets.symmetric(vertical: 5),
// //                           hintText: 'Search University',
// //                           prefixIcon: Icon(Icons.search, color: Colors.grey, size: 21),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(width: 10),
// //                     CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.person)),
// //                     SizedBox(width: 10),
// //                     CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notifications))
// //                   ],
// //                 ),
// //               ],
// //             ),
// //
// //             SizedBox(height: 15),
// //
// //             // Add University Title + Line
// //             Text("Add University", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
// //             Divider(thickness: 2, color: Colors.black),
// //
// //             SizedBox(height: 20),
// //
// //             // Form Fields
// //             Expanded(
// //               child: ListView(
// //                 children: [
// //                   buildTextField("University Name"),
// //                   buildDropdownField("Country", ["USA", "UK", "Canada", "India"], (value) => setState(() => selectedCountry = value)),
// //                   buildAdmissionType(),
// //                   buildDatePicker("Established Date", establishedDate, (date) => setState(() => establishedDate = date)),
// //
// //                   // Admission Start & End Date in the same row
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: buildDatePicker("Admission Start Date", admissionStartDate, (date) => setState(() => admissionStartDate = date)),
// //                       ),
// //                       SizedBox(width: 10),
// //                       Expanded(
// //                         child: buildDatePicker("Admission End Date", admissionEndDate, (date) => setState(() => admissionEndDate = date)),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   buildDropdownField("Degree Type", ["Bachelor", "Master", "PhD"], (value) => setState(() => selectedDegree = value)),
// //                   buildDropdownField("Course Name", ["CS", "Business", "Physics"], (value) => setState(() => selectedCourse = value)),
// //                   buildDropdownField("Eligibility Criteria", ["Merit", "Entrance Exam"], (value) => setState(() => selectedEligibility = value)),
// //                   buildDropdownField("Rank", ["A", "B", "C"], (value) => setState(() => selectedRank = value)),
// //                   buildImageUploadButton(),
// //                   buildTextField("Description", maxLines: 4),
// //                   // buildDropdownWithAmount("Fee Details"),
// //                   // buildDropdownWithAmount("Scholarships"),
// //                   SizedBox(height: 20),
// //                   buildAddButton(),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Standard TextFormField
// //   Widget buildTextField(String label, {int maxLines = 1}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: TextFormField(
// //         maxLines: maxLines,
// //         decoration: InputDecoration(
// //           labelText: label,
// //           border: OutlineInputBorder(),
// //           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Dropdown Fields
// //   Widget buildDropdownField(String label, List<String> items, Function(String?) onChanged) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: DropdownButtonFormField<String>(
// //         decoration: InputDecoration(labelText: label, border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 10)),
// //         items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
// //         onChanged: onChanged,
// //       ),
// //     );
// //   }
// //
// //   // Admission Type (Radio Button)
// //   Widget buildAdmissionType() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: Row(
// //         children: [
// //           Text("Admission Type:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// //           SizedBox(width: 10),
// //           Row(
// //             children: [
// //               Radio<String>(
// //                 value: "Public",
// //                 groupValue: admissionType,
// //                 onChanged: (value) => setState(() => admissionType = value!),
// //               ),
// //               Text("Public"),
// //               Radio<String>(
// //                 value: "Private",
// //                 groupValue: admissionType,
// //                 onChanged: (value) => setState(() => admissionType = value!),
// //               ),
// //               Text("Private"),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Date Picker with Selected Date Display
// //   Widget buildDatePicker(String label, DateTime? selectedDate, Function(DateTime) onDateSelected) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: TextFormField(
// //         readOnly: true,
// //         controller: TextEditingController(text: selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : ""),
// //         decoration: InputDecoration(
// //           labelText: label,
// //           border: OutlineInputBorder(),
// //           suffixIcon: Icon(Icons.calendar_today),
// //         ),
// //         onTap: () => _selectDate(context, selectedDate, onDateSelected),
// //       ),
// //     );
// //   }
// //
// //   // Image Upload Button
// //   Widget buildImageUploadButton() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: InkWell(
// //         onTap: () {},
// //         child: Container(
// //           height: 50,
// //           decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
// //           child: Center(child: Text("+ Add Image", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Add Button
// //   Widget buildAddButton() {
// //     return Center(
// //       child: InkWell(
// //         onTap: () {},
// //         child: Container(
// //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
// //           decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
// //           child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
// //         ),
// //       ),
// //     );
// //   }
// // }
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
//   String? admissionType = "Public";
//   String? selectedFeeCourse;
//   String? selectedScholarshipCourse;
//   DateTime? establishedDate;
//   DateTime? admissionStartDate;
//   DateTime? admissionEndDate;
//
//   Future<void> _selectDate(BuildContext context, Function(DateTime) onDatePicked) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       setState(() {
//         onDatePicked(picked);
//       });
//     }
//   }
//
//   Widget buildDropdownField(String label, String? selectedValue, List<String> items, Function(String?) onChanged) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: DropdownButtonFormField<String>(
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 10),
//         ),
//         value: selectedValue,
//         items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
//         onChanged: onChanged,
//       ),
//     );
//   }
//
//   Widget buildDropdownWithAmount(String label, String? selectedValue, Function(String?) onChanged) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 labelText: label,
//                 border: OutlineInputBorder(),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
//               ),
//               value: selectedValue,
//               items: ["Course 1", "Course 2", "Course 3"]
//                   .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//                   .toList(),
//               onChanged: onChanged,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             flex: 1,
//             child: TextFormField(
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "Enter Amount",
//                 border: OutlineInputBorder(),
//                 contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           InkWell(
//             onTap: () {},
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text("Add", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//                   SizedBox(width: 5),
//                   Icon(Icons.add, color: Colors.white, size: 18),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Welcome Admin,",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB)),
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       width: 250,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(),
//                           hintText: 'Search University',
//                           prefixIcon: Icon(Icons.search, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     CircleAvatar(
//                       backgroundColor: Color(0xffD9D9D9),
//                       child: Icon(Icons.person),
//                     ),
//                     SizedBox(width: 10),
//                     CircleAvatar(
//                       backgroundColor: Color(0xffD9D9D9),
//                       child: Icon(Icons.notifications),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//             // Title
//             Text("Add University", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             Divider(thickness: 2),
//
//             SizedBox(height: 10),
//             // University Name
//             TextFormField(
//               decoration: InputDecoration(labelText: "University Name", border: OutlineInputBorder()),
//             ),
//
//             // Country Dropdown
//             buildDropdownField("Country", selectedCountry, ["USA", "Canada", "India"], (value) {
//               setState(() => selectedCountry = value);
//             }),
//
//             // Admission Type (Radio Buttons)
//             Row(
//               children: [
//                 Text("Admission Type: "),
//                 Row(
//                   children: [
//                     Radio<String>(
//                       value: "Public",
//                       groupValue: admissionType,
//                       onChanged: (value) => setState(() => admissionType = value),
//                     ),
//                     Text("Public"),
//                     Radio<String>(
//                       value: "Private",
//                       groupValue: admissionType,
//                       onChanged: (value) => setState(() => admissionType = value),
//                     ),
//                     Text("Private"),
//                   ],
//                 ),
//               ],
//             ),
//
//             // Date Pickers
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () => _selectDate(context, (date) => setState(() => establishedDate = date)),
//                     child: InputDecorator(
//                       decoration: InputDecoration(labelText: "Established Date", border: OutlineInputBorder()),
//                       child: Text(establishedDate == null ? "Select Date" : "${establishedDate!.toLocal()}".split(' ')[0]),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () => _selectDate(context, (date) => setState(() => admissionStartDate = date)),
//                     child: InputDecorator(
//                       decoration: InputDecoration(labelText: "Admission Start Date", border: OutlineInputBorder()),
//                       child: Text(admissionStartDate == null ? "Select Date" : "${admissionStartDate!.toLocal()}".split(' ')[0]),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             // Degree Type, Course Name, Eligibility, Rank
//             buildDropdownField("Degree Type", selectedDegree, ["Bachelor", "Master", "PhD"], (value) {
//               setState(() => selectedDegree = value);
//             }),
//             buildDropdownField("Course Name", selectedCourse, ["CS", "IT", "Business"], (value) {
//               setState(() => selectedCourse = value);
//             }),
//             buildDropdownField("Eligibility Criteria", selectedEligibility, ["10+2", "Bachelor", "Master"], (value) {
//               setState(() => selectedEligibility = value);
//             }),
//             buildDropdownField("Rank", selectedRank, ["Top 10", "Top 50", "Top 100"], (value) {
//               setState(() => selectedRank = value);
//             }),
//
//             // Fee Details & Scholarships
//             buildDropdownWithAmount("Fee Details", selectedFeeCourse, (value) {
//               setState(() => selectedFeeCourse = value);
//             }),
//             buildDropdownWithAmount("Scholarships", selectedScholarshipCourse, (value) {
//               setState(() => selectedScholarshipCourse = value);
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
