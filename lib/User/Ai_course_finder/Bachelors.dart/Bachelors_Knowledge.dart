import 'package:course_connect/User/Ai_course_finder/Alldetails.dart';
// import 'package:course_connect/User/Ai_course_finder/Alldetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class Bachelors_Knowledge extends StatefulWidget {
  const Bachelors_Knowledge({
    super.key,
  });

  @override
  State<Bachelors_Knowledge> createState() => _Bachelors_KnowledgeState();

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty('organization', organization));
  // }
}

class _Bachelors_KnowledgeState extends State<Bachelors_Knowledge> {
  int? selectedIndex; // Track selected container index
  String? selectedOrganization; // Selected test name
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
        backgroundColor: Colors.white,
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
            image: AssetImage("assets/Country/img_6.png"),
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
                  "Do you know the application deadlines for \n the universities you're interested in?",
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
            //     const SizedBox(width: 10),
            //     const Text(
            //       "Adds value to your profile.",
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ],
            // ),
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
                        selectedOrganization = testOptions[index];
                        print(selectedOrganization);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
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
            InkWell(
              onTap: () {
                if (testOptions != null) {
                  context
                      .read<SelectionCubit>()
                      .updateSelection("Options", testOptions.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BachelorsDetailsOverall(),
                    ),
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
