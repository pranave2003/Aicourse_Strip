import 'package:flutter/material.dart';

class AddUniversity extends StatefulWidget {
  @override
  _AddUniversityState createState() => _AddUniversityState();
}

class _AddUniversityState extends State<AddUniversity> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String? selectedCountry;
  String? selectedDegree;
  String? selectedCourse;
  String? selectedDuration;
  String? selectedEligibility;
  String? selectedBachelorCourse;
  String? selectedMasterCourse;
  String? selectedMBACourse;
  String? selectedRank;
  String? selectedFeeCourse;
  String? selectedScholarshipCourse;

  String admissionType = "Public"; // Default selected radio button
  DateTime? establishedDate;
  DateTime? admissionStartDate;
  DateTime? admissionEndDate;
  final TextEditingController establishedDateController = TextEditingController();
  final TextEditingController admissionStartDateController = TextEditingController();
  final TextEditingController admissionEndDateController = TextEditingController();
  @override
  void dispose() {
    establishedDateController.dispose();
    admissionStartDateController.dispose();
    admissionEndDateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form( // Wrap the form fields in a Form widget
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Header Section**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Welcome ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Admin,",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0A71CB))),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          child: Icon(Icons.notification_add)),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
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
                              backgroundImage: AssetImage(
                                  'assets/Profile/img.png'), // Corrected Path
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Admin",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                      "University Adding Page",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, proceed with the action
                          // Add action here
                        }
                      },
                      borderRadius:
                      BorderRadius.circular(8), // Smooth border effect on tap
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                        decoration: BoxDecoration(
                          color: Colors.blue, // Blue background
                          borderRadius:
                          BorderRadius.circular(8), // Rounded corners
                        ),
                        child: Text(
                          "+Add",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// **Divider Line**
              SizedBox(height: 5),
              Divider(thickness: 2, color: Colors.grey),

              SizedBox(height: 20),
              buildTextField("University Name", required: true),

              buildDropdown(
                  "Country",
                  [
                    "United States",
                    "United Kingdom",
                    "New Zealand",
                    "Canada",
                    "Australia",
                    "India"
                  ],
                  selectedCountry, (value) {
                setState(() => selectedCountry = value);
              }, required: true),

              Padding(
                padding: const EdgeInsets.all(8.4),
                child: Text("Admission Type:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
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
              /// **Admission Type (Radio Buttons)**

              if (admissionType.isEmpty)
                Text(
                  'Please select an admission type',
                  style: TextStyle(color: Colors.red),
                ),
              buildDatePicker("Established Date", establishedDate, (date) {
                setState(() {
                  establishedDate = date;
                  establishedDateController.text = "${date?.toLocal()}".split(' ')[0]; // Format the date
                });
              }, required: true),

              // Admission Start & End Date in the Same Row
              Row(
                children: [
                  Expanded(
                    child: buildDatePicker("Admission Start Date", admissionStartDate, (date) {
                      setState(() {
                        admissionStartDate = date;
                        admissionStartDateController.text = "${date?.toLocal()}".split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker("Admission End Date", admissionEndDate, (date) {
                      setState(() {
                        admissionEndDate = date;
                        admissionEndDateController.text = "${date?.toLocal()}".split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                ],
              ),

        //       // Other widgets...
        //     ],
        //   ),
        // ),
        //       /// **Date Pickers for Established Date**
              buildDatePicker("Established Date", establishedDate, (date) {

                setState(() => establishedDate = date);
              }, required: true),


              Row(
                children: [
                  Expanded(
                    child: buildDatePicker(
                        "Admission Start Date", admissionStartDate, (date) {
                      setState(() => admissionStartDate = date);
                    }, required: true),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker("Admission End Date", admissionEndDate,
                            (date) {
                          setState(() => admissionEndDate = date);
                        }, required: true),
                  ),
                ],
              ),

              // Dropdown for Degree Type
              buildDropdown(
                  "Degree Type", ["Bachelor", "Master", "MBA"], selectedDegree,
                      (value) {
                    setState(() => selectedDegree = value);
                  }, required: true),

              // Dropdown for Bachelor's Courses
              if (selectedDegree == "Bachelor")
                buildDropdown(
                    "Course Name",
                    [
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
                      "MBBS (Bachelor of Medicine & Surgery)",
                      "BDS (Bachelor of Dental Surgery)",
                      "BPharm (Bachelor of Pharmacy)",
                      "BPT (Bachelor of Physiotherapy)",
                      "BSc in Nursing",
                      "BSc in Nutrition & Dietetics",
                      "BSc in Medical Lab Technology",
                      "BTech in Computer Science",
                      "BTech in Mechanical Engineering",
                      "BTech in Electrical Engineering",
                      "BTech in Civil Engineering",
                      "BTech in Electronics & Communication",
                      "BTech in Aerospace Engineering",
                      "LLB (Bachelor of Laws)",
                      "BA in Criminology",
                      "BA in Public Administration",
                      "BA in Economics",
                      "BA in International Relations"
                    ],
                    selectedBachelorCourse, (value) {
                  setState(() => selectedBachelorCourse = value);
                }),

              // Dropdown for Master's Courses
              if (selectedDegree == "Master")
                buildDropdown(
                    "Course Name",
                    [
                      "MSc in Finance",
                      "MSc in Economics",
                      "MSc in Human Resource Management",
                      "MSc in Marketing",
                      "MSc in Digital Business",
                      "MSc in Project Management",
                      "MSc in Supply Chain & Logistics",
                      "MSc in Computer Science",
                      "MSc in Artificial Intelligence",
                      "MSc in Data Science",
                      "MSc in Cybersecurity",
                      "MSc in Information Technology",
                      "MTech in Civil Engineering",
                      "MTech in Mechanical Engineering",
                      "MTech in Electrical Engineering",
                      "MSc in Biotechnology",
                      "MSc in Physics / Chemistry / Mathematics",
                      "MD (Doctor of Medicine)",
                      "MDS (Master of Dental Surgery)",
                      "MPharm (Master of Pharmacy)",
                      "MSc in Public Health",
                      "MSc in Nursing",
                      "MSc in Medical Lab Technology",
                      "MA in Psychology",
                      "MA in Sociology",
                      "MA in Journalism & Mass Communication",
                      "MA in English Literature",
                      "MA in History",
                      "MA in Political Science",
                      "MA in Fine Arts",
                      "LLM (Master of Laws)",
                      "Master in Criminology",
                      "MSc in International Relations",
                      "MSc in Public Policy",
                      "Master in Social Work (MSW)",
                      "MTech in Computer Science",
                      "MTech in Robotics",
                      "MSc in Industrial Engineering"
                    ],
                    selectedMasterCourse, (value) {
                  setState(() => selectedMasterCourse = value);
                }),

              // Dropdown for MBA Courses
              if (selectedDegree == "MBA")
                buildDropdown(
                    "Course Name",
                    [
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
                      "Executive MBA (EMBA)"
                    ],
                    selectedMBACourse, (value) {
                  setState(() => selectedMBACourse = value);
                }),

              // Dropdown for Course Duration
              buildDropdown("Course Duration", ["1 Year", "2 Years", "3 Years"],
                  selectedDuration, (value) {
                    setState(() => selectedDuration = value);
                  }, required: true),

              buildDropdown(
                  "Eligibility Criteria",
                  ["12th Pass", "Graduate", "Postgraduate"],
                  selectedEligibility, (value) {
                setState(() => selectedEligibility = value);
              }, required: true),

              buildDropdown("Rank", ["Top 10", "Top 50", "Top 100"], selectedRank,
                      (value) {
                    setState(() => selectedRank = value);
                  }, required: true),

              SizedBox(height: 10),
              buildTextField("Description", maxLines: 3,required: true),

              buildDropdownWithAmount("Fee Details"),
              buildDropdownWithAmount("Scholarships"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> options,
      String? selectedValue, ValueChanged<String?> onChanged,
      {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: selectedValue,
        onChanged: onChanged,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (value) => required && value == null ? '$label is required' : null,
      ),
    );
  }


  Widget buildDatePicker(
      String label, DateTime? selectedDate, ValueChanged<DateTime?> onChanged,
      {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: TextFormField(
        controller: selectedDate == establishedDate
            ? establishedDateController
            : selectedDate == admissionStartDate
            ? admissionStartDateController
            : admissionEndDateController,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (pickedDate != null) {
            onChanged(pickedDate);
          }
        },
        validator: (value) =>
        required && selectedDate == null ? '$label is required' : null,
      ),
    );
  }


  Widget buildDropdownWithAmount(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3, // Reduced width for dropdown
            child: buildDropdown(
                label, ["Bachelors", "Masters", "MBA"], selectedFeeCourse,
                    (value) {
                  setState(() => selectedFeeCourse = value);
                }),
          ),
          SizedBox(width: 8), // Reduced spacing
          Expanded(
            flex: 2, // Reduced width for text field
            child: buildTextField("Enter Amount",
                keyboardType: TextInputType.number, required: true),
          ),
          SizedBox(width: 8), // Reduced spacing
          InkWell(
            onTap: () {
              // Add action here
            },
            child: Container(
              height: 30, // Reduced height
              width: 60, // Adjusted width
              decoration: BoxDecoration(
                color: Color(0xff0A71CB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "+Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16, // Reduced font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Reusable Text Field Widget**
  Widget buildTextField(String label,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text, bool required = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration:
        InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: (value) => required && (value == null || value.isEmpty) ? '$label is required' : null,
      ),
    );
  }
}




