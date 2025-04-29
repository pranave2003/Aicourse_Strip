import 'package:course_connect/User/Ai_course_finder/Masters.dart/MastersReaserch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Controller/Bloc/selection_cubit.dart';

class Maters_academic extends StatefulWidget {
  const Maters_academic({super.key});

  @override
  State<Maters_academic> createState() => _Maters_academicState();
}

class _Maters_academicState extends State<Maters_academic> {
  int? selectedIndex;
  String? selectedAcademic;
  final TextEditingController scoreController = TextEditingController();

  final List<String> englishTests = [
    "GRE", "GMAT", "IIT JAM","CAT",
    "CMAT", "TEST NOT TAKEN"
  ];

  final Map<String, String> testScoreRanges = {
    "GRE": "130 - 170",
    "GMAT": "200 - 800",
    "IIT JAM": "0 - 100",
    "CAT": "0 - 100",
    "CMAT": "0 - 100",
    "TEST NOT TAKEN": "No Score Required",

  };

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
            image: AssetImage("assets/country/main.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Which Academic test have you \n taken?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0A1F52),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode_rounded, color: Colors.yellowAccent, size: 24),
                SizedBox(width: 10),
                // Text(
                //   "Scoring high in tests increases your options.",
                //   style: TextStyle(fontSize: 18),
                // ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: englishTests.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        selectedAcademic = englishTests[index];
                        scoreController.clear();
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

            if (selectedAcademic != "TEST NOT TAKEN" && selectedAcademic != null)
              Column(
                children: [
                  Text(
                    "Enter Your $selectedAcademic Score",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: scoreController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Score",
                            hintStyle: const TextStyle(color: Colors.black, fontSize: 18),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 1.5),
                            ),
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        if (testScoreRanges.containsKey(selectedAcademic!))
                          Text(
                            "Valid Range: ${testScoreRanges[selectedAcademic]}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 30),

            InkWell(
              onTap: () {
                if (selectedAcademic == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select an academic test.")),
                  );
                  return;
                }

                if (selectedAcademic != "TEST NOT TAKEN") {
                  if (scoreController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter your test score.")),
                    );
                    return;
                  }

                  int? score = int.tryParse(scoreController.text);
                  if (score == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a valid numeric score.")),
                    );
                    return;
                  }

                  if (selectedAcademic == "GRE" && (score < 130 || score > 170)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("GRE score must be between 130 - 170.")),
                    );
                    return;
                  }
                  if (selectedAcademic == "GMAT" && (score < 200 || score > 800)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("GMAT score must be between 200 - 800.")),
                    );
                    return;
                  }
                  if ((selectedAcademic == "GATE" || selectedAcademic == "IIT JAM") &&
                      (score < 0 || score > 100)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Score must be between 0 - 100.")),
                    );
                    return;
                  }
                  if (selectedAcademic == "NEET" && (score < 0 || score > 720)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("NEET score must be between 0 - 720.")),
                    );
                    return;
                  }
                  if (selectedAcademic == "LSAT" && (score < 120 || score > 180)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("LSAT score must be between 120 - 180.")),
                    );
                    return;
                  }
                }

                context.read<SelectionCubit>().updateSelection("Acadamictest", selectedAcademic.toString());
                context.read<SelectionCubit>().updateSelection("AcadamicTestpercentage", scoreController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MastersResearch()),
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
