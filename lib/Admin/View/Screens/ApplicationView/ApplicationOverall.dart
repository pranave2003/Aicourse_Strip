import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Controller/Bloc/Applycourse/application_bloc.dart';
import '../../../../Widget/Constands/Loading.dart';

class AdminInfoWrapper2 extends StatelessWidget {
  const AdminInfoWrapper2({super.key, required this.applicationid});
  final String applicationid; // Specify the type

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationBloc>(
      create: (context) => ApplicationBloc()
        ..add(FetchApplicationDetailsById(Application_id: applicationid)),
      child: const ApplicationOverall(), // Use const for better performance
    );
  }
}

class ApplicationOverall extends StatelessWidget {
  const ApplicationOverall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocConsumer<ApplicationBloc, ApplicationState>(
        listener: (context, state) {
          if (state is RefreshApplication) {
            context
                .read<ApplicationBloc>()
                .add(FetchApplication(searchQuery: null));
          }
        },
        builder: (context, state) {
          if (state is Applicationgetloading) {
            return const Center(child: Loading_Widget());
          } else if (state is Applicationfailerror) {
            return Center(child: Text(state.error.toString()));
          } else if (state is ApplicationLoaded) {
            final ApplicationState = state.application;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "View Application Details",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Profile Top Section (optional)

                  const SizedBox(height: 20),

                  // Info Cards Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personal Info
                      Expanded(
                        child: buildCard(
                          title: "Student Personal Information",
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(ApplicationState
                                      .userprofilephoto
                                      .toString()),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildReadOnlyField("Name",
                                          ApplicationState.username.toString()),
                                      const SizedBox(height: 10),
                                      buildReadOnlyField(
                                          "Email",
                                          ApplicationState.useremail
                                              .toString()),
                                      const SizedBox(height: 10),
                                      buildReadOnlyField("Status",
                                          ApplicationState.status.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            buildRowFields(
                                "Phone Number",
                                ApplicationState.userphone.toString(),
                                "Gender",
                                ApplicationState.Gender.toString()),
                            buildRowFields(
                                "Country",
                                ApplicationState.usercountry.toString(),
                                "State",
                                ApplicationState.userstate.toString()),
                          ],
                        ),
                      ),

                      const SizedBox(width: 20),

                      // University Info
                      Expanded(
                        child: buildCard(
                          title: "Course & University Information",
                          children: [
                            buildRowFields(
                                "Course Name",
                                ApplicationState.Coursename.toString(),
                                "University Name",
                                ApplicationState.Universityname.toString()),
                            buildRowFields(
                                "College Name",
                                ApplicationState.collagename.toString(),
                                "College Code",
                                ApplicationState.collagecode.toString()),
                            buildRowFields(
                                "Degree Offered",
                                ApplicationState.Degree_offered.toString(),
                                "",
                                ""),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Uploaded Documents
                  buildCard(
                    title: "Uploaded Documents",
                    children: [
                      DocumentItem(
                        useemail: ApplicationState.useremail.toString(),
                        documentName: 'Transcript Document',
                        documentUrl:
                            ApplicationState.Transcript_doc_Url.toString(),
                        icon: Icons.description_outlined,
                        url: ApplicationState.Transcript_doc_Url.toString(),
                        Application_ID:
                            ApplicationState.applicationid.toString(),
                      ),
                      DocumentItem(
                        useemail: ApplicationState.useremail.toString(),
                        documentName: 'SOP Document',
                        documentUrl: ApplicationState.Sop_doc_url.toString(),
                        icon: Icons.description_outlined,
                        url: ApplicationState.Sop_doc_url.toString(),
                        Application_ID:
                            ApplicationState.applicationid.toString(),
                      ),
                      DocumentItem(
                        useemail: ApplicationState.useremail.toString(),
                        documentName: 'Education Document',
                        documentUrl:
                            ApplicationState.Education_doc_url.toString(),
                        icon: Icons.description_outlined,
                        url: ApplicationState.Education_doc_url.toString(),
                        Application_ID:
                            ApplicationState.applicationid.toString(),
                      ),
                      DocumentItem(
                        useemail: ApplicationState.useremail.toString(),
                        documentName: 'Travel Document',
                        documentUrl: ApplicationState.Travel_doc_url.toString(),
                        icon: Icons.description_outlined,
                        url: ApplicationState.Travel_doc_url.toString(),
                        Application_ID:
                            ApplicationState.applicationid.toString(),
                      ),
                      // DocumentItem(documentName: 'Statement of Purpose', icon: Icons.article_outlined),
                      // DocumentItem(documentName: 'Transcript Document', icon: Icons.file_copy_outlined),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Application Status Buttons
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 20,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<ApplicationBloc>().add(
                                AcceptOrRejectApplication(
                                    applicationid:
                                        ApplicationState.applicationid,
                                    Status: "1"));

                            // Approve logic
                          },
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text("Approve"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        ElevatedButton.icon(

                          onPressed: () {
                            context.read<ApplicationBloc>().add(
                                AcceptOrRejectApplication(
                                    applicationid:
                                        ApplicationState.applicationid,
                                    Status: "2"));
                          },
                          icon: const Icon(Icons.cancel_outlined),
                          label: const Text("Reject"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[600],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget buildCard({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0A71CB))),
          const SizedBox(height: 15),
          ...children,
        ],
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
          const SizedBox(width: 20),
          if (label2.isNotEmpty)
            Expanded(child: buildReadOnlyField(label2, value2)),
        ],
      ),
    );
  }

  Widget buildReadOnlyField(String label, String value, {Widget? child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        const SizedBox(height: 5),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            hintText: value,
          ),
        ),
        if (child != null) child,
      ],
    );
  }
}

class DocumentItem extends StatelessWidget {
  final String documentName;
  final IconData icon;
  final String url;
  final String Application_ID;
  final String useemail;

  const DocumentItem(
      {super.key,
      required this.documentName,
      required this.icon,
      required this.url,
      required this.Application_ID,
      required this.useemail,
      required String documentUrl});

  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: url == "null" ? Colors.red : Colors.green),
      title: Text(
        documentName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: url == "null"
          ? Text("optional")
          : TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController keyController =
                        TextEditingController();

                    return AlertDialog(
                      title: const Text("Enter Key"),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          controller: keyController,
                          decoration: InputDecoration(
                            hintText: "Enter key",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green, // Text color
                          ),
                          onPressed: () {
                            if (useemail == keyController.text) {
                              print("success");

                              context
                                  .read<ApplicationBloc>()
                                  .add(DownloadImageFromFirebase(url));
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //       content: Text("Entered Key: $Application_ID")),
                              // );
                              Navigator.of(context).pop();
                            }

                            // Example: show snackbar
                          },
                          child: const Text("Submit"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Download',
                style: TextStyle(color: Colors.blue),
              ),
            ),
    );
  }
}
