import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_Knowledge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class Bachelors_organization extends StatefulWidget {
  const Bachelors_organization({super.key});

  @override
  State<Bachelors_organization> createState() => _Bachelors_organizationState();
}

class _Bachelors_organizationState extends State<Bachelors_organization> {
  int? selectedIndex;
  String? selectedOrganization;
  int experienceMonths = 0; // Default experience value

  final List<String> testOptions = ["Yes", "No"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Country/img_6.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Do you have any experience working \n with an NGO or an equivalent \n organisation?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff0A1F52),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                const SizedBox(width: 10),
                const Text(
                  "Adds value to your profile.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 30),

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
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
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
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            Column(
              children: [
                const Text(
                  "How many months of experience?",
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
                  max: 18,
                  divisions: 4,
                  label: "$experienceMonths",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 20),
                Text("0"),
                Text("18+ months"),
                SizedBox(width: 20),
              ],
            ),

            const SizedBox(height: 20),

            InkWell(
              onTap: () {
                if (selectedOrganization != null) {
                  context.read<SelectionCubit>().updateSelection("selectedOrganization", selectedOrganization.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Bachelors_Knowledge()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select an option")),
                  );
                }
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
