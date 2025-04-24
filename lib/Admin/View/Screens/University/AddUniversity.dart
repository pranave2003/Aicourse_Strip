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
  String? highestEducationpercentage;

  String? AcadamicTest;
  String? AcadamicTestPercentage;

  // common
  String? Englishtest;
  String? Englishtestpercentage;

  final TextEditingController DiscriptionController = TextEditingController();

  final TextEditingController Terms_and_conditions = TextEditingController();
  final TextEditingController courseFeeController = TextEditingController();
  final TextEditingController scholarshipFeeController =
      TextEditingController();
  final Map<String, List<String>> testScoreRanges = {
    "ACT": List.generate(36, (i) => "${i + 1}"),          // 1 to 36
    "SAT": ["400", "600", "800", "1000", "1200", "1400", "1600"], // Valid SAT milestones
    "CUET": List.generate(17, (i) => "${i * 50}"),        // 0 to 800 in steps of 50
    "TEST NOT TAKEN": [],
  };
  Map<String, List<String>> testWiseScoreRange = {
    "GRE": ["260-290", "290-310", "310-320", "320-330", "330-340", "340"],
    "GMAT": ["480-500", "500-540", "540-600", "600-650", "650-700", "700-750", "750-800"],
    "IIT JAM": ["50-55", "55-60", "60-65", "65-70", "70-75", "75-80"],
    "TEST NOT TAKEN": ["N/A", "N/A", "N/A", "N/A", "N/A", "N/A"],
  };

  Map<String, List<String>> englishTestScoreRange = {
    "PTE": ["30-40", "40-50", "50-58", "58-65", "65-75", "75-90"],
    "IELTS": ["4.0", "4.5", "5.0", "5.5", "6.0", "6.5", "7.0", "7.5", "8.0", "9.0"],
    "TOEFL": ["40-50", "50-60", "60-70", "70-80", "80-90", "90-100", "100-120"],
    "Not Required": ["N/A"],
  };


  // String university_image = '1';
  bool isImageMissing = false; // Define at the top of your state class

  String? Nearbycollage;

  late Collagemodel college;

  bool isDropdownOpen = false;
  bool isDropdownBoardOpen = false;

  List<String> selectedCountries = [];
  List<String> selectedBoards = [];

  final List<String> countries = [
    "Science",
    "Commerce",
    "Humanities",
    "VHSC",
  ];
  final List<String> Boards = ['IB', 'ICSE', 'CBSC', 'State'];

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
                            if (_formKey.currentState!.validate()) {
                              {
                                University_model university = University_model(
                                    UniversityimageURL: college
                                            .UniversityimageURL ??
                                        "https://firebasestorage.googleapis.com/v0/b/courseconnectai.firebasestorage.app/o/universitydummy%2F360_F_110530499_pjM3zKDTmbwdsUbduglVzAsl4HGVUzDA.jpg?alt=media&token=631596e2-7e4f-4bf1-ad30-9a2c8193f6ac",
                                    Country: college.Country,
                                    Admission_enddate:
                                        college.Admission_enddate,
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
                                        highestEducationpercentage,
                                    highestEducation: highestEducation,
                                    Englishtestpercentage:
                                        Englishtestpercentage,
                                    Englishtest: Englishtest,
                                    AcadamicTestPercentage:
                                        AcadamicTestPercentage,
                                    AcadamicTest: AcadamicTest,
                                    Collegename: college.Collegename,
                                    collagecode: college.collagecode);
                                context.read<UniversityBloc>().add(
                                    University_Add_Event(
                                        University: university));
                              }
                            }

                            // Proceed with the rest of the form submission
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
                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Nearbycollage == null
                                    ? Colors.grey
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

                                  context.read<CollagedropdownBloc>().add(
                                      FetchCollegeDetailsByName(newValue!));
                                });
                              },
                            ),
                          ),
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
                    ),

                    if (AcadamicTest != "TEST NOT TAKEN")
                      buildDropdown(
                        "Minimum Required Score",
                        testScoreRanges[AcadamicTest] ?? [],
                        AcadamicTestPercentage,
                            (value) {
                          setState(() {
                            AcadamicTestPercentage = value;
                            print("Score: $AcadamicTestPercentage");
                          });
                        },
                      ),

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
                      "Academic Test",
                      ["GRE", "GMAT", "IIT JAM", "TEST NOT TAKEN"],
                      AcadamicTest,
                          (value) {
                        setState(() {
                          AcadamicTest = value;
                          print(AcadamicTest);
                        });
                      },
                    ),


    if (AcadamicTest != "Not Required")
                      buildDropdown(
                        "Academic Test Percentage Minimum",
                        ["50", "60", "70", "80", "90", "100"],
                        AcadamicTestPercentage,
                        (value) {
                          setState(() {
                            AcadamicTestPercentage = value;
                            print(AcadamicTestPercentage);
                          });
                        },
                      ),
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
                          "CMAT",
                          "Not Required",
                        ],
                        AcadamicTest, (value) {
                      setState(() {
                        AcadamicTest = value;
                        print(AcadamicTest);
                      });
                    }),
                    // Only show Academic Test Percentage dropdown if AcadamicTest is not "Not Required"
                    if (AcadamicTest != "Not Required")
                      buildDropdown(
                        "Academic Test Percentage Minimum",
                        ["50", "60", "70", "80", "90", "100"],
                        AcadamicTestPercentage,
                        (value) {
                          setState(() {
                            AcadamicTestPercentage = value;
                            print(AcadamicTestPercentage);
                          });
                        },
                      ),
                  ],
                ),

              // Dropdown for Course Duration
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              //   child:

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
                              Englishtestpercentage = englishTestScoreRange[value]!.first;
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
                            englishTestScoreRange[Englishtest] ?? ["N/A"], // fallback to ["N/A"]
                            Englishtestpercentage,
                                (value) {
                              setState(() {
                                Englishtestpercentage = value;
                                print(Englishtestpercentage);
                              });
                            },
                            required: true,
                          ),
                        )

                    ],
                  )

                ],
              ),
              // ),
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
                    if (selectedCountries.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: selectedCountries.map((country) {
                          return Chip(
                            label: Text(country),
                            deleteIcon: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            onDeleted: () {
                              setState(() {
                                selectedCountries.remove(country);
                              });
                            },
                          );
                        }).toList(),
                      ),

                    SizedBox(height: 20),

                    /// Dropdown container
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpen = !isDropdownOpen;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Header Row
                            Row(
                              children: [
                                Icon(Icons.golf_course, color: Colors.black),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    selectedCountries.isEmpty
                                        ? "Select Countries"
                                        : selectedCountries.join(", "),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
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
                                    value: selectedCountries.contains(country),
                                    onChanged: (bool? selected) {
                                      setState(() {
                                        if (selected == true) {
                                          if (!selectedCountries
                                              .contains(country)) {
                                            selectedCountries.add(country);
                                          }
                                        } else {
                                          selectedCountries.remove(country);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                          ],
                        ),
                      ),
                    ),

                    //   ////
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
                    /// Selected countries shown as chips
                    if (selectedBoards.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: selectedBoards.map((country) {
                          return Chip(
                            label: Text(country),
                            deleteIcon: Icon(Icons.close),
                            onDeleted: () {
                              setState(() {
                                selectedBoards.remove(country);
                              });
                            },
                          );
                        }).toList(),
                      ),

                    SizedBox(height: 20),

                    /// Dropdown container
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownBoardOpen = !isDropdownBoardOpen;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Header Row
                            Row(
                              children: [
                                Icon(Icons.bookmark_add, color: Colors.black),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    selectedBoards.isEmpty
                                        ? "Select Countries"
                                        : selectedBoards.join(", "),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),

                            /// Dropdown List
                            if (isDropdownBoardOpen)
                              Column(
                                children: Boards.map((country) {
                                  return CheckboxListTile(
                                    title: Text(country),
                                    value: selectedBoards.contains(country),
                                    onChanged: (bool? selected) {
                                      setState(() {
                                        if (selected == true) {
                                          if (!selectedBoards
                                              .contains(country)) {
                                            selectedBoards.add(country);
                                          }
                                        } else {
                                          selectedBoards.remove(country);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Row(
              //   children: [
              //     Expanded(
              //       child: buildDropdown(
              //           "EnglishTest",
              //           ["PTE", "IELTS", "TOEFL", "Not Required"],
              //           Englishtest, (value) {
              //         setState(() {
              //           Englishtest = value;
              //           print(Englishtest);
              //         });
              //       }, required: true),
              //     ),
              //     Expanded(
              //       child: buildDropdown(
              //           "Required Percentage ",
              //           ["50", "60", "70", "80", "90", "100"],
              //           Englishtestpercentage, (value) {
              //         setState(() {
              //           Englishtestpercentage = value;
              //
              //           print(Englishtestpercentage);
              //         });
              //       }, required: true),
              //     ),
              //   ],
              // ),

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
