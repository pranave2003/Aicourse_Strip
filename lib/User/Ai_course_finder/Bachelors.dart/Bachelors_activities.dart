import 'package:course_connect/User/Ai_course_finder/Bachelors.dart/Bachelors_organization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class Bachelors_activities extends StatefulWidget {
  const Bachelors_activities({super.key});

  @override
  State<Bachelors_activities> createState() => _Bachelors_activitiesState();
}

class _Bachelors_activitiesState extends State<Bachelors_activities> {
  String? selectedactivitys;
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
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                const SizedBox(width: 10),
                const Text(
                  "Higher the level of representation, better \nthe impact on your profile.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: DropdownButton<String>(
                value: selectedactivitys,
                hint: const Text('Select from list'),
                dropdownColor: Colors.grey[300],
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedactivitys = newValue;
                  });
                },
                underline: const SizedBox(),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (selectedactivitys != null) {
                  context.read<SelectionCubit>().updateSelection("selectedactivity", selectedactivitys.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Bachelors_organization()));
                  print("Selected activities: $selectedactivitys");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select an activity level")),
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
