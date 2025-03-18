import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_academictest.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BachelorsEnglish extends StatefulWidget {
  const BachelorsEnglish({super.key});

  @override
  State<BachelorsEnglish> createState() => _BachelorsEnglishState();
}

class _BachelorsEnglishState extends State<BachelorsEnglish> {
  int? selectedIndex; // Track selected container index
  String? selectedTest; // Selected test name
  final TextEditingController percentageController = TextEditingController(); // Controller for text input

  // List of English language tests
  final List<String> englishTests = [
    "TOEFL",
    "IELTS",
    "PTE",
    "Test Not Taken Yet"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back when tapped
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/country/img_6.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What English language test have\n you taken OR planning to take?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff0A1F52),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text(
                  "Scoring high in language tests \nincreases your options multifold.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dynamically generated list of test options
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: englishTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = englishTests[index];
                        print(selectedTest);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? Color(0xff0A1F52) : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          englishTests[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,

                          ),
                        ),
                      ),
                    ),

                  );
                },

              ),

            ),
            Text("Enter your score",style: TextStyle(color: Colors.blueAccent,fontSize:25,fontWeight: FontWeight.w600)),
            //
            // Percentage Input Field (Placed directly below ListView)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 200,
                child: TextFormField(
                  controller: percentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Score",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),

            SizedBox(height: 30),

            // Continue Button
            InkWell(
              onTap: () {
                if (selectedTest != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bachelors_academictest(),
                    ),
                  );
                  print("Selected test: $selectedTest");
                }
                else {
                  print("Selected Test: $selectedTest");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No Test selected")),
                  );
                }
              },
              // onTap: () {
              //   print("Selected Test: $selectedTest");
              //   print("Percentage: ${percentageController.text}");
              // },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
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






