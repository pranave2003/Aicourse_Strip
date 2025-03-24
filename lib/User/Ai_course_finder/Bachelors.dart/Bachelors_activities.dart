import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_organization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bachelors_activities extends StatefulWidget {
  const Bachelors_activities({super.key});

  @override
  State<Bachelors_activities> createState() => _Bachelors_activitiesState();
}

class _Bachelors_activitiesState extends State<Bachelors_activities> {
  String? _selectedValue; // Selected value
  List<String> items = [
    'National level representation',
    'State level',
    'District level',
    'Inter-school level',
    'Intra-school level'
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
            image: AssetImage("assets/country/main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "What is your most relevant level of \ninvolvement in extracurricular activities?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff0A1F52),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Info row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                Text(
                  "Higher the level of representation better \n the impact on your profile.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Dropdown Menu
            Container(
              decoration: BoxDecoration(
                color: Colors.grey, // Change button color to grey
                borderRadius: BorderRadius.circular(20), // Optional: Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 40), // Adds padding
              child: DropdownButton<String>(
                value: _selectedValue,
                hint: Text('Select from list'),
                dropdownColor: Colors.grey[300], // Dropdown menu color
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue; // Update the selected value
                  });
                },
                underline: SizedBox(), // Removes the default underline
              ),
            ),

            Spacer(), // Pushes the button to the bottom

            // Continue Button
            InkWell(
              onTap: () {
                if (_selectedValue != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bachelors_organization(),
                    ),
                  );
                  print("Selected activities: $_selectedValue");
                } else {
                  print("No activities selected");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select an activity level")),
                  );
                }
              },
              child: Container(
                height: 51,
                width: 231,
                decoration: BoxDecoration(
                  color: Color(0xff0A71CB),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
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

            SizedBox(height: 20), // Bottom padding
          ],
        ),
      ),
    );
  }
}





// import 'package:course_connect/User/Ai_course_finder/Bachelors_organization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Bachelors_activities extends StatefulWidget {
//   const Bachelors_activities({super.key});
//
//   @override
//   State<Bachelors_activities> createState() => _Bachelors_activitiesState();
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Bachelors_activities(),
//     );
//   }
// }
//
// class _Bachelors_activitiesState extends State<Bachelors_activities> {
//   String? _selectedValue; // Selected value
//   List<String> items = ['National  level representation',
//     'State level','District level','inter school level','intra-school level'
//   ];
//   int selectedIndex = -1; // Track selected container index
//   String? selectedActivities;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(leading: IconButton(
//           icon: Icon(Icons.arrow_back), // Back button icon
//           onPressed: () {
//             Navigator.pop(context); // Navigate back when tapped
//           },
//         ),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/country/main.png"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child:Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("What is your most relevant level of \ninvolvement in extracurricular activities?",style: TextStyle(color: Color(0xff0A1F52),fontSize:20,fontWeight: FontWeight.bold),),
//                 ],
//               ),
//               SizedBox(height:20,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
//                   SizedBox(width: 10),
//                   Text(
//                     "Higher the level of representation better \n the impact on your profile.",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ],
//               ),
//               SizedBox(height:10),
//
//
//               SizedBox(height:20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey, // Change button color to grey
//                   borderRadius: BorderRadius.circular(20), // Optional: Rounded corners
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 40), // Adds padding
//                 child: DropdownButton<String>(
//                   value: _selectedValue,
//                   hint: Text('Select from list'),
//                   dropdownColor: Colors.grey[300], // Dropdown menu color
//                   items: items.map((String item) {
//                     return DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(item),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedValue = newValue;
//                     });
//                   },
//                   underline: SizedBox(), // Removes the default underline
//                 ),
//               ),
//
//               SizedBox(height: 390
//               ),
//               InkWell(
//                 onTap: () {
//                   if (selectedActivities != null) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Bachelors_organization(),
//                       ),
//                     );
//                     print("Selected activities: $selectedActivities");
//                   }
//                   else {
//                     print("Selected activities: $selectedActivities");
//                     // ScaffoldMessenger.of(context).showSnackBar(
//                     //   SnackBar(content: Text("No activities selected")),
//                     // );
//                   }
//                 },
//
//                 child: Container(
//                   height: 51,
//                   width: 231,
//                   decoration: BoxDecoration(
//                       color: Color(0xff0A71CB),
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Center(
//                       child: Text(
//                         "Continue",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold),
//                       )),
//                 ),
//               )
//
//
//
//             ],
//           ),
//         ));
//   }
// }