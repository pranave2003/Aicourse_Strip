import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/Bloc/Applycourse/ApplicationModel/ApplicationModel.dart';
import '../../../Controller/Bloc/Applycourse/application_bloc.dart';
import '../../../Widget/Constands/Loading.dart';
import '../../Apply/TrackingApplication.dart'; // Ensure correct import

class Viewapplicationsmainwrapper1 extends StatelessWidget {
  const Viewapplicationsmainwrapper1({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
      ApplicationBloc()
        ..add(FetchApplication(searchQuery: null,uaser_uid: userid_global)),
      child: ApplicationStatusPage(),
    );
  }
}
String _getStatusText(String? status) {
  switch (status) {
    case '1':
      return 'Approved';
    case '2':
      return 'Rejected';
    case '0':
    default:
      return 'Pending';
  }
}

Color _getStatusColor(String? status) {
  switch (status) {
    case '1':
      return Colors.green;
    case '2':
      return Colors.red;
    case '0':
    default:
      return Colors.orange;
  }
}


class ApplicationStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Application Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
    BlocConsumer<ApplicationBloc, ApplicationState>(
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
    }
    else if (state is Application_loaded) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: state.Application.length,
        itemBuilder: (context, index) {
          final application = state.Application[index];
          return _buildApplicationCard(
            context,
            application,
            Colors.grey[100]!,
          );
        },
      );

    };
    return SizedBox();
    },

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCard(BuildContext context, Applicationmodel application, Color bgColor) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => TrackingApplication(),
        //   ),
        // );
      },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xff0A71CB), width: 2),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.school, color: Colors.blue[800]),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "${application.Universityname ?? 'N/A'}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.domain, size: 20, color: Colors.grey[800]),  // College icon
                    SizedBox(width: 6),
                    Text(
                      "${application.collagename ?? 'N/A'}",  // College name
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.book, size: 20, color: Colors.grey[800]),
                    SizedBox(width: 6),
                    Text(
                      "${application.Coursename ?? 'N/A'}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.workspace_premium, size: 20, color: Colors.grey[800]),
                    SizedBox(width: 6),
                    Text(
                      "${application.Degree_offered ?? 'N/A'}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.flag, size: 20, color: Colors.grey[800]),
                    SizedBox(width: 6),
                    Text(
                      "${application.Country ?? 'N/A'}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Divider(height: 20),
                Row(
                  children: [
                    Icon(Icons.info_outline, color: _getStatusColor(application.status)),
                    SizedBox(width: 8),
                    Text(
                      "Your application is ${_getStatusText(application.status)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _getStatusColor(application.status),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),

// Status color and text based on status value


    );
  }


}

