import 'package:flutter/material.dart';

class BachelorsDetailsOverall extends StatelessWidget {
  final String selecteddegree;
  final String Country;
  final String highestEducationpercentage;
  final String highestEducation;
  final String Course_offered;
  final String percentageController;
  final String activities;
  final String organization;
  final String Board;
  final String englishtests;
  final String englishpercentage;
  final String selectedacademicTest;

  BachelorsDetailsOverall({
    required this.selecteddegree,
    required this.Country,
    required this.highestEducation,
    required this.highestEducationpercentage,
    required this.Course_offered,
    required this.percentageController,
    required this.activities,
    required this.organization,
    required this.Board,
    required this.englishtests,
    required this.englishpercentage,
    required this.selectedacademicTest,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bachelors Details", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Student Details"),
            buildDetailItem("Country", Country),
            buildDetailItem("Degree", selecteddegree),
            buildDetailItem("Education Level", highestEducation),
            buildDetailItem("Education Percentage", highestEducationpercentage),
            buildDetailItem("Board", Board),
            buildDetailItem("English Test", englishtests),
            buildDetailItem("English Percentage", englishpercentage),
            buildDetailItem("Academic Test", selectedacademicTest),
            buildDetailItem("Academic Percentage", percentageController),
            buildDetailItem("Course Offered", Course_offered),
            buildDetailItem("Extracurricular Activities", activities),
            buildDetailItem("Organization", organization),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Container(
            width: 160,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value.isNotEmpty ? value : "No data found",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
