
import 'package:course_connect/Admin/View/Screens/ApplicationView/ApplicationOverall.dart';
import 'package:course_connect/Controller/Bloc/Applycourse/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widget/Constands/Loading.dart';
class Viewapplicationsmainwrapper extends StatelessWidget {
  const Viewapplicationsmainwrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ApplicationBloc()
        ..add(FetchApplication(searchQuery: null)),
      child: ViewApplications(),
    );
  }
}
class ViewApplications extends StatefulWidget {
  const ViewApplications({super.key});

  @override
  State<ViewApplications> createState() => _ViewApplicationsState();
}

class _ViewApplicationsState extends State<ViewApplications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      "Welcome ",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
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
                  CircleAvatar(backgroundColor: Color(0xffD9D9D9),
                      child: Icon(Icons.notification_add)),
                  SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20, // Ensure a proper radius is set
                          backgroundColor: Colors.grey, // Fallback color
                          backgroundImage: AssetImage(
                              'assets/Profile/img.png'), // Corrected Path
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
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Application View Page",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<ApplicationBloc, ApplicationState>(
              listener: (context, state) {
                if (state is RefreshApplication) {
                  context
                      .read<ApplicationBloc>()
                      .add(FetchApplication(searchQuery: null));
                }
              },
              builder: (context, state) {
                if (state is ApplicationLoading) {
                  return Center(child: Loading_Widget());
                } else if (state is Applicationfailerror) {
                  return Center(child: Text(state.error.toString()));
                } else if (state is Application_loaded) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey.shade300),
                        decoration: BoxDecoration(color: Colors.white),
                        columns: [
                          _buildColumn('S/No'),
                          _buildColumn('Student'),
                          _buildColumn('Email '),
                          _buildColumn('Phone'),
                          _buildColumn('College'),
                          _buildColumn('Course'),
                          _buildColumn('Status'),
                          _buildColumn('Action'),
                        ],
                        rows: List.generate(
                          state.Application.length,
                              (index) {
                            final student = state.Application[index];
                            return DataRow(
                              cells: [
                                DataCell(Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text((index + 1).toString(),
                                      style: const TextStyle(
                                          fontWeight:
                                          FontWeight.bold)), // Add S/no cell
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(student.username ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(student.useremail ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0.0),
                                  child: Text(student.userphone ?? ''),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0.0),
                                  child: Text(student.collagename ?? ''),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0.0),
                                  child: Text(student.Coursename ?? ''),
                                )),
                                DataCell(Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0.0),
                                  child: Text(student.status ?? ''),
                                )),
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
                                                AdminInfoWrapper2(
                                                  applicationid:
                                                  student.applicationid ?? '',
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
                                        // _showDeleteConfirmationDialog(context,
                                        //         () {
                                        //       context.read<UniversityBloc>()
                                        //           .add(
                                        //         DeleteUniversity(
                                        //           Universityid:
                                        //           student.Universityid ??
                                        //               '',
                                        //         ),
                                        //       );
                                        //     });
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
                return SizedBox();// Fallback for other states
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
            fontSize: 16),
      ),
    );
  }
}