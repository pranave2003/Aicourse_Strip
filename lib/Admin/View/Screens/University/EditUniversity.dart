









import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Main/Adminmain.dart';

class EditUniversity extends StatefulWidget {
  // final University_model university;
  //
  // const EditUniversity({Key? key, required this.university}) : super(key: key);
  const EditUniversity(
      {super.key,
      required this.universityname,
      required this.universityid,
      required this.Collegename,
      required this.Collegecode,
      required this.highestEducationpercentage,
      required this.establishedDate,
      required this.Admission_startdate,
      required this.admissionEndDate,
      required this.Discription,
      required this.courseFee,
      required this.Terms_and_conditions,
      required this.scholarshipFee,
      required this. AcadamicTestPercentage,
      required this. AcadamicTest, required this.highestEducation, required this.Englishtest, required this.Englishtestpercentage, required String AcademicTestPercentage}); // Constructor
  final String universityname;
  final String universityid;
  final String Collegename;
  final String Collegecode;
  final String highestEducationpercentage;
  final String establishedDate;
  final String Admission_startdate;
  final String admissionEndDate;
  final String Discription;
  final String courseFee;
  final String Terms_and_conditions;
  final String scholarshipFee;
  final String highestEducation;
  final String AcadamicTest;
  final String AcadamicTestPercentage;
  final String Englishtest;
  final String Englishtestpercentage;

  @override
  _EditUniversityState createState() => _EditUniversityState();
}

class _EditUniversityState extends State<EditUniversity> {
  final _formKey = GlobalKey<FormState>();
  // Form key for validation

  String? selectedCountry;
  String? Universityname;
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
  final TextEditingController highestEducationpercentageController =
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

