import 'package:flutter/material.dart';

class EditUniversity extends StatefulWidget {
  @override
  _EditUniversityState createState() => _EditUniversityState();
}

class _EditUniversityState extends State<EditUniversity> {
  String? selectedCountry;
  String? selectedDegree;
  String? selectedCourse;
  String? selectedEligibility;

  String admissionType = "Public";
  DateTime? establishedDate;
  DateTime? admissionStartDate;
  DateTime? admissionEndDate;

  @override
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
            Text("Edit University", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

            /// **Divider Line**
            SizedBox(height: 5),
            Divider(thickness: 2, color: Colors.grey),

            // SizedBox(height: 20),

            SizedBox(height: 20),
            buildTextField("University Name", initialValue: "Toronto University"),

            buildDropdown("Country", ["USA", "Canada", "India", "UK"], selectedCountry, (value) {
              setState(() => selectedCountry = value);
            }),

            /// **Admission Type**
            Text("Admission Type:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Row(
              children: [
                Radio(
                  value: "Public",
                  groupValue: admissionType,
                  onChanged: (value) => setState(() => admissionType = value.toString()),
                ),
                Text("Public"),
                SizedBox(width: 20),
                Radio(
                  value: "Private",
                  groupValue: admissionType,
                  onChanged: (value) => setState(() => admissionType = value.toString()),
                ),
                Text("Private"),
              ],
            ),

            buildDatePicker("Established Date", establishedDate, (date) {
              setState(() => establishedDate = date);
            }),

            Row(
              children: [
                Expanded(child: buildDatePicker("Admission Start Date", admissionStartDate, (date) => setState(() => admissionStartDate = date))),
                SizedBox(width: 10),
                Expanded(child: buildDatePicker("Admission End Date", admissionEndDate, (date) => setState(() => admissionEndDate = date))),
              ],
            ),

            buildDropdown("Degree Type", ["Bachelor", "Master", "PhD"], selectedDegree, (value) => setState(() => selectedDegree = value)),
            buildDropdown("Course Name", ["CS", "IT", "Business"], selectedCourse, (value) => setState(() => selectedCourse = value)),
            buildDropdown("Eligibility Criteria", ["IELTS", "TOEFL"], selectedEligibility, (value) => setState(() => selectedEligibility = value)),

            /// **Image Upload Placeholder**
            Row(
              children: [
                Image.asset("assets/bro.png", width: 80, height: 80, fit: BoxFit.cover),
                SizedBox(width: 10),
                Text("Edit Image"),
              ],
            ),

            buildTextField("Description", maxLines: 3, initialValue: "The University of Toronto is a public research university..."),

            buildFeeSection("Fee Details"),
            buildFeeSection("Scholarships"),
          ],
        ),
      ),
    );
  }

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

  Widget buildFeeSection(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: buildTextField(label, keyboardType: TextInputType.number, initialValue: "5000 INR"),
          ),
          SizedBox(width: 10),
          Expanded(
            child: buildTextField("Enter amount", keyboardType: TextInputType.number),
          ),
          SizedBox(width: 10),
          IconButton(icon: Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
        ],
      ),
    );
  }

  Widget buildTextField(String label, {int maxLines = 1, TextInputType keyboardType = TextInputType.text, String? initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        initialValue: initialValue,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class EditUniversity extends StatefulWidget {
//   const EditUniversity({super.key});
//
//   @override
//   State<EditUniversity> createState() => _EditUniversityState();
// }
//
// class _EditUniversityState extends State<EditUniversity> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25),
//                     child: Row(
//                       children: [
//                         Text(
//                           "Welcome ",
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Admin, ",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff0A71CB)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         height: 40,
//                         width: 400,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(18)),
//                         child: TextField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             enabledBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(width: .5),
//                               borderRadius: BorderRadius.circular(18),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(18),
//                               borderSide: BorderSide(
//                                   color: Theme.of(context).primaryColor),
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(
//                               vertical: 5,
//                             ),
//                             hintText: 'Search University',
//                             prefixIcon: const Icon(
//                               Icons.search,
//                               color: Colors.grey,
//                               size: 21,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CircleAvatar(
//                           backgroundColor: Color(0xffD9D9D9),
//                           child: IconButton(
//                               onPressed: () {}, icon: Icon(Icons.person)),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CircleAvatar(
//                           backgroundColor: Color(0xffD9D9D9),
//                           child: IconButton(
//                               onPressed: () {},
//                               icon: Icon(Icons.notification_add)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       " Edit University",
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       width: 18,
//                     ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
// import 'package:flutter/material.dart';
//
// class EditUniversity extends StatefulWidget {
//   @override
//   _EditUniversityState createState() => _EditUniversityState();
// }
//
// class _EditUniversityState extends State<EditUniversity> {
//   String? selectedCountry;
//   String? selectedDegree;
//   String? selectedCourse;
//   String? selectedEligibility;
//
//   String admissionType = "Public";
//   DateTime? establishedDate;
//   DateTime? admissionStartDate;
//   DateTime? admissionEndDate;
//
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               /// **Header Section**
//               Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text("Welcome ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                     Text("Admin,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB))),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 300,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: "Search University",
//                           prefixIcon: Icon(Icons.search, color: Colors.grey, size: 21),
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.person)),
//                     SizedBox(width: 10),
//                     CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
//                   ],
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 20),
//             Text("Edit University", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//
//             /// **Divider Line**
//             SizedBox(height: 5),
//             Divider(thickness: 2, color: Colors.grey),
//
//             // SizedBox(height: 20),
//
//             SizedBox(height: 20),
//             buildTextField("University Name", initialValue: "Toronto University"),
//
//             buildDropdown("Country", ["USA", "Canada", "India", "UK"], selectedCountry, (value) {
//               setState(() => selectedCountry = value);
//             }),
//
//             /// **Admission Type**
//             Text("Admission Type:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//             Row(
//               children: [
//                 Radio(
//                   value: "Public",
//                   groupValue: admissionType,
//                   onChanged: (value) => setState(() => admissionType = value.toString()),
//                 ),
//                 Text("Public"),
//                 SizedBox(width: 20),
//                 Radio(
//                   value: "Private",
//                   groupValue: admissionType,
//                   onChanged: (value) => setState(() => admissionType = value.toString()),
//                 ),
//                 Text("Private"),
//               ],
//             ),
//
//             buildDatePicker("Established Date", establishedDate, (date) {
//               setState(() => establishedDate = date);
//             }),
//
//             Row(
//               children: [
//                 Expanded(child: buildDatePicker("Admission Start Date", admissionStartDate, (date) => setState(() => admissionStartDate = date))),
//                 SizedBox(width: 10),
//                 Expanded(child: buildDatePicker("Admission End Date", admissionEndDate, (date) => setState(() => admissionEndDate = date))),
//               ],
//             ),
//
//             buildDropdown("Degree Type", ["Bachelor", "Master", "PhD"], selectedDegree, (value) => setState(() => selectedDegree = value)),
//             buildDropdown("Course Name", ["CS", "IT", "Business"], selectedCourse, (value) => setState(() => selectedCourse = value)),
//             buildDropdown("Eligibility Criteria", ["IELTS", "TOEFL"], selectedEligibility, (value) => setState(() => selectedEligibility = value)),
//
//             /// **Image Upload Placeholder**
//             Row(
//               children: [
//                 Image.asset("assets/university_image.png", width: 80, height: 80, fit: BoxFit.cover),
//                 SizedBox(width: 10),
//                 Text("Edit Image"),
//               ],
//             ),
//
//             buildTextField("Description", maxLines: 3, initialValue: "The University of Toronto is a public research university..."),
//
//             buildFeeSection("Fee Details"),
//             buildFeeSection("Scholarships"),
//           ],
//         ),
//       ),
//     );
//   }
//
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
//   Widget buildFeeSection(String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             child: buildTextField(label, keyboardType: TextInputType.number, initialValue: "5000 INR"),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: buildTextField("Enter amount", keyboardType: TextInputType.number),
//           ),
//           SizedBox(width: 10),
//           IconButton(icon: Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
//         ],
//       ),
//     );
//   }
//
//   Widget buildTextField(String label, {int maxLines = 1, TextInputType keyboardType = TextInputType.text, String? initialValue}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: TextFormField(
//         maxLines: maxLines,
//         keyboardType: keyboardType,
//         initialValue: initialValue,
//         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
//
// class EditUniversity extends StatefulWidget {
//   @override
//   _EditUniversityState createState() => _EditUniversityState();
// }
//
// class _EditUniversityState extends State<EditUniversity> {
//   String? selectedCountry;
//   String? selectedDegree;
//   String? selectedCourse;
//   String? selectedEligibility;
//   String admissionType = "Public";
//   DateTime? establishedDate;
//   DateTime? admissionStartDate;
//   DateTime? admissionEndDate;
//   File? _selectedImage;
//
//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }
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
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text("Welcome ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                     Text("Admin,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB))),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       height: 40,
//                       width: 300,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: "Search University",
//                           prefixIcon: Icon(Icons.search, color: Colors.grey, size: 21),
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.person)),
//                     SizedBox(width: 10),
//                     CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text("Edit University", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//             SizedBox(height: 5),
//             Divider(thickness: 2, color: Colors.grey),
//             SizedBox(height: 20),
//             buildTextField("University Name", initialValue: "Toronto University"),
//             buildDropdown("Country", ["USA", "Canada", "India", "UK"], selectedCountry, (value) {
//               setState(() => selectedCountry = value);
//             }),
//             Text("Admission Type:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//             Row(
//               children: [
//                 Radio(value: "Public", groupValue: admissionType, onChanged: (value) => setState(() => admissionType = value.toString())),
//                 Text("Public"),
//                 SizedBox(width: 20),
//                 Radio(value: "Private", groupValue: admissionType, onChanged: (value) => setState(() => admissionType = value.toString())),
//                 Text("Private"),
//               ],
//             ),
//             buildDatePicker("Established Date", establishedDate, (date) {
//               setState(() => establishedDate = date);
//             }),
//             Row(
//               children: [
//                 Expanded(child: buildDatePicker("Admission Start Date", admissionStartDate, (date) => setState(() => admissionStartDate = date))),
//                 SizedBox(width: 10),
//                 Expanded(child: buildDatePicker("Admission End Date", admissionEndDate, (date) => setState(() => admissionEndDate = date))),
//               ],
//             ),
//             buildDropdown("Degree Type", ["Bachelor", "Master", "PhD"], selectedDegree, (value) => setState(() => selectedDegree = value)),
//             buildDropdown("Course Name", ["CS", "IT", "Business"], selectedCourse, (value) => setState(() => selectedCourse = value)),
//             buildDropdown("Eligibility Criteria", ["IELTS", "TOEFL"], selectedEligibility, (value) => setState(() => selectedEligibility = value)),
//             /// **Image Upload Section**
//             SizedBox(height: 20),
//             Text("University Image", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 _selectedImage != null
//                     ? Image.file(_selectedImage!, width: 80, height: 80, fit: BoxFit.cover)
//                     : Image.asset("assets/university_image.png", width: 80, height: 80, fit: BoxFit.cover),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: _pickImage,
//                   child: Text("Edit Image"),
//                 ),
//               ],
//             ),
//             buildTextField("Description", maxLines: 3, initialValue: "The University of Toronto is a public research university..."),
//             buildFeeSection("Fee Details"),
//             buildFeeSection("Scholarships"),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
