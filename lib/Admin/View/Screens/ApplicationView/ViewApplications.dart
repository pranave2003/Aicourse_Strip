import 'package:flutter/material.dart';

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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  CircleAvatar(backgroundColor: Color(0xffD9D9D9), child: Icon(Icons.notification_add)),
                  SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
                          backgroundImage: AssetImage('assets/Profile/img.png'), // Corrected Path
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Admin",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  "Property View Page",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(

              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(

                scrollDirection: Axis.vertical,

                child:DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey.shade300),
                  decoration: BoxDecoration(color: Colors.white),
                  columns: [

                    _buildColumn('Student '),
                    _buildColumn('Email '),
                    _buildColumn('Phone'),
                    _buildColumn('Course'),
                    _buildColumn('Status'),
                    _buildColumn('Action'),
                  ],
                  rows: List.generate(
                    state.University.length,
                        (index) {
                      final student = state.University[index];
                      return DataRow(
                        cells: [
                          DataCell(Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(student.Collegename ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                          )),
                          DataCell(Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(student.Universityname ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                          )),
                          DataCell(Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            child: Text(student.Country ?? ''),
                          )),
                          // DataCell(Text(student. UniversityimageURL.toString())),

                          DataCell(Text(student.Course_offered ?? '')),
                          DataCell(Row(
                            children: <Widget>[
                              // IconButton(
                              //   icon: Icon(Icons.remove_red_eye,
                              //       color: Colors.green),
                              //   iconSize: 30.0,
                              //   onPressed: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) =>
                              //             AdminInfoWrapper(
                              //               universityid:
                              //               student.Universityid ?? '',
                              //             ),
                              //       ),
                              //     );
                              //   },
                              // ),

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
              )
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






