import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widget/Constands/Loading.dart';

class AdminInfoWrapper extends StatelessWidget {
  const AdminInfoWrapper({super.key, required this.universityid});
  final universityid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()
        ..add(FetchCourseDetailsById(CourseUniversity_id: universityid)),
      child: Overallpage1(),
    );
  }
}

class Overallpage1 extends StatelessWidget {
  const Overallpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<UniversityBloc, UniversityState>(
        listener: (context, state) {
          if (state is RefreshUniversity) {
            context
                .read<UniversityBloc>()
                .add(FetchUniversity(searchQuery: null));
          }
        },
        builder: (context, state) {
          if (state is Coursesgetloading) {
            return Center(child: Loading_Widget());
          } else if (state is Universitysfailerror) {
            return Center(child: Text(state.error.toString()));
          } else if (state is UniversityModel) {
            final UniversityState = state.university;
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "View Course Details",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRowFields(
                              "University Name",
                              UniversityState.Universityname.toString(),
                              "College Name",
                              "Example College"),
                          buildRowFields(
                              "College Code", "COL123", "Country", "India"),
                          buildRowFields("Established Date", "01/01/2000",
                              "Admission Start Date", "01/06/2024"),
                          buildRowFields("Admission End Date", "01/08/2024",
                              "Description", "This is a sample description."),
                          buildRowFields(
                              "Terms and Conditions",
                              "Sample terms and conditions.",
                              "Course Fee",
                              "10000"),
                          buildRowFields("Scholarship Fee", "2000",
                              "Education Level", "High School"),
                          buildRowFields("Education Percentage", "85%",
                              "Academic Test", "SAT"),
                          buildRowFields("Academic Test Percentage", "1400",
                              "Degree Type", "Bachelor"),
                          buildRowFields("Course Name", "BBA",
                              "Course Duration", "3 Years"),
                          buildRowFields("College Rank", "Top 50",
                              "English Test", "IELTS"),
                          buildRowFields(
                              "English Test Percentage", "6.5", "", ""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget buildRowFields(
      String label1, String value1, String label2, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(child: buildReadOnlyField(label1, value1)),
          SizedBox(width: 20),
          Expanded(child: buildReadOnlyField(label2, value2)),
        ],
      ),
    );
  }

  Widget buildReadOnlyField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: value,
          ),
        ),
      ],
    );
  }
}
