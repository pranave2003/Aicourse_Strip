
import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:course_connect/User/Ai_course_finder/Personal_details.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UniversityInfoScreenWrapper extends StatelessWidget {
  const UniversityInfoScreenWrapper({super.key, required this.universityid, this.Established_date});
  final universityid;
  final Established_date;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UniversityBloc>(
      create: (context) => UniversityBloc()..add(FetchCourseDetailsById(CourseUniversity_id: universityid)),
      child: UniversityInfoScreen(),
    );
  }
}

class UniversityInfoScreen extends StatefulWidget {
  @override
  _UniversityInfoScreenState createState() => _UniversityInfoScreenState();
}

class _UniversityInfoScreenState extends State<UniversityInfoScreen> {
  bool _isAgreed = false; // State for the checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('University', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: BlocConsumer<UniversityBloc, UniversityState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is Coursesgetloading) {
            return Loading_Widget();
          }
          if (state is UniversityModel) {
            final university = state.university;

            // Define the serviceList here after university is available
            List<Map<String, dynamic>> serviceList = [
              {"icon": Icons.flag, "name": "Established: ${university.Established_date}"},
              {"icon": Icons.star, "name": "QS Ranking: ${university.Rank}"},
              {"icon": Icons.lock_clock, "name": "Course Length: ${university.Duration}"},
              // Add more services as needed
            ];

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: university.UniversityimageURL.toString(),
                          height: 200,
                          width: 400,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              university.Collegename.toString(),
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
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
                        Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(height: 8),
                        Text(university.Description.toString(), style: TextStyle(fontSize: 14, color: Colors.black87)),
                        SizedBox(height: 16),
                        GridView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          children: serviceList.map((service) => _buildInfoCard(service)).toList(),
                        ),

                        SizedBox(height: 16),

                        // New Admission Info Section
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the Row content
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Application Start date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2), // Reduced height
                                  Text(
                                    '${university.Admission_startdate}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width:10,),
                              Container(
                                height: 30,
                                width: 1,
                                color: Colors.black,
                                margin: EdgeInsets.symmetric(horizontal: 8), // Optional: Adjust horizontal spacing
                              ),
                              SizedBox(width:10,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Application Due Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '${university.Admission_enddate}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Other Info Sections
                        _infoSection('Tuition Fees', [
                          '${university.Degree_offered}: ${university.Tuition_fees}',
                        ]),
                        _infoSection('Scholarships', [
                          'Up to  : ${university.Schoolarship_details}',
                        ]),
                        _infoSection('Eligibility', [
                          'English test: ${university.Englishtest}',
                          'Minimum Required Percentage: ${university.Englishtestpercentage}%',
                          'Academic Test: ${university.AcadamicTest}',
                          'Minimum Required Percentage: ${university.AcadamicTestPercentage}%'
                        ]),
                        _infoSection('Terms and Conditions', [university.Terms_and_conditions.toString()]),
                        Row(
                          children: [
                            Checkbox(value: _isAgreed, onChanged: (value) {
                              setState(() {
                                _isAgreed = value ?? false;
                              });
                            }),
                            Expanded(
                              child: Text('I agree with the terms and conditions', style: TextStyle(color: Colors.black87)),
                            ),
                          ],
                        ),
                        InkWell(

                          onTap: () {
                            // if (selectedOrganization != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Personal_details(),
                              ),
                            );
                            // print("fill all fields");

                          },

                          child:

                          Container(

                            height: 51,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Text(
                                  "Apply Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
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
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
          ...details.map((detail) => Text(detail, style: TextStyle(fontSize: 14, color: Colors.black87))),
        ],
      ),
    );
  }

  Widget _buildInfoCard(Map<String, dynamic> service) {
    return Container(
      height: 49,
      width: 40,
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service['icon'], size: 40, color: Colors.black),
            const SizedBox(height: 5),
            Text(
              service['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}