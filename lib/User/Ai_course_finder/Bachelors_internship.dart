import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bachelors_internship extends StatefulWidget {
  const Bachelors_internship({super.key});

  @override
  State<Bachelors_internship> createState() => _Bachelors_internshipState();
}

class _Bachelors_internshipState extends State<Bachelors_internship> {
  int? selectedIndex; // Track selected container index
  String? selectedTest; // Selected test name
  int age = 10; // Initialize age variable

  // List of test options
  final List<String> testOptions = [
    "Yes",
    "No",
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
                  "Do you have any internship / \n fellowship / work experience in \n your area of interest?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff0A1F52),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                const SizedBox(width: 10),
                const Text(
                  "Add value to your profile.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Dynamically generated list of test options
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: testOptions.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = testOptions[index];
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
                          testOptions[index],
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

            const SizedBox(height: 30),

            // Age Slider
            Column(
              children: [
                const Text(
                  "How many months of experience?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: age.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      age = value.toInt();
                    });
                  },
                  min: 0,
                  max: 18,
                  divisions: 4,
                  label: "$age",
                ),
              ],
            ),
            // SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width:20),
                Text("0"),
                SizedBox(width:285),
                Text("18+ months"),
              ],
            ),

            const SizedBox(height: 20),

            // Continue Button
            InkWell(
              onTap: () {
                print("Selected Test: $selectedTest");
                print("Selected Age: $age");
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: Color(0xff0A71CB),
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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}






// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Bachelors_internship extends StatefulWidget {
//   const Bachelors_internship({super.key});
//
//   @override
//   State<Bachelors_internship> createState() => _Bachelors_internshipState();
// }
//
// class _Bachelors_internshipState extends State<Bachelors_internship> {
//   int? selectedIndex; // Track selected container index
//   String? selectedTest; // Selected test name
//   final TextEditingController percentageController = TextEditingController(); // Controller for text input
//
//   // List of English language tests
//   final List<String> englishTests = [
//     "Yes",
//     "No",
//   ];
//
//   get age => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back), // Back button icon
//           onPressed: () {
//             Navigator.pop(context); // Navigate back when tapped
//           },
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/country/img_6.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Which Academic test have you \n taken OR planning to take?",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xff0A1F52),
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
//                 SizedBox(width: 10),
//                 Text("Add value to your profile.",
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//
//             // Dynamically generated list of test options
//             Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: englishTests.length,
//                 itemBuilder: (context, index) {
//                   bool isSelected = selectedIndex == index;
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                         selectedTest = englishTests[index];
//                         print(selectedTest);
//                       });
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 150,
//                       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         color: isSelected ? Color(0xff0A1F52) : Colors.grey,
//                       ),
//                       child: Center(
//                         child: Text(
//                           englishTests[index],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             // Percentage Input Field (Placed directly below ListView)
//
//             SizedBox(height: 30),
//
//             // Continue Button
//             InkWell(
//               onTap: () {
//                 print("Selected Test: $selectedTest");
//                 print("Percentage: ${percentageController.text}");
//               },
//               child: Container(
//                 height: 51,
//                 width: 231,
//                 decoration: BoxDecoration(
//                   color: Color(0xff0A71CB),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Continue",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20),
//         Slider(
//           label: "Select Age",
//           value: age.toDouble(),
//           onChanged: (value) {
//             setState(() {
//               age = value.toInt();
//             });
//           },
//           min: 5,
//           max: 100,
//         ),
//         int age = 10;
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
