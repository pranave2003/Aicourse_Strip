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
        ..add(FetchApplication(searchQuery: null)),
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
    } else if (state is Application_loaded) {
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
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: Color(0xff0A71CB), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Application to ${application.collagename} is ${_getStatusText(application.status)}",
                  style: TextStyle(color: _getStatusColor(application.status),fontSize: 16,fontWeight: FontWeight.bold),
                ),
                Text("University: ${application.Universityname ?? 'N/A'}", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Course: ${application.Coursename ?? 'N/A'}"),
                Text("Degree: ${application.Degree_offered ?? 'N/A'}"),
                Text("Country: ${application.Country ?? 'N/A'}"),
                Text("Collage: ${application.collagename ?? 'N/A'}"),
                SizedBox(height: 8),

                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Text("Track Application", style: TextStyle(color: Colors.red)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

