import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class EditUniversity extends StatefulWidget {
//   var universityid;
//   var universityname;
  class EditUniversity extends StatefulWidget {


  const EditUniversity({super.key,  required this.universityname ,required this.universityid });  // Constructor
  final String universityname;
  final String universityid;
  // Declare parameter

  @override

  _EditUniversityState createState() => _EditUniversityState();
}

class _EditUniversityState extends State<EditUniversity> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String?Universityid;
  String?Universityname;
  String? selectedCountry;
  String? selectedDegree;
  String? selectedCourse;
  String? selectedDuration;
  String? selectedEligibility;
  String? selectedRank;

  DateTime? establishedDate;
  DateTime? admissionStartDate;
  DateTime? admissionEndDate;

  // education
  String? highestEducation;
  String? highestEducationpercentage;

  String? AcadamicTest;
  String? AcadamicTestPercentage;

  // common
  String? Englishtest;
  String? Englishtestpercentage;
  String admissionType = "Public";


  // final TextEditingController establishedDateController =
  // TextEditingController();
  // final TextEditingController admissionStartDateController =
  // TextEditingController();
  // final TextEditingController admissionEndDateController =
  // TextEditingController();
  // final TextEditingController DiscriptionController = TextEditingController();
  // final TextEditingController UniversitynameController =
  // TextEditingController();
  // final TextEditingController Terms_and_conditions = TextEditingController();
  // final TextEditingController courseFeeController = TextEditingController();
  // final TextEditingController scholarshipFeeController =
  // TextEditingController();
  // final TextEditingController collegenamectrl = TextEditingController();
  // final TextEditingController collegecodectrl = TextEditingController();

  // String? selectedCountry;
  // String? selectedDegree;
  // String? selectedCourse;
  // String? selectedEligibility;
  //


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
                    SizedBox(width: 10),
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
                            backgroundImage: AssetImage('assets/Profile/img.png'),
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
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit University",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {

                      University_model student = University_model(

                        Universityid: widget.universityid,
                        Universityname:Universityname ??"",

                        // product_name: productNameController.text,
                        // service: selectedServiceType ?? "",
                        // category: selectedCategory ?? "",
                        // product_image: imagePath ?? "",
                      );

                      context
                          .read<UniversityBloc>()
                          .add(University_Edit_Event(University: student));

                      // Add action here
                    },
                    borderRadius: BorderRadius.circular(8), // Smooth border effect on tap
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                      decoration: BoxDecoration(
                        color: Colors.blue, // Blue background
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                      child: Text(
                        "+Save",
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// **Divider Line**
            SizedBox(height: 5),
            Divider(thickness: 2, color: Colors.grey),

            // SizedBox(height: 20),

            SizedBox(height: 20),
            buildTextField("University Name", initialValue:Universityname),

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



