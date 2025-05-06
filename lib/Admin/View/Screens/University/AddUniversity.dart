import 'package:course_connect/Controller/Bloc/University_block/University_model/University_model.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Controller/Bloc/Dropdown_university/CollagemasterBloc/collagedropdown_bloc.dart';
import '../../../../Controller/Bloc/Dropdown_university/dropdown_bloc.dart';
import '../../../../Controller/Bloc/University_block/University_model/Universitycollage.dart';
import '../../../Main/Adminmain.dart';

class Fetchcolladropdowrapper extends StatefulWidget {
  const Fetchcolladropdowrapper({super.key});

  @override
  State<Fetchcolladropdowrapper> createState() =>
      _FetchcolladropdowrapperState();
}

class _FetchcolladropdowrapperState extends State<Fetchcolladropdowrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DropdownBloc>(
      create: (context) => DropdownBloc()..add(Fetchcatcollagebydropdown()),
      child: AddUniversity(),
    );
  }
}

class AddUniversity extends StatefulWidget {
  @override
  _AddUniversityState createState() => _AddUniversityState();
}

class _AddUniversityState extends State<AddUniversity> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  String? selectedDegree;
  String? selectedCourse;
  String? selectedDuration;
  String? selectedEligibility;

  // education
  String? highestEducation;
  // for dropdown selection
  String? highestEducationpercentage; // for selected percentage (as String)
  double? highestEducationPercentageValue; // parsed float value

  String? AcadamicTest;
  String? AcadamicTestPercentage;
  double? AcadamicTestPercentageValue;

  // common
  String? Englishtest;
  String?
  Englishtestpercentage; // for dropdown selection (continue keeping this for UI)
  double? EnglishtestpercentageValue;
  // new variable to store double value

  final TextEditingController DiscriptionController = TextEditingController();

  final TextEditingController Terms_and_conditions = TextEditingController();
  final TextEditingController courseFeeController = TextEditingController();
  final TextEditingController scholarshipFeeController =
  TextEditingController();
  final Map<String, List<String>> testScoreRanges = {
    "ACT": ["20"],
    // List.generate(36, (i) => "${i + 1}"),          // 1 to 36
    "SAT": [
      "1000",
    ], // Valid SAT milestones
    "CUET": [
      "250",
    ],
    // List.generate(17, (i) => "${i * 50}"),        // 0 to 800 in steps of 50
    "TEST NOT TAKEN": [],
  };
  Map<String, List<String>> testWiseScoreRange = {
    "GRE": ["290"],
    "GMAT": ["500"],
    "IIT JAM": ["50"],
    "TEST NOT TAKEN": ["N/A", "N/A", "N/A", "N/A", "N/A", "N/A"],
  };

  Map<String, List<String>> englishTestScoreRange = {
    "PTE": [
      "50",
    ],
    "IELTS": ["5.5"],
    "TOEFL": ["70"],
    "Not Required": ["N/A"],
  };
  Map<String, List<String>> testScoreRanges2 = {
    "GRE": ["290"], // 260 to 340
    "GMAT": ["500"], // 200 to 800
    "IIT JAM": [
      "30",
    ],
    "CAT": ["80"],
    "CMAT": ["200"],
    "TEST NOT TAKEN": [],
  };
  Map<String, List<String>> educationScoreRanges = {
    "Grade 12": [
      "50.0",
      "60.0",
    ],
    "Undergraduate diploma": [
      "50",
      "60",
    ],
  };
  Map<String, List<String>> educationScoreRanges2 = {
    "Undergraduate Degree": [
      "50",
      "60",
    ],
    "Undergraduate Diploma": [
      "50",
      "60",
    ],
    "Postgraduate Degree": ["60"],
    "Postgraduate Diploma": ["60"],
  };

  // String university_image = '1';
  bool isImageMissing = false; // Define at the top of your state class

  String? Nearbycollage;

  late Collagemodel college;

  bool isDropdownOpen = false;
  bool isDropdownBoardOpen = false;

  List<String> selectedScheme = [];
  List<String> selectedBoards = [];

  final List<String> countries = [
    "Science",
    "Commerce",
    "Humanities",
    "VHSC",
  ];
  final List<String> Boards = ['IB', 'ICSE', 'CBSC', 'State'];

  // Flag to track if college is selected
  bool isCollegeSelected = false;

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
                            Text(
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
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminPage();
                      },
                    ));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("University added successfully!"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      ),
                    );
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
                            // First validate the form
                            if (_formKey.currentState!.validate()) {
                              // Additional validation for required fields not covered by validators
                              if (!isCollegeSelected) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please select a college"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              // if (selectedScheme.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //           "Please select at least one scheme"),
                              //       backgroundColor: Colors.red,
                              //     ),
                              //   );
                              //   return;
                              // }

                              // if (selectedBoards.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //           "Please select at least one board"),
                              //       backgroundColor: Colors.red,
                              //     ),
                              //   );
                              //   return;
                              // }

                              // If all validations pass, proceed with form submission
                              University_model university = University_model(
                                  UniversityimageURL: college
                                      .UniversityimageURL ??
                                      "https://firebasestorage.googleapis.com/v0/b/courseconnectai.firebasestorage.app/o/universitydummy%2F360_F_110530499_pjM3zKDTmbwdsUbduglVzAsl4HGVUzDA.jpg?alt=media&token=631596e2-7e4f-4bf1-ad30-9a2c8193f6ac",
                                  Country: college.Country,
                                  Admission_enddate: college.Admission_enddate,
                                  Admission_startdate:
                                  college.Admission_startdate,
                                  Course_offered: selectedCourse,
                                  Degree_offered: selectedDegree,
                                  Description: DiscriptionController.text,
                                  Duration: selectedDuration,
                                  Eligibility_criteria: selectedEligibility,
                                  Established_date: college.Established_date,
                                  Schoolarship_details:
                                  scholarshipFeeController.text,
                                  Terms_and_conditions:
                                  Terms_and_conditions.text,
                                  Tuition_fees: courseFeeController.text,
                                  Universityname: college.Universityname,
                                  Rank: college.Rank,
                                  highestEducationpercentage:
                                  highestEducationPercentageValue,
                                  highestEducation: highestEducation,
                                  Englishtestpercentage:
                                  EnglishtestpercentageValue,
                                  Englishtest: Englishtest,
                                  AcadamicTestPercentage:
                                  AcadamicTestPercentageValue,
                                  AcadamicTest: AcadamicTest,
                                  Collegename: college.Collegename,
                                  collagecode: college.collagecode,
                                  Selectedboard: selectedBoards,
                                  SelectedScheme: selectedScheme);
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
                            child: state is UniversityLoading
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

              // Admission Start & End Date in the Same Row
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: BlocProvider<DropdownBloc>(
                  create: (context) =>
                  DropdownBloc()..add(Fetchcatcollagebydropdown()),
                  child: BlocConsumer<DropdownBloc, DropdownState>(
                    listener: (context, state) {
                      if (state is Fetchcatcollagebydropdown) {}
                    },
                    builder: (context, state) {
                      if (state is fetchcollagedropdownloading) {
                        return Loading_Widget();
                      } else if (state is CollageLoadedDOMAIN) {
                        return FormField<String>(
                          validator: (value) {
                            if (Nearbycollage == null) {
                              return 'Please select a college';
                            }
                            return null;
                          },
                          builder: (FormFieldState<String> field) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: field.hasError
                                            ? Colors.red
                                            : Colors.grey,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text("Select College"),
                                      value: Nearbycollage,
                                      isExpanded: true,
                                      items: state.catogory.map((domain) {
                                        return DropdownMenuItem<String>(
                                          value: domain,
                                          child: Text(domain),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          Nearbycollage = newValue;
                                          isCollegeSelected = true;
                                          field.didChange(newValue);
                                          context
                                              .read<CollagedropdownBloc>()
                                              .add(FetchCollegeDetailsByName(
                                              newValue!));
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                if (field.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, top: 8.0),
                                    child: Text(
                                      field.errorText!,
                                      style: TextStyle(
                                          color: Colors.red[700], fontSize: 12),
                                    ),
                                  ),
                              ],
                            );
                          },
                        );
                      } else if (state is FetchcatogotyError) {
                        return Text('Error: ${state.msg}');
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: BlocConsumer<CollagedropdownBloc, CollagedropdownState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is fetchcollagedropdownloading) {
                      return Loading_Widget();
                    }
                    if (state is CollageFullDataLoaded) {
                      college = state.college;
                      return Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("College Name: ${college.Collegename}"),
                              Text("University: ${college.Universityname}"),
                              Text("Rank: ${college.Rank}"),
                              Text("Country: ${college.Country}"),
                              Text("Established: ${college.Established_date}"),
                              Text(
                                  "Admission Start: ${college.Admission_startdate}"),
                              Text(
                                  "Admission End: ${college.Admission_enddate}"),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          if (college.UniversityimageURL != null)
                            Image.network(
                              college.UniversityimageURL!,
                              width: 300,
                              height: 200,
                              fit: BoxFit.fill,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                        null
                                        ? loadingProgress
                                        .cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image,
                                    size: 100, color: Colors.grey);
                              },
                            ),
                        ],
                      );
                    } else if (state is FetchcatogotyError) {
                      return Text('Error: ${state}');
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Course Details..",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),

              // Dropdown for Degree Type
              buildDropdown(
                  "Degree Type",
                  [
                    "Bachelors",
                    "Masters",
                  ],
                  selectedDegree, (value) {
                setState(() {
                  selectedDegree = value;
                  // Reset dependent fields when degree changes
                  selectedCourse = null;
                  highestEducation = null;
                  highestEducationpercentage = null;
                  AcadamicTest = null;
                  AcadamicTestPercentage = null;
                });
              }, required: true),

              // Dropdown for Bachelor's Courses
              if (selectedDegree == "Bachelors")
                Column(
                  children: [
                    buildDropdown(
                        "Course Name",
                        [
                          "BSc in Mathematics",
                          "BSc in Physics",
                          "BSc in Chemistry",
                          "BSc in Statistics",
                          "BSc in Computer Applications (BCA)",
                          "BSc in Cybersecurity",
                          "BSc in Software Engineering",
                          "BSc in Game Design and Development",
                          "BSc in Robotics",
                          "BSc in Geology",
                          "BSc in Forensic Science",
                          "BSc in Food Science & Nutrition",

                          "Bachelor of Economics (BEcon)",
                          "Bachelor of Accounting",
                          "Bachelor of Business Analytics",
                          "Bachelor of Financial Markets",
                          "Bachelor of International Business and Economics",

                          "BA in Psychology",
                          "BA in Anthropology",
                          "BA in Philosophy",
                          "BA in Linguistics",
                          "BA in Gender Studies",
                          "BA in Cultural Studies",

                          "BA in Animation and VFX",
                          "BA in Film & Media Studies",
                          "BA in Graphic Design",
                          "BA in Digital Media",

                          "BSc in Microbiology",
                          "BSc in Genetics",
                          "BSc in Zoology",
                          "BSc in Agriculture",
                          "BSc in Nursing",

                          "BA in Development Studies",
                          "BA in Global Studies",
                          "BA in Peace and Conflict Studies"
                        ],

                        selectedCourse, (value) {
                      setState(() => selectedCourse = value);
                    }, required: true),
                    buildDropdown(
                      "Education Level",
                      ["Grade 12", "Polytechnique Diploma"],
                      highestEducation,
                          (value) {
                        setState(() {
                          highestEducation = value;
                          highestEducationpercentage = null;
                          highestEducationPercentageValue =
                          null; // Also reset float
                          print(highestEducation);
                        });
                      },
                      required: true,
                    ),
                    if (highestEducation != null)
                      buildDropdown(
                        "Minimum Required Percentage",
                        educationScoreRanges[highestEducation] ?? [],
                        highestEducationpercentage,
                            (value) {
                          setState(() {
                            highestEducationpercentage = value;
                            if (value != null) {
                              highestEducationPercentageValue =
                                  double.tryParse(value);
                              print(
                                  "Float value: $highestEducationPercentageValue");
                            }
                          });
                        },
                        required: true,
                      ),
                    buildDropdown(
                      "Academic Test",
                      ["ACT", "SAT", "CUET", "TEST NOT TAKEN"],
                      AcadamicTest,
                          (value) {
                        setState(() {
                          AcadamicTest = value;
                          AcadamicTestPercentage = null; // Reset on test change
                          print("Selected Test: $AcadamicTest");
                        });
                      },
                      required: true,
                    ),
                    if (AcadamicTest != null &&
                        AcadamicTest != "TEST NOT TAKEN")
                      buildDropdown(
                          "Minimum Required Score",
                          testScoreRanges[AcadamicTest] ?? [],
                          AcadamicTestPercentage, (value) {
                        setState(() {
                          AcadamicTestPercentage = value;

                          // Parse float from range string
                          if (value != null) {
                            if (value.contains("-")) {
                              AcadamicTestPercentageValue =
                                  double.tryParse(value.split("-").first);
                            } else {
                              AcadamicTestPercentageValue =
                                  double.tryParse(value);
                            }
                          }

                          print("Selected Score: $AcadamicTestPercentage");
                          print("Parsed Float: $AcadamicTestPercentageValue");
                        });
                      }, required: true),
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
                          "MSc in Chemistry",
                          "MSc in Mathematics",
                          "MA in Psychology",
                          "MA in Sociology",
                          "MA in Journalism & Mass Communication",
                          "MA in English Literature",
                          "MA in History",
                          "MA in Political Science",
                          "MA in Fine Arts",
                          "Master in Criminology",
                          "MSc in International Relations",
                          "MSc in Public Policy",
                          "Master in Social Work (MSW)",
                          "MSc in Industrial Engineering",
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
                      setState(() => selectedCourse = value);
                    }, required: true),
                    buildDropdown(
                      "Education Level",
                      [
                        "Undergraduate Degree",
                        // "Undergraduate Diploma",
                        // "Postgraduate Degree",
                        // "Postgraduate Diploma",
                      ],
                      highestEducation,
                          (value) {
                        setState(() {
                          highestEducation = value;
                          highestEducationpercentage = null;
                          highestEducationPercentageValue =
                          null; // Also reset float
                          print(highestEducation);
                        });
                      },
                      required: true,
                    ),
                    if (highestEducation != null)
                      buildDropdown(
                        "Minimum Required Percentage",
                        educationScoreRanges2[highestEducation] ?? [],
                        highestEducationpercentage,
                            (value) {
                          setState(() {
                            highestEducationpercentage = value;
                            if (value != null) {
                              highestEducationPercentageValue =
                                  double.tryParse(value);
                              print(
                                  "Float value: $highestEducationPercentageValue");
                            }
                          });
                        },
                        required: true,
                      ),
                    buildDropdown(
                      "Academic Test",
                      [
                        "GRE",
                        "GMAT",
                        "IIT JAM",
                        "CAT",
                        "CMAT",
                        "TEST NOT TAKEN"
                      ],
                      AcadamicTest,
                          (value) {
                        setState(() {
                          AcadamicTest = value;
                          AcadamicTestPercentage = null; // Reset on test change
                          print(AcadamicTest);
                        });
                      },
                      required: true,
                    ),
                    if (AcadamicTest != null &&
                        AcadamicTest != "TEST NOT TAKEN")
                      buildDropdown(
                          "Academic Test Score Minimum",
                          testScoreRanges2[AcadamicTest] ?? [],
                          AcadamicTestPercentage, (value) {
                        setState(() {
                          AcadamicTestPercentage = value;

                          // Parse float from range string
                          if (value != null) {
                            if (value.contains("-")) {
                              AcadamicTestPercentageValue =
                                  double.tryParse(value.split("-").first);
                            } else {
                              AcadamicTestPercentageValue =
                                  double.tryParse(value);
                            }
                          }

                          print("Selected Score: $AcadamicTestPercentage");
                          print("Parsed Float: $AcadamicTestPercentageValue");
                        });
                      }, required: true),
                  ],
                ),

              Column(
                children: [
                  // First Row (Course Duration and QS Rank)
                  Row(
                    children: [
                      // First Dropdown (Course Duration)
                      Expanded(
                        child: buildDropdown(
                          "Course Duration",
                          [
                            "1 Year",
                            "2 Years",
                            "3 Years",
                            "4 Years",
                            "5 Years"
                          ],
                          selectedDuration,
                              (value) {
                            setState(() => selectedDuration = value);
                          },
                          required: true,
                        ),
                      ),
                      const SizedBox(
                          width: 15), // Same width as the second row's space

                      // Second Field (QS Rank)
                    ],
                  ),

                  SizedBox(height: 15), // Add a small space between rows

                  // Second Row (English Test and Required Percentage)
                  Row(
                    children: [
                      // English Test Dropdown
                      Expanded(
                        child: buildDropdown(
                          "English Test",
                          englishTestScoreRange.keys.toList(),
                          Englishtest,
                              (value) {
                            setState(() {
                              Englishtest = value;

                              if (value != null) {
                                Englishtestpercentage =
                                    englishTestScoreRange[value]!.first;

                                // Parse double value based on first item
                                if (Englishtestpercentage != null) {
                                  if (Englishtestpercentage!.contains("-")) {
                                    // If it's a range like "40-50", take the first value
                                    EnglishtestpercentageValue =
                                        double.tryParse(Englishtestpercentage!
                                            .split("-")
                                            .first);
                                  } else {
                                    EnglishtestpercentageValue =
                                        double.tryParse(Englishtestpercentage!);
                                  }
                                }

                                print("Selected English test: $Englishtest");
                                print(
                                    "Selected String value: $Englishtestpercentage");
                                print(
                                    "Parsed double value: $EnglishtestpercentageValue");
                              }
                            });
                          },
                          required: true,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // Show "Required Percentage" only if English Test is not "Not Required"
                      if (Englishtest != "Not Required")
                        Expanded(
                          child: buildDropdown(
                            "Minimum Required Percentage",
                            englishTestScoreRange[Englishtest] ??
                                ["N/A"], // fallback to ["N/A"]
                            Englishtestpercentage,
                                (value) {
                              setState(() {
                                Englishtestpercentage = value;

                                if (value != null) {
                                  if (value.contains("-")) {
                                    // If it's a range, take the first value
                                    EnglishtestpercentageValue =
                                        double.tryParse(value.split("-").first);
                                  } else {
                                    EnglishtestpercentageValue =
                                        double.tryParse(value);
                                  }
                                }

                                print(
                                    "Updated String value: $Englishtestpercentage");
                                print(
                                    "Updated Parsed double value: $EnglishtestpercentageValue");
                              });
                            },
                            required: true,
                          ),
                        )
                    ],
                  )
                ],
              ),
              if (highestEducation == "Grade 12") ...[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "choose  scheme..",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      /// Selected countries shown as chips
                      if (selectedScheme.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: selectedScheme.map((country) {
                            return Chip(
                              label: Text(country),
                              deleteIcon: Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                              onDeleted: () {
                                setState(() {
                                  selectedScheme.remove(country);
                                });
                              },
                            );
                          }).toList(),
                        ),

                      SizedBox(height: 20),

                      if(highestEducation == "Grade 12")
                      FormField<List<String>>(
                        validator: (value) {
                          if (selectedScheme.isEmpty) {
                            return 'Please select at least one scheme';
                          }
                          return null;
                        },


                        builder: (FormFieldState<List<String>> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDropdownOpen = !isDropdownOpen;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: field.hasError
                                            ? Colors.red
                                            : Colors.grey),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /// Header Row
                                      Row(
                                        children: [
                                          Icon(Icons.golf_course,
                                              color: Colors.black),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              selectedScheme.isEmpty
                                                  ? "Select Schemes"
                                                  : selectedScheme.join(", "),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),

                                      /// Dropdown List
                                      if (isDropdownOpen)
                                        Column(
                                          children: countries.map((country) {
                                            return CheckboxListTile(
                                              title: Text(country),
                                              value: selectedScheme
                                                  .contains(country),
                                              onChanged: (bool? selected) {
                                                setState(() {
                                                  if (selected == true) {
                                                    if (!selectedScheme
                                                        .contains(country)) {
                                                      selectedScheme.add(country);
                                                    }
                                                  } else {
                                                    selectedScheme
                                                        .remove(country);
                                                  }
                                                  field.didChange(selectedScheme);
                                                });
                                              },
                                            );
                                          }).toList(),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (field.hasError)
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 12.0, top: 8.0),
                                  child: Text(
                                    field.errorText!,
                                    style: TextStyle(
                                        color: Colors.red[700], fontSize: 12),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Choose Board..",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      /// Selected boards shown as chips
                      if (selectedBoards.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: selectedBoards.map((board) {
                            return Chip(
                              label: Text(board),
                              deleteIcon: Icon(Icons.close),
                              onDeleted: () {
                                setState(() {
                                  selectedBoards.remove(board);
                                });
                              },
                            );
                          }).toList(),
                        ),

                      SizedBox(height: 20),

                      /// Dropdown container
                      FormField<List<String>>(
                        validator: (value) {
                          if (selectedBoards.isEmpty) {
                            return 'Please select at least one board';
                          }
                          return null;
                        },
                        builder: (FormFieldState<List<String>> field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDropdownBoardOpen = !isDropdownBoardOpen;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: field.hasError
                                            ? Colors.red
                                            : Colors.grey),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /// Header Row
                                      Row(
                                        children: [
                                          Icon(Icons.bookmark_add,
                                              color: Colors.black),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              selectedBoards.isEmpty
                                                  ? "Select Boards"
                                                  : selectedBoards.join(", "),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black54),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down)
                                        ],
                                      ),

                                      /// Dropdown List
                                      if (isDropdownBoardOpen)
                                        Column(
                                          children: Boards.map((board) {
                                            return CheckboxListTile(
                                              title: Text(board),
                                              value:
                                              selectedBoards.contains(board),
                                              onChanged: (bool? selected) {
                                                setState(() {
                                                  if (selected == true) {
                                                    if (!selectedBoards
                                                        .contains(board)) {
                                                      selectedBoards.add(board);
                                                    }
                                                  } else {
                                                    selectedBoards.remove(board);
                                                  }
                                                  field.didChange(selectedBoards);
                                                });
                                              },
                                            );
                                          }).toList(),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (field.hasError)
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 12.0, top: 8.0),
                                  child: Text(
                                    field.errorText!,
                                    style: TextStyle(
                                        color: Colors.red[700], fontSize: 12),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],

              SizedBox(height: 10),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: TextFormField(
                  controller: DiscriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: "Description", border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Terms and conditions are required';
                    }
                    return null;
                  },
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Course Fee",
                          prefixText: "\$ ",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Course fee is required";
                          }
                          if (double.tryParse(value) == null) {
                            return "Please enter a valid number";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: scholarshipFeeController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Scholarship Fee",
                          prefixText: "\$ ",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Scholarship fee is required";
                          }
                          if (double.tryParse(value) == null) {
                            return "Please enter a valid number";
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