import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversityInfoScreenWrapper extends StatelessWidget {
  const UniversityInfoScreenWrapper({super.key, required this.universityid});
  final universityid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()
        ..add(FetchCourseDetailsById(CourseUniversity_id: universityid)),
      child: UniversityInfoScreen(),
    );
  }
}

class UniversityInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('University', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: BlocConsumer<UniversityBloc, UniversityState>(
        listener: (context, state) {
          // TODO: implement listen
        },
        builder: (context, state) {
          if (state is Coursesgetloading) {
            return Loading_Widget();
          }
          if (state is UniversityModel) {
            final university = state.university;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "https://content.jdmagicbox.com/v2/comp/malappuram/m9/9999px483.x483.221229222631.k6m9/catalogue/calicut-university-malappuram-universities-ez2kcrhfsj.jpg",
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              university.Collegename.toString(),
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              university.Country.toString(),
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        Text(
                          university.Description.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Apply Now',
                              style: TextStyle(color: Colors.white)),
                        ),
                        SizedBox(height: 16),
                        _infoSection('Admission', [
                          'Start Date: ${university.Admission_startdate}',
                          'Application Due: ${university.Admission_enddate}'
                        ]),
                        _infoSection('Tuition Fees', [
                          '${university.Degree_offered}: ${university.Tuition_fees}',
                        ]),
                        _infoSection('Scholarships', [
                          'Tuition Fees : ${university.Schoolarship_details}',
                        ]),
                        _infoSection(
                            'Eligibility', ['IELTS Overall Score: 6.5']),
                        _infoSection('Terms and Conditions',
                            [university.Terms_and_conditions.toString()]),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Expanded(
                                child: Text(
                                    'I agree with the terms and conditions',
                                    style: TextStyle(color: Colors.black87)))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget _infoSection(String title, List<String> details) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          ...details.map((detail) => Text(detail,
              style: TextStyle(fontSize: 14, color: Colors.black87))),
        ],
      ),
    );
  }
}