  @override
  void initState() {
    super.initState();

    UniversitynameController.text = widget.universityname;
    // Initialize the university name
    collegenamectrl.text = widget.Collegename;
    collegecodectrl.text = widget.Collegecode;
    highestEducationpercentageController.text = widget.highestEducationpercentage;
    establishedDateController.text = widget.establishedDate;
    admissionStartDateController.text = widget.Admission_startdate;
    admissionEndDateController.text = widget.admissionEndDate;
    DiscriptionController.text = widget.Discription;
    courseFeeController.text = widget.courseFee;
    Terms_and_conditions.text = widget.Terms_and_conditions;
    scholarshipFeeController.text = widget.scholarshipFee;
    // Initialize other fields as needed
highestEducation = widget.highestEducation;
highestEducationpercentage = widget.highestEducationpercentage;
AcadamicTest = widget.AcadamicTest;
AcadamicTestPercentage = widget.AcadamicTestPercentage;
Englishtest = widget.Englishtest;
Englishtestpercentage = widget.Englishtestpercentage;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
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
                              radius: 20,
                              backgroundColor: Colors.grey,
                              backgroundImage:
                                  AssetImage('assets/Profile/img.png'),
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
                  if (state is UniversityaddSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("University updated successfully!"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
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
                          "University Editing Page",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              University_model university = University_model(
                                Universityid: widget.universityid,
                                Universityname: UniversitynameController.text,
                                Collegename: collegenamectrl.text,
                                collagecode: collegecodectrl.text,
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
                                Terms_and_conditions: Terms_and_conditions.text,
                                Tuition_fees: courseFeeController.text,
                                Rank: selectedRank,
                                highestEducationpercentage:
                                    highestEducationpercentage,
                                highestEducation: highestEducation,
                                Englishtestpercentage: Englishtestpercentage,
                                Englishtest: Englishtest,
                                AcadamicTestPercentage: AcadamicTestPercentage,
                                AcadamicTest: AcadamicTest,
                              );

                              context.read<UniversityBloc>().add(
                                  University_Edit_Event(
                                      University: university));
                            }
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 36),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: state is UniversityaddSuccess
                                ? Loading_Widget()
                                : Text(
                                    "+Update",
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
              buildTextField("University Name",
                  controller: UniversitynameController, validator: (value) {

                if (value == null || value.isEmpty) {
                  return 'University Name is required';
                }
                return null;
              }),

              Row(
                children: [
                  Expanded(
                    child: buildTextField("College Name",
                        controller: collegenamectrl, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'College Name is required';
                      }
                      return null;
                    }),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildTextField("College Code",
                        controller: collegecodectrl, validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'College Code is required';
                      }
                      return null;
                    }),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: buildDropdown(
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
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker("Established Date", establishedDate,
                        (date) {
                      setState(() {
                        establishedDate = date;
                        establishedDateController.text =
                            "${date?.toLocal()}".split(' ')[0];
                      });
                    }, required: true),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: buildDatePicker(
                        "Admission Start Date", admissionStartDate, (date) {
                      setState(() {
                        admissionStartDate = date;
                        admissionStartDateController.text =
                            "${date?.toLocal()}".split(' ')[0];
                      });
                    }, required: true),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker(
                        "Admission End Date", admissionEndDate, (date) {
                      setState(() {
                        admissionEndDate = date;
                        admissionEndDateController.text =
                            "${date?.toLocal()}".split(' ')[0];
                      });
                    }, required: true),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Course Details..",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),

              buildDropdown(
                  "Degree Type", ["Bachelor", "Master", "MBA"], selectedDegree,
                  (value) {
                setState(() => selectedDegree = value);
              }, required: true),

              // Course Name Dropdown based on Degree Type
              if (selectedDegree == "Bachelor") ...[
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
                      "LLB (Bachelor of Laws)",
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
                  });
                }),
                buildDropdown(
                    "Minimum Required Percentage",
                    ["50", "60", "70", "80", "90", "100"],
                    highestEducationpercentage, (value) {
                  setState(() {
                    highestEducationpercentage = value;
                  });
                }),
                buildDropdown(
                    "Academic Test",
                    ["ACT", "SAT", "JEE", "NEET", "CUET", "Not Required"],
                    AcadamicTest, (value) {
                  setState(() {
                    AcadamicTest = value;
                  });
                }),
                buildDropdown(
                    "Academic Test Percentage minimum",
                    ["50", "60", "70", "80", "90", "100"],
                    AcadamicTestPercentage, (value) {
                  setState(() {
                    AcadamicTestPercentage = value;
                  });
                }),
              ] else if (selectedDegree == "Master") ...[
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
                      "MSc in Chemistry",
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
                      "Postgraduate Diploma"
                    ],
                    highestEducation, (value) {

                  setState(() {
                    highestEducation = value;
                  });
                }),
                buildDropdown(
                    "Minimum Required Percentage",
                    ["50", "60", "70", "80", "90", "100"],
                    highestEducationpercentage, (value) {
                  setState(() {
                    highestEducationpercentage = value;
                  });
                }),
                buildDropdown(
                    "Academic Test",
                    ["GRE", "GMAT", "GATE", "IIT JAM", "NEET", "LSAT"],
                    AcadamicTest, (value) {
                  setState(() {
                    AcadamicTest = value;
                  });
                }),
                buildDropdown(
                    "Academic Test Percentage minimum",
                    ["50", "60", "70", "80", "90", "100"],
                    AcadamicTestPercentage, (value) {
                  setState(() {
                    AcadamicTestPercentage = value;
                  });
                }),
              ] else if (selectedDegree == "MBA") ...[
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
                  });
                }),
                buildDropdown(
                    "Education Level",
                    [
                      "Undergraduate Degree",
                      "Undergraduate Diploma",
                      "Postgraduate Degree",
                      "Postgraduate Diploma"
                    ],
                    highestEducation, (value) {
                  setState(() {
                    highestEducation = value;
                  });
                }),
                buildDropdown(
                    "Minimum Required Percentage",
                    ["50", "60", "70", "80", "90", "100"],
                    highestEducationpercentage, (value) {
                  setState(() {
                    highestEducationpercentage = value;
                  });
                }),
                buildDropdown(
                    "Academic Test",
                    ["GRE", "GMAT", "CAT", "IIT JAM", "CMAT", "Not Required"],
                    AcadamicTest, (value) {
                  setState(() {
                    AcadamicTest = value;
                  });
                }),
                buildDropdown(
                    "Academic Test Percentage minimum",
                    ["50", "60", "70", "80", "90", "100"],
                    AcadamicTestPercentage, (value) {
                  setState(() {
                    AcadamicTestPercentage = value;
                  });
                }),
              ],

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
                  SizedBox(width: 10),
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
                        "English Test",
                        ["PTE", "IELTS", "TOEFL", "Not Required"],
                        Englishtest, (value) {
                      setState(() {
                        Englishtest = value;
                      });
                    }, required: true),
                  ),
                  Expanded(
                    child: buildDropdown(
                        "Required Percentage",
                        ["50", "60", "70", "80", "90", "100"],
                        Englishtestpercentage, (value) {
                      setState(() {
                        Englishtestpercentage = value;
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
                  validator: (value) => value == null || value.isEmpty
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
                      labelText: "Terms and Conditions",
                      border: OutlineInputBorder()),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Terms and Conditions are required'
                      : null,
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: courseFeeController,
                      decoration: InputDecoration(
                        labelText: "Course fee",

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
                        labelText: "Scholarship details",

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
      bool required = false, required TextEditingController controller, required String? Function(dynamic value) validator}) {
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

// // // import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
// // // import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // //
// // // class EditUniversity extends StatefulWidget {
// // //   const EditUniversity(
// // //       {super.key,
// // //       required this.universityname,
// // //       required this.universityid,
// // //       required this.Collegename,
// // //       required this.Collegecode,
// // //       required this.highestEducationpercentage, required this. establishedDate, required  this. Admission_startdate, required this. admissionEndDate, required this. Discription, required this. courseFee, required this.  Terms_and_conditions, required this. scholarshipFee, required String AcademicTestPercentage, required String AcadamicTest}); // Constructor
// // //   final String universityname;
// // //   final String universityid;
// // //   final String Collegename;
// // //   final String Collegecode;
// // //   final String highestEducationpercentage;
// // //   final String establishedDate;
// // //   final String Admission_startdate;
// // //   final String admissionEndDate;
// // //   final String Discription;
// // //   final String courseFee;
// // //   final String Terms_and_conditions;
// // //   final String scholarshipFee;
// // //
// // //   @override
// // //   _EditUniversityState createState() => _EditUniversityState();
// // // }
// // //
// // // class _EditUniversityState extends State<EditUniversity> {
// // //   final GlobalKey<FormState> _formKey =
// // //       GlobalKey<FormState>(); // Form key for validation
// // //   String? Universityid;
// // //   String? Universityname;
// // //   String? selectedCountry;
// // //   String? selectedDegree;
// // //   String? selectedCourse;
// // //   String? selectedDuration;
// // //   String? selectedEligibility;
// // //   String? selectedRank;
// // //   String? highestEducationpercentage;
// // //   String? highestEducation;
// // //   String? Englishtestpercentage;
// // //   String? Englishtest;
// // //   String? AcadamicTestPercentage;
// // //
// // //   DateTime? establishedDate;
// // //   DateTime? admissionStartDate;
// // //   DateTime? admissionEndDate;
// // //   // DateTime? highestEducationpercentage;
// // //
// // //   String admissionType = "Public";
// // //
// // //   final TextEditingController establishedDateController =
// // //       TextEditingController();
// // //   final TextEditingController admissionStartDateController =
// // //       TextEditingController();
// // //   final TextEditingController admissionEndDateController =
// // //       TextEditingController();
// // //   late final TextEditingController DiscriptionController = TextEditingController();
// // //   final TextEditingController UniversitynameController =
// // //       TextEditingController();
// // //   // final TextEditingController CollegenameController = TextEditingController();
// // //   // final TextEditingController CollegecodeController = TextEditingController();
// // //   final TextEditingController highestEducationpercentageController =
// // //       TextEditingController();
// // //   final TextEditingController Terms_and_conditions = TextEditingController();
// // //   final TextEditingController courseFeeController = TextEditingController();
// // //   final TextEditingController scholarshipFeeController =
// // //       TextEditingController();
// // //   final TextEditingController collegenamectrl = TextEditingController();
// // //   final TextEditingController collegecodectrl = TextEditingController();
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     UniversitynameController.text =
// // //         widget.universityname;
// // //     // Initialize the university name
// // //     collegenamectrl.text=widget.Collegename;
// // //     collegecodectrl.text=widget.Collegecode;
// // //     highestEducationpercentageController.text=widget.highestEducationpercentage;
// // //     establishedDateController.text=widget.establishedDate;
// // //     admissionStartDateController.text=widget.Admission_startdate;
// // //     admissionEndDateController.text=widget.admissionEndDate;
// // //     DiscriptionController.text=widget.Discription;
// // //     courseFeeController.text=widget.courseFee;
// // //     Terms_and_conditions.text=widget.Terms_and_conditions;
// // //     scholarshipFeeController.text=widget.scholarshipFee;
// // //     // Initialize other fields as needed
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         backgroundColor: Colors.white,
// // //         body: SingleChildScrollView(
// // //           padding: const EdgeInsets.all(20),
// // //           child: Form(
// // //             key: _formKey, // Wrap the form fields in a Form widget
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 /// **Header Section**
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Row(
// // //                       children: [
// // //                         Text("Welcome ",
// // //                             style: TextStyle(
// // //                                 fontSize: 24, fontWeight: FontWeight.bold)),
// // //                         Text("Admin,",
// // //                             style: TextStyle(
// // //                                 fontSize: 24,
// // //                                 fontWeight: FontWeight.bold,
// // //                                 color: Color(0xff0A71CB))),
// // //                       ],
// // //                     ),
// // //                     Row(
// // //                       children: [
// // //                         SizedBox(width: 10),
// // //                         CircleAvatar(
// // //                             backgroundColor: Color(0xffD9D9D9),
// // //                             child: Icon(Icons.notification_add)),
// // //                         SizedBox(width: 10),
// // //                         Container(
// // //                           padding: const EdgeInsets.symmetric(
// // //                               horizontal: 14, vertical: 6),
// // //                           decoration: BoxDecoration(
// // //                             color: Colors.white,
// // //                             borderRadius: BorderRadius.circular(20),
// // //                             border: Border.all(width: 0.5, color: Colors.grey),
// // //                           ),
// // //                           child: Row(
// // //                             children: [
// // //                               const CircleAvatar(
// // //                                 radius: 20, // Ensure a proper radius is set
// // //                                 backgroundColor: Colors.grey, // Fallback color
// // //                                 backgroundImage:
// // //                                     AssetImage('assets/Profile/img.png'),
// // //                               ),
// // //                               const SizedBox(width: 10),
// // //                               const Text(
// // //                                 "Admin",
// // //                                 style: TextStyle(
// // //                                     fontSize: 16, fontWeight: FontWeight.bold),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 ),
// // //
// // //                 SizedBox(height: 20),
// // //                 Padding(
// // //                   padding: const EdgeInsets.only(left: 25, right: 25),
// // //                   child: Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Text(
// // //                         "Edit University",
// // //                         style: TextStyle(
// // //                             fontSize: 24, fontWeight: FontWeight.bold),
// // //                       ),
// // //                       SizedBox(width: 20),
// // //                       InkWell(
// // //                         onTap: () {
// // //                           if (_formKey.currentState!.validate()) {
// // //                             // Validate the form
// // //                             University_model student = University_model(
// // //                               Universityid: widget.universityid,
// // //                               Collegename: collegenamectrl.text,
// // //                               collagecode: collegecodectrl.text,
// // //                               Universityname: UniversitynameController.text,
// // //                               Country: selectedCountry ?? "",
// // //                               Admission_enddate:
// // //                                   admissionEndDateController.text,
// // //                               Admission_startdate:
// // //                                   admissionStartDateController.text,
// // //                               Course_offered: selectedCourse ?? "",
// // //                               Degree_offered: selectedDegree ?? "",
// // //                               Description: DiscriptionController.text,
// // //                               Duration: selectedDuration ?? "",
// // //                               Eligibility_criteria: selectedEligibility ?? "",
// // //                               Established_date: establishedDateController.text,
// // //                               Schoolarship_details:
// // //                                   scholarshipFeeController.text,
// // //                               Terms_and_conditions: Terms_and_conditions.text,
// // //                               Tuition_fees: courseFeeController.text,
// // //                               Rank: selectedRank ?? "",
// // //                               highestEducationpercentage:
// // //                                   highestEducationpercentage ?? "",
// // //                               highestEducation: highestEducation ?? "",
// // //                               Englishtestpercentage:
// // //                                   Englishtestpercentage ?? "",
// // //                               Englishtest: Englishtest ?? "",
// // //                               AcadamicTestPercentage:
// // //                                   AcadamicTestPercentage ?? "",
// // //                             );
// // //
// // //                             context.read<UniversityBloc>().add(
// // //                                 University_Edit_Event(University: student));
// // //                           }
// // //                         },
// // //                         borderRadius: BorderRadius.circular(
// // //                             8), // Smooth border effect on tap
// // //                         child: Container(
// // //                           padding:
// // //                               EdgeInsets.symmetric(vertical: 8, horizontal: 36),
// // //                           decoration: BoxDecoration(
// // //                             color: Colors.blue, // Blue background
// // //                             borderRadius:
// // //                                 BorderRadius.circular(8), // Rounded corners
// // //                           ),
// // //                           child: Text(
// // //                             "+Save",
// // //                             style: TextStyle(
// // //                                 fontSize: 18,
// // //                                 color: Colors.white,
// // //                                 fontWeight: FontWeight.bold),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 SizedBox(height: 5),
// // //                 Divider(thickness: 2, color: Colors.grey),
// // //
// // //                 SizedBox(height: 20),
// // //                 buildTextField("University Name",
// // //                     controller: UniversitynameController, validator: (value) {
// // //                   if (value == null || value.isEmpty) {
// // //                     return 'University Name is required';
// // //                   }
// // //                   return null;
// // //                 }),
// // //
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: buildTextField("College Name",
// // //                           controller: collegenamectrl, validator: (value) {
// // //                         if (value == null || value.isEmpty) {
// // //                           return 'College Name is required';
// // //                         }
// // //                         return null;
// // //                       }),
// // //                     ),
// // //                     SizedBox(width: 10),
// // //                     Expanded(
// // //                       child: buildTextField("College Code",
// // //                           controller: collegecodectrl, validator: (value) {
// // //                         if (value == null || value.isEmpty) {
// // //                           return 'College Code is required';
// // //                         }
// // //                         return null;
// // //                       }),
// // //                     ),
// // //                   ],
// // //                 ),
// // //
// // // // Admission Type (Dropdown for Country)
// // //               Row(
// // //                 children: [
// // //                   buildDropdown(
// // //                       "Country",
// // //                       [
// // //                         "United States",
// // //                         "United Kingdom",
// // //                         "New Zealand",
// // //                         "Canada",
// // //                         "Australia",
// // //                         "India"
// // //                       ],
// // //                       selectedCountry, (value) {
// // //                     setState(() => selectedCountry = value);
// // //                   }, required: true),
// // //
// // // // Established Date
// // //                   buildDatePicker("Established Date", establishedDate, (date) {
// // //                     setState(() {
// // //                       establishedDate = date;
// // //                       establishedDateController.text =
// // //                       "${date?.toLocal()}".split(' ')[0]; // Format the date
// // //                     });
// // //                   }, required: true),
// // //                 ],
// // //               ),
// // //
// // //
// // // // Admission Start & End Date
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: buildDatePicker(
// // //                           "Admission Start Date", admissionStartDate, (date) {
// // //                         setState(() {
// // //                           admissionStartDate = date;
// // //                           admissionStartDateController.text =
// // //                               "${date?.toLocal()}"
// // //                                   .split(' ')[0]; // Format the date
// // //                         });
// // //                       }, required: true),
// // //                     ),
// // //                     SizedBox(width: 10),
// // //                     Expanded(
// // //                       child: buildDatePicker(
// // //                           "Admission End Date", admissionEndDate, (date) {
// // //                         setState(() {
// // //                           admissionEndDate = date;
// // //                           admissionEndDateController.text = "${date?.toLocal()}"
// // //                               .split(' ')[0]; // Format the date
// // //                         });
// // //                       }, required: true),
// // //                     ),
// // //                   ],
// // //                 ),
// // //
// // // // Course Details
// // //                 Padding(
// // //                   padding: const EdgeInsets.only(left: 20),
// // //                   child: Text(
// // //                     "Course Details..",
// // //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// // //                   ),
// // //                 ),
// // //
// // // // Degree Type Dropdown
// // //                 buildDropdown("Degree Type", ["Bachelor", "Master", "MBA"],
// // //                     selectedDegree, (value) {
// // //                   setState(() => selectedDegree = value);
// // //                 }, required: true),
// // //
// // // // Course Name Dropdown based on Degree Type
// // //                 if (selectedDegree == "Bachelor") ...[
// // //                     Column(
// // //                       children: [
// // //                         buildDropdown(
// // //                             "Course Name",
// // //                             [
// // //                               "BBA (Bachelor of Business Administration)",
// // //                               "BCom (Bachelor of Commerce)",
// // //                               "BA in Business Management",
// // //                               "BSc in International Business",
// // //                               "BBA in Marketing",
// // //                               "BBA in Finance",
// // //                               "BBA in Human Resource Management",
// // //                               "BBA in Entrepreneurship",
// // //                               "BBA in Supply Chain Management",
// // //                               "BSc in Computer Science",
// // //                               "BSc in Information Technology (IT)",
// // //                               "BTech / BE",
// // //                               "BSc in Data Science",
// // //                               "BSc in AI & Machine Learning",
// // //                               "BSc in Biotechnology",
// // //                               "BSc in Environmental Science",
// // //                               "BA in Political Science",
// // //                               "BA in Sociology",
// // //                               "BA in History",
// // //                               "BA in English Literature",
// // //                               "BA in Journalism & Mass Communication",
// // //                               "BA in Fine Arts",
// // //                               "LLB (Bachelor of Laws)",
// // //                               "BA in Criminology",
// // //                               "BA in Public Administration",
// // //                               "BA in Economics",
// // //                               "BA in International Relations"
// // //                             ],
// // //                             selectedCourse, (value) {
// // //                           setState(() => selectedCourse = value);
// // //                         }, required: true),
// // //                         buildDropdown(
// // //                             "Education Level",
// // //                             ["Grade 12", "Undergraduate diploma"],
// // //                             highestEducation, (value) {
// // //                           setState(() {
// // //                             highestEducation = value;
// // //                             print(highestEducation);
// // //                           });
// // //                         },required: true),
// // //                         buildDropdown(
// // //                             "Minimum Required Percentage ",
// // //                             ["50", "60", "70", "80", "90", "100"],
// // //                             highestEducationpercentage, (value) {
// // //                           setState(() {
// // //                             highestEducationpercentage = value;
// // //                             print(highestEducationpercentage);
// // //                           });
// // //                         },required: true),
// // //                         buildDropdown(
// // //                             "AcademicTest",
// // //                             [
// // //                               "ACT",
// // //                               "SAT",
// // //                               "JEE",
// // //                               "NEET",
// // //                               "CUET",
// // //                               "Not Required",
// // //                             ],
// // //                             AcadamicTest, (value) {
// // //                           setState(() {
// // //                             AcadamicTest = value;
// // //                             print(AcadamicTest);
// // //                           });
// // //                         },required: true),
// // //                         buildDropdown(
// // //                             "AcademicTestPercentage minimum",
// // //                             ["50", "60", "70", "80", "90", "100"],
// // //                             AcadamicTestPercentage, (value) {
// // //                           setState(() {
// // //                             AcadamicTestPercentage = value;
// // //                             print(AcadamicTestPercentage);
// // //                           });
// // //                         }, required: true),
// // //                       ],
// // //                     ),
// // //
// // //                   // buildDropdown(
// // //                   //     "Course Name",
// // //                   //     [
// // //                   //       "BBA (Bachelor of Business Administration)",
// // //                   //       "BCom (Bachelor of Commerce)",
// // //                   //       "BA in Business Management",
// // //                   //       "BSc in International Business",
// // //                   //       "BBA in Marketing",
// // //                   //       "BBA in Finance",
// // //                   //       "BBA in Human Resource Management",
// // //                   //       "BBA in Entrepreneurship",
// // //                   //       "BBA in Supply Chain Management",
// // //                   //       "BSc in Computer Science",
// // //                   //       "BSc in Information Technology (IT)",
// // //                   //       "BTech / BE",
// // //                   //       "BSc in Data Science",
// // //                   //       "BSc in AI & Machine Learning",
// // //                   //       "BSc in Biotechnology",
// // //                   //       "BSc in Environmental Science",
// // //                   //       "BA in Political Science",
// // //                   //       "BA in Sociology",
// // //                   //       "BA in History",
// // //                   //       "BA in English Literature",
// // //                   //       "BA in Journalism & Mass Communication",
// // //                   //       "BA in Fine Arts",
// // //                   //       "LLB (Bachelor of Laws)",
// // //                   //       "BA in Criminology",
// // //                   //       "BA in Public Administration",
// // //                   //       "BA in Economics",
// // //                   //       "BA in International Relations"
// // //                   //
// // //                   //       // Add other courses...
// // //                   //     ],
// // //                   //     selectedCourse, (value) {
// // //                   //   setState(() => selectedCourse = value);
// // //                   // }, required: true),
// // //                   // Add other fields for Bachelor's degree...
// // //                 ] else if (selectedDegree == "Master") ...[
// // //                   buildDropdown(
// // //                       "Course Name",
// // //                       [
// // //                         "MSc in Finance",
// // //                         "MSc in Economics",
// // //                         "MSc in Human Resource Management",
// // //                         "MSc in Marketing",
// // //                         "MSc in Digital Business",
// // //                         "MSc in Project Management",
// // //                         "MSc in Supply Chain & Logistics",
// // //                         "MSc in Computer Science",
// // //                         "MSc in Artificial Intelligence",
// // //                         "MSc in Data Science",
// // //                         "MSc in Cybersecurity",
// // //                         "MSc in Information Technology",
// // //                         "MSc in Biotechnology",
// // //                         "MSc in Physics",
// // //                         "MSc in Chemistry ",
// // //                         "MSc in Mathematics",
// // //                         "MA in Psychology",
// // //                         "MA in Sociology",
// // //                         "MA in Journalism & Mass Communication",
// // //                         "MA in English Literature",
// // //                         "MA in History",
// // //                         "MA in Political Science",
// // //                         "MA in Fine Arts",
// // //                         "LLM (Master of Laws)",
// // //                         "Master in Criminology",
// // //                         "MSc in International Relations",
// // //                         "MSc in Public Policy",
// // //                         "Master in Social Work (MSW)",
// // //                         "MSc in Industrial Engineering"
// // //
// // //                         // Add other courses...
// // //                       ],
// // //                       selectedCourse, (value) {
// // //                     setState(() => selectedCourse = value);
// // //                   }, required: true),
// // //                   // Add other fields for Master's degree...
// // //                 ] else if (selectedDegree == "MBA") ...[
// // //                   buildDropdown(
// // //                       "Course Name",
// // //                       [
// // //                         "General MBA",
// // //                         "MBA in Finance",
// // //                         "MBA in Marketing",
// // //                         "MBA in Human Resource Management",
// // //                         "MBA in International Business",
// // //                         "MBA in Entrepreneurship",
// // //                         "MBA in Business Analytics",
// // //                         "MBA in Supply Chain Management",
// // //                         "MBA in Digital Marketing",
// // //                         "MBA in Operations Management",
// // //                         "MBA in Healthcare Management",
// // //                         "MBA in Hospitality & Tourism Management",
// // //                         "MBA in Retail Management",
// // //                         "MBA in Agribusiness Management",
// // //                         "MBA in Sports Management",
// // //                         "MBA in Luxury Brand Management",
// // //                         "MBA in Real Estate Management",
// // //                         "MBA in Information Technology",
// // //                         "MBA in Data Science",
// // //                         "MBA in Cybersecurity Management",
// // //                         "MBA in AI & Machine Learning",
// // //                         "MBA in Blockchain & FinTech",
// // //                         "Executive MBA (EMBA)"
// // //                         // Add other courses...
// // //                       ],
// // //                       selectedCourse, (value) {
// // //                     setState(() => selectedCourse = value);
// // //                   }, required: true),
// // //                   // Add other fields for MBA...
// // //                 ],
// // //
// // //
// // //
// // //
// // // // Course Duration and Rank
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: buildDropdown(
// // //                           "Course Duration",
// // //                           ["1 Year", "2 Years", "3 Years"],
// // //                           selectedDuration, (value) {
// // //                         setState(() => selectedDuration = value);
// // //                       }, required: true),
// // //                     ),
// // //                     SizedBox(width: 10),
// // //                     Expanded(
// // //                       child: buildDropdown(
// // //                           "Rank", ["Top 10", "Top 50", "Top 100"], selectedRank,
// // //                           (value) {
// // //                         setState(() => selectedRank = value);
// // //                       }, required: true),
// // //                     ),
// // //                   ],
// // //                 ),
// // //
// // // // English Test and Required Percentage
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: buildDropdown(
// // //                           "English Test",
// // //                           ["PTE", "IELTS", "TOEFL", "Not Required"],
// // //                           Englishtest, (value) {
// // //                         setState(() {
// // //                           Englishtest = value;
// // //                         });
// // //                       }, required: true),
// // //                     ),
// // //                     SizedBox(width: 10),
// // //                     Expanded(
// // //                       child: buildDropdown(
// // //                           "Required Percentage",
// // //                           ["50", "60", "70", "80", "90", "100"],
// // //                           Englishtestpercentage, (value) {
// // //                         setState(() {
// // //                           Englishtestpercentage = value;
// // //                         });
// // //                       }, required: true),
// // //                     ),
// // //                   ],
// // //                 ),
// // //
// // // // Description Field
// // //                 Padding(
// // //                   padding:
// // //                       const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
// // //                   child: buildTextField("Description",
// // //                       controller: DiscriptionController,
// // //                       maxLines: 3, validator: (value) {
// // //                     if (value == null || value.isEmpty) {
// // //                       return 'Description is required';
// // //                     }
// // //                     return null;
// // //                   }),
// // //                 ),
// // //
// // // // Terms and Conditions Field
// // //                 Padding(
// // //                   padding:
// // //                       const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
// // //                   child: buildTextField("Terms and Conditions",
// // //                       controller: Terms_and_conditions,
// // //                       maxLines: 3, validator: (value) {
// // //                     if (value == null || value.isEmpty) {
// // //                       return 'Terms and Conditions are required';
// // //                     }
// // //                     return null;
// // //                   }),
// // //                 ),
// // //
// // // // Fee Details
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: buildTextField("Course Fee",
// // //                           controller: courseFeeController, validator: (value) {
// // //                         if (value == null || value.isEmpty) {
// // //                           return "Course Fee cannot be empty";
// // //                         }
// // //                         return null;
// // //                       }),
// // //                     ),
// // //                     SizedBox(width: 20),
// // //                     Expanded(
// // //                       child: buildTextField("Scholarship Fee",
// // //                           controller: scholarshipFeeController,
// // //                           validator: (value) {
// // //                         if (value == null || value.isEmpty) {
// // //                           return "Scholarship Fee cannot be empty";
// // //                         }
// // //                         return null;
// // //                       }),
// // //                     ),
// // //                   ],
// // //                 ),
// // //
// // // // Image Upload Placeholder
// // //                 Row(
// // //                   children: [
// // //                     Image.asset("assets/bro.png",
// // //                         width: 80, height: 80, fit: BoxFit.cover),
// // //                     SizedBox(width: 10),
// // //                     Text("Edit Image"),
// // //                   ],
// // //                 ),
// // //
// // //                 /// **Divider Line**
// // //                 //   SizedBox(height: 5),
// // //                 //   Divider(thickness: 2, color: Colors.grey),
// // //                 //
// // //                 //   SizedBox(height: 20),
// // //                 //   buildTextField("University Name", controller: UniversitynameController, validator: (value) {
// // //                 //     if (value == null || value.isEmpty) {
// // //                 //       return 'Please enter university name';
// // //                 //     }
// // //                 //     return null;
// // //                 //   }),
// // //                 //
// // //                 //   buildDropdown("Country", ["USA", "Canada", "India", "UK"], selectedCountry, (value) {
// // //                 //     setState(() => selectedCountry = value);
// // //                 //   }),
// // //                 //
// // //                 //   /// **Admission Type**
// // //                 //
// // //                 //
// // //                 //   buildDatePicker("Established Date", establishedDate, (date) {
// // //                 //     setState(() => establishedDate = date);
// // //                 //   }),
// // //                 //
// // //                 //   Row(
// // //                 //     children: [
// // //                 //       Expanded(child: buildDatePicker("Admission Start Date", admissionStartDate, (date) => setState(() => admissionStartDate = date))),
// // //                 //       SizedBox(width: 10),
// // //                 //       Expanded(child: buildDatePicker("Admission End Date", admissionEndDate, (date) => setState(() => admissionEndDate = date))),
// // //                 //     ],
// // //                 //   ),
// // //                 //
// // //                 //   buildDropdown("Degree Type", ["Bachelor", "Master", "PhD"], selectedDegree, (value) => setState(() => selectedDegree = value)),
// // //                 //   buildDropdown("Course Name", ["CS", "IT", "Business"], selectedCourse, (value) => setState(() => selectedCourse = value)),
// // //                 //   buildDropdown("Eligibility Criteria", ["IELTS", "TOEFL"], selectedEligibility, (value) => setState(() => selectedEligibility = value)),
// // //                 //
// // //                 //   /// **Image Upload Placeholder**
// // //                 //   Row(
// // //                 //     children: [
// // //                 //       Image.asset("assets/bro.png", width: 80, height: 80, fit: BoxFit.cover),
// // //                 //       SizedBox(width: 10),
// // //                 //       Text("Edit Image"),
// // //                 //     ],
// // //                 //   ),
// // //                 //
// // //                 //   buildTextField("Description", maxLines: 3, initialValue: "The University of Toronto is a public research university...", validator: (value) {
// // //                 //     if (value == null || value.isEmpty) {
// // //                 //       return 'Please enter a description';
// // //                 //     }
// // //                 //     return null;
// // //                 //   }),
// // //                 //
// // //                 //   buildFeeSection("Fee Details"),
// // //                 //   buildFeeSection("Scholarships"),
// // //                 // ],
// // //               ],
// // //             ),
// // //           ),
// // //         ));
// // //   }
// // //
// // //   Widget buildDropdown(String label, List<String> items, String? selectedValue,
// // //       Function(String?) onChanged,
// // //       {required Object required}) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // //       child: DropdownButtonFormField<String>(
// // //         decoration:
// // //             InputDecoration(labelText: label, border: OutlineInputBorder()),
// // //         value: selectedValue,
// // //         items: items
// // //             .map((item) => DropdownMenuItem(value: item, child: Text(item)))
// // //             .toList(),
// // //         onChanged: onChanged,
// // //         validator: (value) {
// // //           if (value == null) {
// // //             return 'Please select a $label';
// // //           }
// // //           return null;
// // //         },
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget buildDatePicker(
// // //       String label, DateTime? selectedDate, Function(DateTime) onDatePicked,
// // //       {required bool required}) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // //       child: InkWell(
// // //         onTap: () async {
// // //           DateTime? picked = await showDatePicker(
// // //             context: context,
// // //             initialDate: DateTime.now(),
// // //             firstDate: DateTime(2000),
// // //             lastDate: DateTime(2100),
// // //           );
// // //           if (picked != null) {
// // //             onDatePicked(picked);
// // //           }
// // //         },
// // //         child: InputDecorator(
// // //           decoration: InputDecoration(
// // //             labelText: label,
// // //             border: OutlineInputBorder(),
// // //           ),
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //             children: [
// // //               Text(selectedDate != null
// // //                   ? "${selectedDate.toLocal()}".split(' ')[0]
// // //                   : "Select Date"),
// // //               Icon(Icons.calendar_today, color: Colors.grey),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget buildFeeSection(String label) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // //       child: Row(
// // //         children: [
// // //           Expanded(
// // //             child: buildTextField(label,
// // //                 keyboardType: TextInputType.number, initialValue: "5000 INR"),
// // //           ),
// // //           SizedBox(width: 10),
// // //           Expanded(
// // //             child: buildTextField("Enter amount",
// // //                 keyboardType: TextInputType.number),
// // //           ),
// // //           SizedBox(width: 10),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget buildTextField(String label,
// // //       {int maxLines = 1,
// // //       TextInputType keyboardType = TextInputType.text,
// // //       String? initialValue,
// // //       TextEditingController? controller,
// // //       String? Function(String?)? validator}) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // //       child: TextFormField(
// // //         maxLines: maxLines,
// // //         keyboardType: keyboardType,
// // //         initialValue: initialValue,
// // //         controller: controller,
// // //         decoration:
// // //             InputDecoration(labelText: label, border: OutlineInputBorder()),
// // //         validator: validator, // Add validator here
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // // import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
// // // // import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
// // // // import 'package:course_connect/Widget/Constands/Loading.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // //
// // // // import '../../../Main/Adminmain.dart';
// // // //
// // // // class EditUniversity extends StatefulWidget {
// // // //   final University_model university;
// // // //   final Universityid;
// // // //
// // // //
// // // //   const EditUniversity({Key? key, required this.university, required this.universityid, required String universityname,}) : super(key: key);
// // // //
// // // //   @override
// // // //   _EditUniversityState createState() => _EditUniversityState();
// // // // }
// // // //
// // // // class _EditUniversityState extends State<EditUniversity> {
// // // //   final _formKey = GlobalKey<FormState>(); // Form key for validation
// // // //   String? selectedCountry;
// // // //   String? selectedDegree;
// // // //   String? selectedCourse;
// // // //   String? selectedDuration;
// // // //   String? selectedEligibility;
// // // //   String? selectedRank;
// // // //
// // // //   DateTime? establishedDate;
// // // //   DateTime? admissionStartDate;
// // // //   DateTime? admissionEndDate;
// // // //
// // // //   // Text editing controllers
// // // //   final TextEditingController establishedDateController = TextEditingController();
// // // //   final TextEditingController admissionStartDateController = TextEditingController();
// // // //   final TextEditingController admissionEndDateController = TextEditingController();
// // // //   final TextEditingController DiscriptionController = TextEditingController();
// // // //   final TextEditingController UniversitynameController = TextEditingController();
// // // //   final TextEditingController Terms_and_conditions = TextEditingController();
// // // //   final TextEditingController courseFeeController = TextEditingController();
// // // //   final TextEditingController scholarshipFeeController = TextEditingController();
// // // //   final TextEditingController collegenamectrl = TextEditingController();
// // // //   final TextEditingController collegecodectrl = TextEditingController();
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     // Initialize controllers with existing university data
// // // //     UniversitynameController.text = widget.university.Universityname!;
// // // //     collegenamectrl.text = widget.university.Collegename!;
// // // //     collegecodectrl.text = widget.university.collagecode!;
// // // //     establishedDateController.text = widget.university.Established_date!;
// // // //     admissionStartDateController.text = widget.university.Admission_startdate!;
// // // //     admissionEndDateController.text = widget.university.Admission_enddate!;
// // // //     DiscriptionController.text = widget.university.Description!;
// // // //     Terms_and_conditions.text = widget.university.Terms_and_conditions!;
// // // //     courseFeeController.text = widget.university.Tuition_fees!;
// // // //     scholarshipFeeController.text = widget.university.Schoolarship_details!;
// // // //
// // // //     selectedCountry = widget.university.Country;
// // // //     selectedDegree = widget.university.Degree_offered;
// // // //     selectedCourse = widget.university.Course_offered;
// // // //     selectedDuration = widget.university.Duration;
// // // //     selectedRank = widget.university.Rank;
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(20),
// // // //         child: Form(
// // // //           key: _formKey, // Wrap the form fields in a Form widget
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               /// **Header Section**
// // // //               Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   Row(
// // // //                     children: [
// // // //                       Text("Welcome ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // // //                       Text("Admin,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff0A71CB))),
// // // //                     ],
// // // //                   ),
// // // //                   Row(
// // // //                     children: [
// // // //                       SizedBox(width: 10),
// // // //                       CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
// // // //                       SizedBox(width: 10),
// // // //                       Container(
// // // //                         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
// // // //                         decoration: BoxDecoration(
// // // //                           color: Colors.white,
// // // //                           borderRadius: BorderRadius.circular(20),
// // // //                           border: Border.all(width: 0.5, color: Colors.grey),
// // // //                         ),
// // // //                         child: Row(
// // // //                           children: [
// // // //                             const CircleAvatar(
// // // //                               radius: 20, // Ensure a proper radius is set
// // // //                               backgroundColor: Colors.grey, // Fallback color
// // // //                               backgroundImage: AssetImage('assets/Profile/img.png'),
// // // //                             ),
// // // //                             const SizedBox(width: 10),
// // // //                             const Text(
// // // //                               "Admin",
// // // //                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //
// // // //               SizedBox(height: 20),
// // // //               Padding(
// // // //                 padding: const EdgeInsets.only(left: 25, right: 25),
// // // //                 child: Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Text(
// // // //                       "Edit University",
// // // //                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // // //                     ),
// // // //                     SizedBox(width: 20),
// // // //                     InkWell(
// // // //                       onTap: () {
// // // //                         if (_formKey.currentState!.validate()) { // Validate the form
// // // //                           University_model university = University_model(
// // // //                             Universityid: widget.university.Universityid,
// // // //                             Universityname: UniversitynameController.text,
// // // //                             Country: selectedCountry ?? "",
// // // //                             Admission_enddate: admissionEndDateController.text,
// // // //                             Admission_startdate: admissionStartDateController.text,
// // // //                             Course_offered: selectedCourse ?? "",
// // // //                             Degree_offered: selectedDegree ?? "",
// // // //                             Description: DiscriptionController.text,
// // // //                             Duration: selectedDuration ?? "",
// // // //                             Eligibility_criteria: selectedEligibility ?? "",
// // // //                             Established_date: establishedDateController.text,
// // // //                             Schoolarship_details: scholarshipFeeController.text,
// // // //                             Terms_and_conditions: Terms_and_conditions.text,
// // // //                             Tuition_fees: courseFeeController.text,
// // // //                             Rank: selectedRank ?? "",
// // // //                           );
// // // //
// // // //                           context.read<UniversityBloc>().add(University_Edit_Event(University: university));
// // // //                         }
// // // //                       },
// // // //                       borderRadius: BorderRadius.circular(8), // Smooth border effect on tap
// // // //                       child: Container(
// // // //                         padding: EdgeInsets.symmetric(vertical: 8, horizontal: 36),
// // // //                         decoration: BoxDecoration(
// // // //                           color: Colors.blue, // Blue background
// // // //                           borderRadius: BorderRadius.circular(8), // Rounded corners
// // // //                         ),
// // // //                         child: Text(
// // // //                           "+Save",
// // // //                           style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //
// // // //               /// **Divider Line**
// // // //               SizedBox(height: 5),
// // // //               Divider(thickness: 2, color: Colors.grey),
// // // //
// // // //               SizedBox(height: 20),
// // // //               buildTextField("University Name", controller: UniversitynameController, validator: (value) {
// // // //                 if (value == null || value.isEmpty) {
// // // //                   return 'Please enter university name';
// // // //                 }
// // // //                 return null;
// // // //               }),
// // // //
// // // //               buildDropdown("Country", ["USA", "Canada", "India", "UK"], selectedCountry, (value) {
// // // //                 setState(() => selectedCountry = value);
// // // //               }),
// // // //
// // // //               /// **Admission Type**
// // // //               // Text("Admission Type:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
// // // //               // Row(
// // // //               //   children: [
// // // //               //     Radio(
// // // //               //       value: "Public",
// // // //               //       groupValue: admissionType,
// // // //               //       onChanged: (value) => setState(() => admissionType = value.toString()),
// // // //               //     ),
// // // //               //     Text("Public"),
// // // //               //     SizedBox(width: 20),
// // // //               //     Radio(
// // // //               //       value: "Private",
// // // //               //       groupValue: admissionType,
// // // //               //       onChanged: (value) => setState(() => admissionType = value.toString()),
// // // //               //     ),
// // // //               //     Text("Private"),
// // // //               //   ],
// // // //               // ),
// // // //
// // // //               buildDatePicker("Established Date", establishedDate, (date) {
// // // //                 setState(() => establishedDate = date);
// // // //               }),
// // // //
// // // //               Row(
// // // //                 children: [
// // // //                   Expanded(child: buildDatePicker("Admission Start Date", admissionStartDate, (date) => setState(() => admissionStartDate = date))),
// // // //                   SizedBox(width: 10),
// // // //                   Expanded(child: buildDatePicker("Admission End Date", admissionEndDate, (date) => setState(() => admissionEndDate = date))),
// // // //                 ],
// // // //               ),
// // // //
// // // //               buildDropdown("Degree Type", ["Bachelor", "Master", "PhD"], selectedDegree, (value) => setState(() => selectedDegree = value)),
// // // //               buildDropdown("Course Name", ["CS", "IT", "Business"], selectedCourse, (value) => setState(() => selectedCourse = value)),
// // // //               buildDropdown("Eligibility Criteria", ["IELTS", "TOEFL"], selectedEligibility, (value) => setState(() => selectedEligibility = value)),
// // // //
// // // //               /// **Image Upload Placeholder**
// // // //               Row(
// // // //                 children: [
// // // //                   Image.asset("assets/bro.png", width: 80, height: 80, fit: BoxFit.cover),
// // // //                   SizedBox(width: 10),
// // // //                   Text("Edit Image"),
// // // //                 ],
// // // //               ),
// // // //
// // // //               buildTextField("Description", maxLines: 3, controller: DiscriptionController, validator: (value) {
// // // //                 if (value == null || value.isEmpty) {
// // // //                   return 'Please enter a description';
// // // //                 }
// // // //                 return null;
// // // //               }),
// // // //
// // // //               buildFeeSection("Fee Details"),
// // // //               buildFeeSection("Scholarships"),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget buildDropdown(String label, List<String> items, String? selectedValue, Function(String?) onChanged) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // // //       child: DropdownButtonFormField<String>(
// // // //         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
// // // //         value: selectedValue,
// // // //         items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
// // // //         onChanged: onChanged,
// // // //         validator: (value) {
// // // //           if (value == null) {
// // // //             return 'Please select a $label';
// // // //           }
// // // //           return null;
// // // //         },
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget buildDatePicker(String label, DateTime? selectedDate, Function(DateTime) onDatePicked) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // // //       child: InkWell(
// // // //         onTap: () async {
// // // //           DateTime? picked = await showDatePicker(
// // // //             context: context,
// // // //             initialDate: DateTime.now(),
// // // //             firstDate: DateTime(2000),
// // // //             lastDate: DateTime(2100),
// // // //           );
// // // //           if (picked != null) {
// // // //             onDatePicked(picked);
// // // //           }
// // // //         },
// // // //         child: InputDecorator(
// // // //           decoration: InputDecoration(
// // // //             labelText: label,
// // // //             border: OutlineInputBorder(),
// // // //           ),
// // // //           child: Row(
// // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //             children: [
// // // //               Text(selectedDate != null ? "${selectedDate.toLocal()}".split(' ')[0] : "Select Date"),
// // // //               Icon(Icons.calendar_today, color: Colors.grey),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget buildFeeSection(String label) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // // //       child: Row(
// // // //         children: [
// // // //           Expanded(
// // // //             child: buildTextField(label, keyboardType: TextInputType.number, initialValue: "5000 INR"),
// // // //           ),
// // // //           SizedBox(width: 10),
// // // //           Expanded(
// // // //             child: buildTextField("Enter amount", keyboardType: TextInputType.number),
// // // //           ),
// // // //           SizedBox(width: 10),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget buildTextField(String label, {int maxLines = 1, TextInputType keyboardType = TextInputType.text, String? initialValue, TextEditingController? controller, String? Function(String?)? validator}) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 8),
// // // //       child: TextFormField(
// // // //         maxLines: maxLines,
// // // //         keyboardType: keyboardType,
// // // //         initialValue: initialValue,
// // // //         controller: controller,
// // // //         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
// // // //         validator: validator, // Add validator here
// // // //       ),
// // // //     );
// // // //   }
// // // // }
