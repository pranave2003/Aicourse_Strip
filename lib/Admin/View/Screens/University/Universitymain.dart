

import 'package:course_connect/Admin/View/Screens/University/EditUniversity.dart';
import 'package:course_connect/Widget/Constands/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Controller/Bloc/University_block/university_bloc.dart';
import 'OverallPage1.dart';

class Universitymainwrapper extends StatelessWidget {
  const Universitymainwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UniversityBloc()..add(FetchUniversity(searchQuery: null)),
      child: University_main(),
    );
  }
}

class University_main extends StatefulWidget {
  const University_main({super.key});

  @override
  State<University_main> createState() => _University_mainState();
}

class _University_mainState extends State<University_main> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          /// **Header Section**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      "Welcome ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Admin, ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0A71CB)),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffD9D9D9),
                    child: Icon(Icons.notification_add),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage('assets/Profile/img.png'),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Admin",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "University Management",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 18),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<UniversityBloc, UniversityState>(
              listener: (context, state) {
                if (state is RefreshUniversity) {
                  context
                      .read<UniversityBloc>()
                      .add(FetchUniversity(searchQuery: null));
                }
              },
              builder: (context, state) {
                if (state is UniversitysLoading) {
                  return Center(child: Loading_Widget());
                } else if (state is Universitysfailerror) {
                  return Center(child: Text(state.error.toString()));
                } else if (state is University_loaded) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.shade300),
                        decoration: BoxDecoration(color: Colors.white),
                        columns: [
                          _buildColumn('College '),
                          _buildColumn('University '),
                          _buildColumn('Country'),
                          _buildColumn('Course'),
                          _buildColumn('Action'),
                        ],
                        rows: List.generate(
                          state.University.length,
                          (index) {
                            final student = state.University[index];
                            return DataRow(
                              cells: [
                                DataCell(Text(student.Collegename ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                                DataCell(Text(student.Universityname ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                                DataCell(Text(student.Country ?? '')),
                                DataCell(Text(student.Course_offered ?? '')),
                                DataCell(Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.remove_red_eye,
                                          color: Colors.green),
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AdminInfoWrapper(
                                              universityid:
                                                  student.Universityid ?? '',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon:
                                          Icon(Icons.edit, color: Colors.black),
                                      iconSize: 30.0,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditUniversity(
                                              universityid:
                                                  student.Universityid ?? '',
                                              Collegename:
                                                  student.Collegename ?? '',
                                              universityname:
                                                  student.Universityname ?? '',
                                              Collegecode:
                                                  student.collagecode ?? '',
                                              highestEducationpercentage: student
                                                      .highestEducationpercentage ??
                                                  '',
                                              establishedDate:
                                                  student.Established_date ??
                                                      '',
                                              Admission_startdate:
                                                  student.Admission_startdate ??
                                                      '',
                                              admissionEndDate:
                                                  student.Admission_enddate ??
                                                      '',
                                              Discription:
                                                  student.Description ?? '',
                                              courseFee:
                                                  student.Tuition_fees ?? '',
                                              Terms_and_conditions: student
                                                      .Terms_and_conditions ??
                                                  '',
                                              scholarshipFee: student
                                                      .Schoolarship_details ??
                                                  '',
                                                  AcadamicTestPercentage: student
                                                      .AcadamicTestPercentage ??
                                                  '',
                                              AcadamicTest:
                                                  student.AcadamicTest ?? '',

                                              highestEducation: student.highestEducation ?? '',
                                              Englishtest: student.Englishtest??'',
                                              Englishtestpercentage:student.highestEducationpercentage?? '',
                                              // AcademicTestPercentage:student.AcadamicTestPercentage??'',
                                              // AcadamicTest:student.AcadamicTest??'',

                                              // university:student.Country,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      iconSize: 30.0,
                                      onPressed: () {
                                        _showDeleteConfirmationDialog(context,
                                            () {
                                          context.read<UniversityBloc>().add(
                                                DeleteUniversity(
                                                  Universityid:
                                                      student.Universityid ??
                                                          '',
                                                ),
                                              );
                                        });
                                      },
                                    ),
                                  ],
                                )),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  DataColumn _buildColumn(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }
}

void _showDeleteConfirmationDialog(
    BuildContext context, VoidCallback onDeleteConfirmed) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this university?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              onDeleteConfirmed();
              Navigator.of(dialogContext).pop();
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
