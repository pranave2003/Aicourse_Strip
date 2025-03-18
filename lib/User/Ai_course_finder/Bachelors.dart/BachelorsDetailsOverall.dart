
import 'package:course_connect/User/Ai_course_finder/Result_AICoursefInder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BachelorsDetailsOverall(),
  ));
}

class BachelorsDetailsOverall extends StatelessWidget {
  final Map<String, String> details = {
    "Country name": "UK",
    "Degree Name": "Bachelors",
    "Education level": "plus two",
    "Board": "CBSC",
    "Percentage": "60%",
    "Course": "Physics",
    "English test": "IELTS",
    "Percentage (English test)": "7",
    "Academic test": "SAT",
    "Percentage (Academic test)": "7",
    "Extracurricular activities": "National level",
    "Organization representation": "Yes",
    "Months of experience (Org)": "3 months",
    "knowledge about application \n deadlines":"yes",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bachelors_detailsoverall", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: details.length,
                itemBuilder: (context, index) {
                  String key = details.keys.elementAt(index);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(key, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        Container(
                          width: 150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Light Grey Fill Color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            details[key]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Corrected GestureDetector with proper closing brackets
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultAicoursefinder(),
                  ),
                );
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(2, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Generate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
