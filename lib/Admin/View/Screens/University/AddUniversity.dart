import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Main/Adminmain.dart';

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

  final TextEditingController establishedDateController =
      TextEditingController();
  final TextEditingController admissionStartDateController =
      TextEditingController();
  final TextEditingController admissionEndDateController =
      TextEditingController();
  final TextEditingController DiscriptionController = TextEditingController();
  final TextEditingController UniversitynameController =
      TextEditingController();
  final TextEditingController Terms_and_conditions = TextEditingController();
  final TextEditingController courseFeeController = TextEditingController();
  final TextEditingController scholarshipFeeController =
      TextEditingController();
  final TextEditingController collegenamectrl = TextEditingController();
  final TextEditingController collegecodectrl = TextEditingController();

  // @override
  // void dispose() {
  //   establishedDateController.dispose();
  //   admissionStartDateController.dispose();
  //   admissionEndDateController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          // Wrap the form fields in a Form widget
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
              BlocConsumer<UniversityBloc, UniversityState>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("University added successfully!"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  if (state is RefreshUniversity) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminPage();
                      },
                    ));
                  }
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "University Adding Page",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              University_model university = University_model(
                                  UniversityimageURL:
                                      "https://content.jdmagicbox.com/v2/comp/malappuram/m9/9999px483.x483.221229222631.k6m9/catalogue/calicut-university-malappuram-universities-ez2kcrhfsj.jpg",
                                  Country: selectedCountry,
                                  Admission_enddate:
                                      admissionEndDateController.text,
                                  Admission_startdate:
                                      admissionStartDateController.text,
                                  Course_offered: selectedCourse,
                                  Degree_offered: selectedDegree,
                                  Description: DiscriptionController.text,
                                  Duration: selectedDuration,
                                  Eligibility_criteria: selectedEligibility,
                                  Established_date:
                                      establishedDateController.text,
                                  Schoolarship_details:
                                      scholarshipFeeController.text,
                                  Terms_and_conditions:
                                      Terms_and_conditions.text,
                                  Tuition_fees: courseFeeController.text,
                                  Universityname: UniversitynameController.text,
                                  Rank: selectedRank,
                                  highestEducationpercentage:
                                      highestEducationpercentage,
                                  highestEducation: highestEducation,
                                  Englishtestpercentage: Englishtestpercentage,
                                  Englishtest: Englishtest,
                                  AcadamicTestPercentage:
                                      AcadamicTestPercentage,
                                  AcadamicTest: AcadamicTest,
                                  Collegename: collegenamectrl.text,
                                  collagecode: collegecodectrl.text);
                              context.read<UniversityBloc>().add(
                                  University_Add_Event(University: university));
                            }
                          },
                          borderRadius: BorderRadius.circular(
                              8), // Smooth border effect on tap
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 36),
                            decoration: BoxDecoration(
                              color: Colors.blue, // Blue background
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                            child: state is UniversityaddSuccess
                                ? Loading_Widget()
                                : Text(
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
                  );
                },
              ),

              /// **Divider Line**
              SizedBox(height: 5),
              Divider(thickness: 2, color: Colors.grey),

              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: TextFormField(
                  controller: UniversitynameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "University Name",
                      border: OutlineInputBorder()),
                  validator: (value) => true && (value == null || value.isEmpty)
                      ? 'University Name is required'
                      : null,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 25),
                      child: TextFormField(
                        controller: collegenamectrl,
                        maxLines: 1,
                        decoration: InputDecoration(
                            labelText: "College Name",
                            border: OutlineInputBorder()),
                        validator: (value) =>
                            true && (value == null || value.isEmpty)
                                ? 'College Name is required'
                                : null,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 25),
                      child: TextFormField(
                        controller: collegecodectrl,
                        maxLines: 1,
                        decoration: InputDecoration(
                            labelText: "College Code",
                            border: OutlineInputBorder()),
                        validator: (value) =>
                            true && (value == null || value.isEmpty)
                                ? 'College Code is required'
                                : null,
                      ),
                    ),
                  ),
                ],
              ),

              /// **Admission Type (Radio Buttons)**

              Row(
                children: [
                  Expanded(
                    child: buildDropdown(
                        "Country",
                        [
                          "United States",
                          "United Kingdom",
                          "Canada",
                          "India",
                        ],
                        selectedCountry, (value) {
                      setState(() => selectedCountry = value);
                    }, required: true),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker("Established Date", establishedDate,
                        (date) {
                      setState(() {
                        establishedDate = date;
                        establishedDateController.text = "${date?.toLocal()}"
                            .split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                ],
              ),

              // Admission Start & End Date in the Same Row
              Row(
                children: [
                  Expanded(
                    child: buildDatePicker(
                        "Admission Start Date", admissionStartDate, (date) {
                      setState(() {
                        admissionStartDate = date;
                        admissionStartDateController.text = "${date?.toLocal()}"
                            .split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker(
                        "Admission End Date", admissionEndDate, (date) {
                      setState(() {
                        admissionEndDate = date;
                        admissionEndDateController.text = "${date?.toLocal()}"
                            .split(' ')[0]; // Format the date
                      });
                    }, required: true),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Course Details..",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),

              // Dropdown for Degree Type
              buildDropdown("Degree Type", ["Bachelors", "Masters", "MBA"],
                  selectedDegree, (value) {
                setState(() => selectedDegree = value);
              }, required: true),

              // Dropdown for Bachelor's Courses
              if (selectedDegree == "Bachelors")
                Column(
                  children: [
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
                          "BA in Criminology",
                          "BA in Public Administration",
                          "BA in Economics",
                          "BA in International Relations"
                        ],
                        selectedCourse, (value) {
                      setState(() => selectedCourse = value);
                    }),
                    buildDropdown(
                        "Education Level",
                        ["Grade 12", "Undergraduate diploma"],
                        highestEducation, (value) {
                      setState(() {
                        highestEducation = value;
                        print(highestEducation);
                      });
                    }),
                    buildDropdown(
                        "Minimum Required Percentage ",
                        ["50", "60", "70", "80", "90", "100"],
                        highestEducationpercentage, (value) {
                      setState(() {
                        highestEducationpercentage = value;
                        print(highestEducationpercentage);
                      });
                    }),
                    buildDropdown(
                        "AcademicTest",
                        [
                          "ACT",
                          "SAT",
                          "JEE",
                          "NEET",
                          "CUET",
                          "Not Required",
                        ],
                        AcadamicTest, (value) {
                      setState(() {
                        AcadamicTest = value;
                        print(AcadamicTest);
                      });
                    }),
                    buildDropdown(
                        "AcademicTestPercentage minimum",
                        ["50", "60", "70", "80", "90", "100"],
                        AcadamicTestPercentage, (value) {
                      setState(() {
                        AcadamicTestPercentage = value;
                        print(AcadamicTestPercentage);
                      });
                    }),
                    buildDropdown(
                        "AcademicTestPercentage minimum",
                        ["50", "60", "70", "80", "90", "100"],
                        AcadamicTestPercentage, (value) {
                      setState(() {
                        AcadamicTestPercentage = value;
                        print(AcadamicTestPercentage);
                      });
                    }),
                  ],
                ),

              // Dropdown for Master's Courses
              if (selectedDegree == "Masters")
                Column(
                  children: [
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
                          "MSc in Biotechnology",
                          "MSc in Physics",
                          "MSc in Chemistry ",
                          "MSc in Mathematics",
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
                          "MSc in Industrial Engineering"
                        ],
                        selectedCourse, (value) {
                      setState(() => selectedCourse = value);
                    }),
                    buildDropdown(
                        "Education Level",
                        [
                          "Undergraduate Degree",
                          "Undergraduate Diploma",
                          "Postgraduate Degree",
                          "Postgraduate Diploma",
                        ],
                        highestEducation, (value) {
                      setState(() {
                        highestEducation = value;
                        print(highestEducation);
                      });
                    }),
                    buildDropdown(
                        "Minimum Required Percentage ",
                        ["50", "60", "70", "80", "90", "100"],
                        highestEducationpercentage, (value) {
                      setState(() {
                        highestEducationpercentage = value;
                        print(highestEducationpercentage);
                      });
                    }),
                    buildDropdown(
                        "AcademicTest",
                        [
                          "GRE",
                          "GMAT",
                          "GATE",
                          "IIT JAM",
                          "NEET",
                          "LSAT",
                        ],
                        AcadamicTest, (value) {
                      setState(() {
                        AcadamicTest = value;
                        print(AcadamicTest);
                      });
                    }),
                    buildDropdown(
                        "AcademicTestPercentage minimum",
                        ["50", "60", "70", "80", "90", "100"],
                        AcadamicTestPercentage, (value) {
                      setState(() {
                        AcadamicTestPercentage = value;
                        print(AcadamicTestPercentage);
                      });
                    }),
                  ],
                ),

              // Dropdown for MBA Courses
              if (selectedDegree == "MBA")
                Column(
                  children: [
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
                        selectedCourse, (value) {
                      setState(() {
                        selectedCourse = value;
                        print(selectedCourse);
                      });
                    }),
                    buildDropdown(
                        "Education Level",
                        [
                          "Undergraduate Degree",
                          "Undergraduate Diploma",
                          "Postgraduate Degree",
                          "Postgraduate Diploma",
                        ],
                        highestEducation, (value) {
                      setState(() {
                        highestEducation = value;
                        print(highestEducation);
                      });
                    }),
                    buildDropdown(
                        "Minimum Required Percentage ",
                        ["50", "60", "70", "80", "90", "100"],
                        highestEducationpercentage, (value) {
                      setState(() {
                        highestEducationpercentage = value;
                        print(highestEducationpercentage);
                      });
                    }),
                    buildDropdown(
                        "AcadamicTest",
                        [
                          "GRE",
                          "GMAT",
                          "CAT",
                          "IIT JAM",
                          "CMAT",
                          "Not Required",
                        ],
                        AcadamicTest, (value) {
                      setState(() {
                        AcadamicTest = value;
                        print(AcadamicTest);
                      });
                    }),
                    buildDropdown(
                        "AcademicTestPercentage minimum",
                        ["50", "60", "70", "80", "90", "100"],
                        AcadamicTestPercentage, (value) {
                      setState(() {
                        AcadamicTestPercentage = value;
                        print(AcadamicTestPercentage);
                      });
                    }),
                  ],
                ),

              // Dropdown for Course Duration
              Row(
                children: [
                  Expanded(
                    child: buildDropdown(
                        "Course Duration",
                        ["1 Year", "2 Years", "3 Years"],
                        selectedDuration, (value) {
                      setState(() => selectedDuration = value);
                    }, required: true),
                  ),
                  // Expanded(
                  //   child: buildDropdown(
                  //       "Eligibility Criteria",
                  //       ["12th Pass", "Graduate", "Postgraduate"],
                  //       selectedEligibility, (value) {
                  //     setState(() => selectedEligibility = value);
                  //   }, required: true),
                  // ),
                  Expanded(
                    child: buildDropdown(
                        "Rank", ["Top 10", "Top 50", "Top 100"], selectedRank,
                        (value) {
                      setState(() => selectedRank = value);
                    }, required: true),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: buildDropdown(
                        "EnglishTest",
                        ["PTE", "IELTS", "TOEFL", "Not Required"],
                        Englishtest, (value) {
                      setState(() {
                        Englishtest = value;
                        print(Englishtest);
                      });
                    }, required: true),
                  ),
                  Expanded(
                    child: buildDropdown(
                        "Required Percentage ",
                        ["50", "60", "70", "80", "90", "100"],
                        Englishtestpercentage, (value) {
                      setState(() {
                        Englishtestpercentage = value;

                        print(Englishtestpercentage);
                      });
                    }, required: true),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: TextFormField(
                  controller: DiscriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: "Description", border: OutlineInputBorder()),
                  validator: (value) => true && (value == null || value.isEmpty)
                      ? 'Description is required'
                      : null,
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: TextFormField(
                  controller: Terms_and_conditions,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: "Terms_and_conditions",
                      border: OutlineInputBorder()),
                  validator: (value) => true && (value == null || value.isEmpty)
                      ? 'Terms_and_conditions is required'
                      : null,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: courseFeeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Course Fee",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: scholarshipFeeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Scholarship Fee",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
        validator: (value) =>
            required && value == null ? '$label is required' : null,
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

  /// **Reusable Text Field Widget**
  Widget buildTextField(String label,
      {int maxLines = 1,
      TextInputType keyboardType = TextInputType.text,
      bool required = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: (value) => required && (value == null || value.isEmpty)
            ? '$label is required'
            : null,
      ),
    );
  }
}
