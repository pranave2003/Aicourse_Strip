//
// import 'package:course_connect/User/Ai_course_finder/AppicationTrackingPage.dart';
// import 'package:flutter/material.dart';
// import 'TrackingApplication.dart'; // Import the new page
//
// class ApplicationStatusPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Application Status",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildApplicationCard(
//                     context,
//                     "Your application to Toronto University is confirmed.",
//                     Colors.grey[100]!,
//                   ),
//                   _buildApplicationCard(
//                     context,
//                     "Your application for Master’s in Computer Science at XYZ University has been successfully submitted. The university will review your application, and you can expect an update by March 15, 2025.",
//                     Colors.grey[300]!,
//                   ),
//                   _buildApplicationCard(
//                     context,
//                     "Your application for ABC University is incomplete. Please upload your Statement of Purpose (SOP) and Letter of Recommendation (LOR) before February 10, 2025, to avoid delays.",
//                     Colors.grey[300]!,
//                   ),
//                   _buildApplicationCard(
//                     context,
//                     "You are eligible for the International Student Excellence Scholarship at JKL University. The deadline to apply is April 1, 2025.",
//                     Colors.grey[300]!,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildApplicationCard(BuildContext context, String text, Color bgColor) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to the details page when the card is tapped
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TrackingApplication(),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           color: bgColor,
//           border: Border.all(color: Color(0xff0A71CB), width: 2),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Card(
//           elevation: 0,
//           color: Colors.transparent,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(text),
//                 SizedBox(height: 8),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "Cancel",
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'TrackingApplication.dart'; // Ensure correct import

class ApplicationStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Application Status",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildApplicationCard(
                    context,
                    "Your application to Toronto University is confirmed.",
                    Colors.grey[100]!,
                  ),
                  _buildApplicationCard(
                    context,
                    "Your application for Master’s in Computer Science at XYZ University has been successfully submitted. The university will review your application, and you can expect an update by March 15, 2025.",
                    Colors.grey[300]!,
                  ),
                  _buildApplicationCard(
                    context,
                    "Your application for ABC University is incomplete. Please upload your Statement of Purpose (SOP) and Letter of Recommendation (LOR) before February 10, 2025, to avoid delays.",
                    Colors.grey[300]!,
                  ),
                  _buildApplicationCard(
                    context,
                    "You are eligible for the International Student Excellence Scholarship at JKL University. The deadline to apply is April 1, 2025.",
                    Colors.grey[300]!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCard(BuildContext context, String text, Color bgColor) {
    return GestureDetector(
      onTap: () {
        // Navigate to TrackingApplication Page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrackingApplication(),
          ),
        );
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
                Text(text),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
