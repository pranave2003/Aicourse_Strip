import 'package:course_connect/User/Ai_course_finder/Result_AICoursefInder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/Bloc/Ai_coursefinder_block/coursefinder_block.dart';
import '../../Controller/Bloc/selection_cubit.dart';
import '../../Controller/Bloc/selection_state.dart';
import 'Ai.dart';

class BachelorsDetailsOverall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Details Overall", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<SelectionCubit, SelectionState>(
        builder: (context, state) {
          if (state is SelectionUpdated) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                      child: state.selections["selectedDegree"] == "Bachelors"
                          ? ListView(
                              children: [
                                SelectionBox(
                                  label: "Country",
                                  value: state.selections["country"] ??
                                      "Not Selected",
                                ),
                                SelectionBox(
                                    label: "Degree Name",
                                    value: state.selections["selectedDegree"] ??
                                        "Not Selected"),
                                SelectionBox(
                                    label: "Education",
                                    value:
                                        state.selections["highestEducation"] ??
                                            "Not Selected"),
                                SelectionBox(
                                  label: "Education Percentage",
                                  value: state.selections[
                                          "highestEducation_percentage"] ??
                                      "Not Selected",
                                ),
                                SelectionBox(
                                  label: "Course name",
                                  value: state.selections["course"] ??
                                      "Not Selected",
                                ),
                                SelectionBox(
                                  label: "English \nTest",
                                  value: state.selections["EnglishTest"] ??
                                      "Not Selected",
                                ),
                                SelectionBox(
                                  label: "English \n Test Percentage",
                                  value: state.selections[
                                          "EnglishTest_percentage"] ??
                                      "Not Selected",
                                ),
                                SelectionBox(
                                  label: "Academic Test",
                                  value: state.selections["Acadamictest"] ??
                                      "Not Selected",
                                ),
                                SelectionBox(
                                  label: "Academic \nTest Percentage",
                                  value: state.selections[
                                          "AcadamicTestpercentage"] ??
                                      "Not Selected",
                                ),
                                // SelectionBox(
                                //   label: "Activity",
                                //   value: state.selections["selectedactivity"] ??
                                //       "Not Selected",
                                // ),
                                // SelectionBox(
                                //   label: "Organization ",
                                //   value: state
                                //           .selections["selectedOrganization"] ??
                                //       "Not Selected",
                                // ),
                                SelectionBox(
                                  label:
                                      "Knowledge About \n Application Deadlines",
                                  value: state.selections["selectedAnswer"] ??
                                      "Not Selected",
                                ),
                              ],
                            )
                          : state.selections["selectedDegree"] == "Masters"
                              ? ListView(
                                  children: [
                                    SelectionBox(
                                      label: "Country",
                                      value: state.selections["country"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                        label: "Degree Name",
                                        value: state
                                                .selections["selectedDegree"] ??
                                            "Not Selected"),
                                    SelectionBox(
                                        label: "Education",
                                        value: state.selections[
                                                "highestEducation"] ??
                                            "Not Selected"),
                                    SelectionBox(
                                      label: "Education Percentage",
                                      value: state.selections[
                                              "highestEducation_percentage"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Course name",
                                      value: state.selections["course"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "English Test",
                                      value: state.selections["EnglishTest"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "English Test \nPercentage",
                                      value: state.selections[
                                              "EnglishTest_percentage"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Academic Test",
                                      value: state.selections["Acadamictest"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Academic Test \nPercentage",
                                      value: state.selections[
                                              "AcadamicTestpercentage"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Work Experience",
                                      value: state.selections["Work"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Months of Experience",
                                      value:
                                          state.selections["Work"] ?? "Month",
                                    ),
                                    SelectionBox(
                                      label:
                                          "Research paper\n published or not",
                                      value:
                                          state.selections["Research paper"] ??
                                              "Not Selected",
                                    ),
                                  ],
                                )
                              : ListView(
                                  children: [
                                    SelectionBox(
                                      label: "Country",
                                      value: state.selections["country"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                        label: "Degree Name",
                                        value: state
                                                .selections["selectedDegree"] ??
                                            "Not Selected"),
                                    SelectionBox(
                                        label: "Education",
                                        value: state.selections[
                                                "highestEducation"] ??
                                            "Not Selected"),
                                    SelectionBox(
                                      label: "Education Percentage",
                                      value: state.selections[
                                              "highestEducation_percentage"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Course name",
                                      value: state.selections["course"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "English Test",
                                      value: state.selections["EnglishTest"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "English Test \nPercentage",
                                      value: state.selections[
                                              "EnglishTest_percentage"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Academic Test",
                                      value: state.selections["Acadamictest"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Academic Test\n Percentage",
                                      value: state.selections[
                                              "AcadamicTestpercentage"] ??
                                          "Not Selected",
                                    ),
                                    // SelectionBox(
                                    //   label: "Company Type",
                                    //   value: state.selections["Companytype"] ??
                                    //       "Not Selected",
                                    // ),
                                    SelectionBox(
                                      label: "Work Experience",
                                      value: state.selections["Work"] ??
                                          "Not Selected",
                                    ),
                                    SelectionBox(
                                      label: "Months of \nExperience",
                                      value: state.selections["Month"] ??
                                          "Not Selected",
                                    ),
                                  ],
                                )),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      context.read<CoursefinderBlock>().add(FetchAllUniversites(
                            searchQuery: null,
                            Country: state.selections["country"],
                            AcadamicTest: state.selections["Acadamictest"],
                            AcadamicTestPercentage:
                                state.selections["AcadamicTestpercentage"],
                            Course_offered: state.selections["course"],
                            Degree_offered: state.selections["selectedDegree"],
                            Englishtest: state.selections["EnglishTest"],
                            Englishtestpercentage:
                                state.selections["EnglishTest_percentage"],
                            highestEducation:
                                state.selections["highestEducation"],
                            highestEducationpercentage:
                                state.selections["highestEducation_percentage"],
                          ));
                      // await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ResultAicoursefinder(),
                      //   ),
                      // );
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return AIGenerationScreen(
                              onGenerationComplete: () {
                                // Navigate to home screen after generation is complete
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ResultAicoursefinder(),
                                  ),
                                );
                              },
                            );
                          },
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            const begin = 0.0;
                            const end = 1.0;
                            const curve = Curves.easeInOut;

                            var tween = Tween(
                              begin: begin,
                              end: end,
                            ).chain(CurveTween(curve: curve));

                            return FadeTransition(
                              opacity: animation.drive(tween),
                              child: child,
                            );
                          },
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
                  // Corrected GestureDetector with proper closing brackets
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

class SelectionBox extends StatelessWidget {
  final String label;
  final String value;

  const SelectionBox({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            width: 150,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Light Grey Fill Color
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value.isNotEmpty ? value : "Not Selected",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
