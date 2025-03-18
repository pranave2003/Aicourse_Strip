import 'package:course_connect/User/Ai_course_finder/Result_AICoursefInder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MBA_DetailsOverall(),
  ));
}

class MBA_DetailsOverall extends StatelessWidget {
  final Map<String, String> details = {
    "Country name": "UK",
    "Degree Name": "MBA",
    "Education level": "Undergraduate degree",
    "Board": "CBSC",
    "Percentage": "60%",
    "Course": "Finance",
    "English test": "IELTS",
    "Percentage (English test)": "7",
    "Academic test": "SAT",
    "Percentage (Academic test)": "7",
    "Work Experience": "Yes",
    "Months of experience": "2 months",
    "Company type": "Non-profit",
    "Organization representation": "Yes",
    "Months of experience (Org)": "2 months",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("details overall-masters", style: TextStyle(fontSize: 16)),
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
                            color:  Colors.grey[200], // Light Grey Fill Color
                            // border: Border.all(color: Colors.black, width: 1), // Black Border
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


