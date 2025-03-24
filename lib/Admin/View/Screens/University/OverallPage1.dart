
import 'package:flutter/material.dart';

class Overallpage1 extends StatefulWidget {
  const Overallpage1({super.key});

  @override
  State<Overallpage1> createState() => _Overallpage1State();
}

class _Overallpage1State extends State<Overallpage1> {
  TextEditingController universityNameController = TextEditingController();
  TextEditingController collegeNameController = TextEditingController();
  TextEditingController collegeCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController establishedDateController = TextEditingController();
  TextEditingController admissionStartDateController = TextEditingController();
  TextEditingController admissionEndDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController termsAndConditionsController = TextEditingController();
  TextEditingController courseFeeController = TextEditingController();
  TextEditingController scholarshipFeeController = TextEditingController();
  TextEditingController educationLevelController = TextEditingController();
  TextEditingController educationPercentageController = TextEditingController();
  TextEditingController academicTestController = TextEditingController();
  TextEditingController academicTestPercentageController = TextEditingController();
  String? selectedDegree;
  String? selectedCourse;
  String? selectedDuration;
  String? selectedRank;
  String? englishTest;
  String? englishTestPercentage;

  @override
  void initState() {
    super.initState();
    universityNameController.text = "Example University";
    collegeNameController.text = "Example College";
    collegeCodeController.text = "COL123";
    countryController.text = "India";
    establishedDateController.text = "01/01/2000";
    admissionStartDateController.text = "01/06/2024";
    admissionEndDateController.text = "01/08/2024";
    descriptionController.text = "This is a sample description.";
    termsAndConditionsController.text = "Sample terms and conditions.";
    courseFeeController.text = "10000";
    scholarshipFeeController.text = "2000";
    educationLevelController.text = "High School";
    educationPercentageController.text = "85%";
    academicTestController.text = "SAT";
    academicTestPercentageController.text = "1400";
    selectedDegree = "Bachelor";
    selectedCourse = "BBA";
    selectedDuration = "3 Years";
    selectedRank = "Top 50";
    englishTest = "IELTS";
    englishTestPercentage = "6.5";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "View Course Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRowFields("University Name", universityNameController, "College Name", collegeNameController),
                    buildRowFields("College Code", collegeCodeController, "Country", countryController),
                    buildRowFields("Established Date", establishedDateController, "Admission Start Date", admissionStartDateController),
                    buildRowFields("Admission End Date", admissionEndDateController, "Description", descriptionController),
                    buildRowFields("Terms and Conditions", termsAndConditionsController, "Course Fee", courseFeeController),
                    buildRowFields("Scholarship Fee", scholarshipFeeController, "Education Level", educationLevelController),
                    buildRowFields("Education Percentage", educationPercentageController, "Academic Test", academicTestController),
                    buildRowFields("Academic Test Percentage", academicTestPercentageController, "Degree Type", TextEditingController(text: selectedDegree)),
                    buildRowFields("Course Name", TextEditingController(text: selectedCourse), "Course Duration", TextEditingController(text: selectedDuration)),
                    buildRowFields("College Rank", TextEditingController(text: selectedRank), "English Test", TextEditingController(text: englishTest)),
                    buildRowFields("English Test Percentage", TextEditingController(text: englishTestPercentage), "", TextEditingController()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRowFields(String label1, TextEditingController controller1, String label2, TextEditingController controller2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(child: buildReadOnlyField(label1, controller1)),
          SizedBox(width: 20),
          Expanded(child: buildReadOnlyField(label2, controller2)),
        ],
      ),
    );
  }

  Widget buildReadOnlyField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter $label",
          ),
        ),
      ],
    );
  }
}
