// import 'package:course_connect/User/Ai_course_finder/MastersEnglishtest.dart';
// import 'package:course_connect/User/Ai_course_finder/MastersReaserch.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Masters_work extends StatefulWidget {
//   const Masters_work({super.key});
//
//   @override
//   State<Masters_work> createState() => _Masters_workState();
// }
//
// class _Masters_workState extends State<Masters_work> {
//   int? selectedIndex; // Track selected container index
//   String? selectedTest; // Selected option ("Yes" or "No")
//   int experienceMonths = 0; // Initialize experience variable
//
//   // List of test options
//   final List<String> testOptions = ["Yes", "No"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back), // Back button icon
//           onPressed: () {
//             Navigator.pop(context); // Navigate back when tapped
//           },
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/country/img_6.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             const Text(
//               "Do you have any work experience?",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xff0A1F52),
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
//                 SizedBox(width: 10),
//                 Text("Adds value to your profile.", style: TextStyle(fontSize: 18)),
//               ],
//             ),
//             const SizedBox(height: 30),
//
//             // Yes / No Selection
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(testOptions.length, (index) {
//                 bool isSelected = selectedIndex == index;
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15), // Add spacing
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                         selectedTest = testOptions[index];
//                       });
//                     },
//                     child: Container(
//                       height: 50,
//                       width: 250,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(40),
//                         color: isSelected ? const Color(0xff0A1F52) : Colors.grey,
//                       ),
//                       child: Center(
//                         child: Text(
//                           testOptions[index],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//
//             const SizedBox(height: 30),
//
//             // Show slider only if "Yes" is selected
//             if (selectedTest == "Yes") ...[
//               const Text(
//                 "How much work experience do you have?",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Slider(
//                 value: experienceMonths.toDouble(),
//                 onChanged: (value) {
//                   setState(() {
//                     experienceMonths = value.toInt();
//                   });
//                 },
//                 min: 0,
//                 max: 60,
//                 divisions: 10,
//                 label: "$experienceMonths months",
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   SizedBox(width: 20),
//                   Text("0"),
//                   Spacer(),
//                   Text("60+ months"),
//                   SizedBox(width: 20),
//                 ],
//               ),
//             ],
//
//             const SizedBox(height: 180),
//
//             // Continue Button
//             InkWell(
//               onTap: () {
//     onTap: () {
//     Navigator.push(
//     context,
//     MaterialPageRoute(
//     builder: (context) => MastersEnglishtest(),
//     ),
//     );
//     }
//               //   print("Selected Option: $selectedTest");
//               //   print("Experience Months: $experienceMonths");
//               // },
//               child: Container(
//                 height: 51,
//                 width: 231,
//                 decoration: BoxDecoration(
//                   color: const Color(0xff0A71CB),
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
//             const SizedBox(height: 20),
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
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // class Masters_work extends StatefulWidget {
// //   const Masters_work({super.key});
// //
// //   @override
// //   State<Masters_work> createState() => _Masters_workState();
// // }
// //
// // class _Masters_workState extends State<Masters_work> {
// //   int? selectedIndex; // Track selected container index
// //   String? selectedTest; // Selected option ("Yes" or "No")
// //   int experienceMonths = 0; // Initialize experience variable
// //
// //   // List of test options
// //   final List<String> testOptions = ["Yes", "No"];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back), // Back button icon
// //           onPressed: () {
// //             Navigator.pop(context); // Navigate back when tapped
// //           },
// //         ),
// //       ),
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           image: DecorationImage(
// //             image: AssetImage("assets/country/img_6.png"),
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //         child: Column(
// //           children: [
// //             const SizedBox(height: 20),
// //             const Text(
// //               "Do you have any work experience?",
// //               textAlign: TextAlign.center,
// //               style: TextStyle(
// //                 color: Color(0xff0A1F52),
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 30),
// //             const Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
// //                 SizedBox(width: 10),
// //                 Text("Adds value to your profile.", style: TextStyle(fontSize: 18)),
// //               ],
// //             ),
// //             const SizedBox(height: 30),
// //
// //             // Yes / No Selection
// //             SizedBox(height: 20),
// //             Column(
// //
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: List.generate(testOptions.length, (index) {
// //                 bool isSelected = selectedIndex == index;
// //                 return GestureDetector(
// //                   onTap: () {
// //                     setState(() {
// //                       selectedIndex = index;
// //                       selectedTest = testOptions[index];
// //                     });
// //                   },
// //
// //                   child: Container(
// //
// //                     height: 50,
// //                     width: 100,
// //                     margin: const EdgeInsets.symmetric(horizontal: 10),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(40),
// //                       color: isSelected ? const Color(0xff0A1F52) : Colors.grey,
// //                     ),
// //                     child: Center(
// //                       child: Text(
// //                         testOptions[index],
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: isSelected ? Colors.white : Colors.black,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               }),
// //             ),
// //
// //             const SizedBox(height: 30),
// //
// //             // Show slider only if "Yes" is selected
// //             if (selectedTest == "Yes") ...[
// //               const Text(
// //                 "How many months of experience?",
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               Slider(
// //                 value: experienceMonths.toDouble(),
// //                 onChanged: (value) {
// //                   setState(() {
// //                     experienceMonths = value.toInt();
// //                   });
// //                 },
// //                 min: 0,
// //                 max: 18,
// //                 divisions: 18,
// //                 label: "$experienceMonths months",
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: const [
// //                   SizedBox(width: 20),
// //                   Text("0"),
// //                   Spacer(),
// //                   Text("18+ months"),
// //                   SizedBox(width: 20),
// //                 ],
// //               ),
// //             ],
// //
// //             const SizedBox(height: 20),
// //
// //             // Continue Button
// //             InkWell(
// //               onTap: () {
// //                 print("Selected Option: $selectedTest");
// //                 print("Experience Months: $experienceMonths");
// //               },
// //               child: Container(
// //                 height: 51,
// //                 width: 231,
// //                 decoration: BoxDecoration(
// //                   color: const Color(0xff0A71CB),
// //                   borderRadius: BorderRadius.circular(30),
// //                 ),
// //                 child: const Center(
// //                   child: Text(
// //                     "Continue",
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //
// //             const SizedBox(height: 20),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'package:course_connect/User/Ai_course_finder/Masters.dart/Maters_academic.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/User/Ai_course_finder/Masters.dart/MastersEnglishtest.dart';

class MastersWork extends StatefulWidget {
  const MastersWork({super.key});

  @override
  State<MastersWork> createState() => _MastersWorkState();
}

class _MastersWorkState extends State<MastersWork> {
  int? selectedIndex;
  String? selectedTest;
  int experienceMonths = 0;

  final List<String> testOptions = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/country/img_6.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Do you have any work experience?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0A1F52),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text("Adds value to your profile.", style: TextStyle(fontSize: 18)),
              ],
            ),
            const SizedBox(height: 30),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(testOptions.length, (index) {
                bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedTest = testOptions[index];
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: isSelected ? const Color(0xff0A1F52) : Colors.grey,
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
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            if (selectedTest == "Yes") ...[
              const Text(
                "How much work experience do you have?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: experienceMonths.toDouble(),
                onChanged: (value) {
                  setState(() {
                    experienceMonths = value.toInt();
                  });
                },
                min: 0,
                max: 60,
                divisions: 10,
                label: "$experienceMonths months",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(width: 20),
                  Text("0"),
                  Spacer(),
                  Text("60+ months"),
                  SizedBox(width: 20),
                ],
              ),
            ],

            const SizedBox(height: 180),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Maters_academic()),
                );
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: const Color(0xff0A71CB),
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