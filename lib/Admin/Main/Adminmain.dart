// import 'package:course_connect/Admin/View/Screens/Courses/Addcourses.dart';
// import 'package:course_connect/Admin/View/Screens/Courses/Courses.dart';
// import 'package:course_connect/Admin/View/Screens/Courses/Editcourses.dart';
// import 'package:course_connect/Admin/View/Screens/House.dart/ViewHouses.dart';
// import 'package:course_connect/Admin/View/Screens/KnowledgeBank/CountryRules.dart';
// import 'package:course_connect/Admin/View/Screens/Landlord/New_Landlords.dart';
// import 'package:course_connect/Admin/View/Screens/Payment.dart/Payment_View.dart';
// import 'package:course_connect/Admin/View/Screens/Users.dart/UserView.dart';
// import 'package:flutter/material.dart';
//
// import '../View/Screens/University/AddUniversity.dart';
// import '../View/Screens/University/EditUniversity.dart';
// import '../View/Screens/University/Universitymain.dart';
//
// Future<void> main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: AdminPage(),
//     );
//   }
// }
//
// class AdminPage extends StatefulWidget {
//   const AdminPage({super.key});
//
//   @override
//   State<AdminPage> createState() => _AdminPageState();
// }
//
// class _AdminPageState extends State<AdminPage> {
//   Widget? _selectedPage; // Variable to hold the currently selected page
//   String? _selectedTile; // Tracks the selected tile
//   String? _expandedTile;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     _selectedPage = Dashboard();
//     _selectedTile = "Dashboard";
//     super.initState();
//   }
//
//   var mainExpansionSelectedColor = Colors.blue;
//   var SubExpansionSelectedColor = Colors.pink;
//   var selectedbaground = Color(0xff0A71CB);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Row(
//         children: [
//           // Left side: Sidebar Navigation
//           Container(
//             width: 300,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(2, 4),
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.all(8.0),
//             child: ListView(
//               children: [
//                 const SizedBox(height: 50,width:30,),
//                 Center(
//                   child: Image.asset(
//                     "assets/logo.png",
//                     width: 160,
//                     height: 122,
//                   ),
//                 ),
//
//           // Right side: Display selected page
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: _selectedPage ??
//                   const Center(
//                     child: Text('Select a management option'),
//                   ),
//             ),
//           ),
//         ],
//       ),
//       // body: Row(
//       //   children: [
//       //     // Left side: Management options
//       //     Container(
//       //       width: 300,
//       //       decoration: BoxDecoration(
//       //         borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
//       //         color: Colors.white,
//       //         boxShadow: [
//       //           BoxShadow(
//       //             color: Colors.black.withOpacity(0.2), // Shadow color
//       //             spreadRadius: 2, // Extends the shadow
//       //             blurRadius: 5, // Softens the shadow
//       //             offset: Offset(2, 4), // Changes position (x, y)
//       //           ),
//       //         ],
//       //       ),
//       //       padding: const EdgeInsets.all(8.0),
//       //       child: ListView(
//       //         children: [
//       //           SizedBox(
//       //             height: 50,
//       //           ),
//       //           Center(
//       //             child: Container(
//       //               width: 100,
//       //               height: 100,
//       //               color: Colors.blue,
//       //             ),
//       //           ),
//
//
// // Wrap the following inside a valid widget like ExpansionTile or ListTile
//                 _buildMainExpansionTile(
//                     title: 'Universities',
//                     icon: Icons.school_outlined,
//                     children: [
//                       SubListTile("View University", University_main()),
//                       SubListTile("Add University",AddUniversity()),
//                       SubListTile("Edit University", EditUniversity()),
//                     ]),
//
//
//                 _buildMainExpansionTile(
//                     title: 'Courses',
//                     icon: Icons.book_outlined,
//                     children: [
//                       SubListTile("View Courses", Courses_main()),
//                       SubListTile("Add Course",Addcourses()),
//                       SubListTile("Edit Course", Editcourses()),
//                     ]),
//                 _buildMainExpansionTile(
//                     title: 'Landlord',
//                     icon: Icons.people_alt_outlined,
//                     children: [
//                       SubListTile("New Landlords", NewLandlords()),
//                       // SubListTile("Accepted Landlords",Addcourses()),
//                       // SubListTile("Rejected Landlords", Editcourses()),
//                     ]),
//                 _buildMainExpansionTile(
//                     title: 'Houses',
//                     icon: Icons.maps_home_work_outlined,
//                     children: [
//                       SubListTile("View Houses", ViewHouses()),
//                     ]),
//                 _buildMainExpansionTile(
//                     title: 'Payment',
//                     icon: Icons.payments_outlined,
//                     children: [
//                       SubListTile("View Payment", PaymentView()),
//                     ]),
//                 _buildMainExpansionTile(
//                     title: 'Users',
//                     icon: Icons.supervised_user_circle_sharp,
//                     children: [
//                       SubListTile("View users", Userview()),
//                     ]),
//                 _buildMainExpansionTile(
//                     title: 'Knowledge Bank',
//                     icon: Icons.my_library_books_rounded,
//                     children: [
//                       SubListTile("Terms and Conditions", CountryRules()),
//                     ]),
//               ],
//             ),
//           ),
//
//           // Right side: Display selected page or add role form
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(16.0),
//               child: _selectedPage ??
//                   Center(
//                     child: const Text('Select a management option'),
//                   ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMainExpansionTile({
//     required String title,
//     IconData? icon, // Made optional
//     required List<Widget> children,
//     e,
//   }) {
//     return ExpansionTile(
//       textColor: mainExpansionSelectedColor,
//       iconColor: mainExpansionSelectedColor,
//       leading: Icon(
//         icon,
//       ), // Show icon only if it's provided
//       shape: const RoundedRectangleBorder(side: BorderSide.none),
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 17),
//       ),
//       childrenPadding: EdgeInsets.zero,
//       initiallyExpanded: _expandedTile == title,
//       onExpansionChanged: (isExpanded) {
//         setState(() {
//           _expandedTile = isExpanded ? title : null; // Collapse other tiles
//         });
//       },
//       children: children,
//     );
//   }
//
//   // Widget _buildESubxpansion({
//   //   required String title,
//   //   required List<Widget> children,
//   // }) {
//   //   return ExpansionTile(
//   //     textColor: SubExpansionSelectedColor,
//   //     iconColor: SubExpansionSelectedColor,
//   //     leading: Icon(
//   //       null,
//   //     ), // Show icon only if it's provided
//   //     shape: const RoundedRectangleBorder(side: BorderSide.none),
//   //     title: Text(
//   //       title,
//   //       style: TextStyle(fontSize: 14),
//   //     ),
//   //     childrenPadding: EdgeInsets.zero,
//   //     initiallyExpanded: _expandedTile == title,
//   //     onExpansionChanged: (isExpanded) {
//   //       setState(() {
//   //         _expandedTile = isExpanded ? title : null; // Collapse other tiles
//   //       });
//   //     },
//   //     children: children,
//   //   );
//   // }
//
//   Widget _buildMainListTile(String title, Widget page, double fontSize,
//       {IconData? icon}) {
//     return Container(
//       // decoration: BoxDecoration(
//       //   color: _selectedTile == title ? selectedbaground : Colors.transparent,
//       //   borderRadius: BorderRadius.circular(10),
//       // ),
//       child: ListTile(
//         leading: icon != null
//             ? Icon(icon,
//                 color: _selectedTile == title
//                     ? mainExpansionSelectedColor
//                     : Colors.black)
//             : null,
//         title: Text(
//           title,
//           style: TextStyle(
//               fontSize: 14,
//               color: _selectedTile == title
//                   ? mainExpansionSelectedColor
//                   : Colors.black), // Correct fontSize usage
//         ),
//         onTap: () {
//           setState(() {
//             _selectedPage = page; // Set the selected page
//             _selectedTile = title; // Set the selected tile
//           });
//         },
//       ),
//     );
//   }
//   //
//   // Widget _buildSubListTile(
//   //   String title,
//   //   Widget page,
//   // ) {
//   //   return Container(
//   //     // decoration: BoxDecoration(
//   //     //   // color: _selectedTile == title ? Colors.grey[400] : Colors.transparent,
//   //     //   // borderRadius: BorderRadius.circular(10),
//   //     // ),
//   //     child: ListTile(
//   //       leading: SizedBox(
//   //         width: 40,
//   //       ),
//   //       title: Text(
//   //         title,
//   //         style: TextStyle(
//   //             fontSize: 10,
//   //             color: _selectedTile == title
//   //                 ? Colors.blue[400]
//   //                 : Colors.black), // Correct fontSize usage
//   //       ),
//   //       onTap: () {
//   //         setState(() {
//   //           _selectedPage = page; // Set the selected page
//   //           _selectedTile = title; // Set the selected tile
//   //         });
//   //       },
//   //     ),
//   //   );
//   // }
//
//   Widget SubListTile(
//     String title,
//     Widget page,
//   ) {
//     return Container(
//       // decoration: BoxDecoration(
//       //   // color: _selectedTile == title ? Colors.grey[400] : Colors.transparent,
//       //   // borderRadius: BorderRadius.circular(10),
//       // ),
//       child: ListTile(
//         leading: SizedBox(
//           width: 40,
//         ),
//         title: Text(
//           title,
//           style: TextStyle(
//               fontSize: 14,
//               color: _selectedTile == title
//                   ? Colors.blue[400]
//                   : Colors.black), // Correct fontSize usage
//         ),
//         onTap: () {
//           setState(() {
//             _selectedPage = page; // Set the selected page
//             _selectedTile = title; // Set the selected tile
//           });
//         },
//       ),
//     );
//   }
// }
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//     );
//   }
// }
import 'package:course_connect/Admin/View/Screens/Feedback/FeedbackView.dart';
import 'package:flutter/material.dart';
// import 'package:course_connect/Admin/View/Screens/Dashboard.dart';
import 'package:course_connect/Admin/View/Screens/Courses/Addcourses.dart';
import 'package:course_connect/Admin/View/Screens/Courses/Courses.dart';
import 'package:course_connect/Admin/View/Screens/Courses/Editcourses.dart';
// import 'package:course_connect/Admin/View/Screens/House/ViewHouses.dart';
import 'package:course_connect/Admin/View/Screens/KnowledgeBank/CountryRules.dart';
import 'package:course_connect/Admin/View/Screens/Landlord/New_Landlords.dart';
// import 'package:course_connect/Admin/View/Screens/Payment/Payment_View.dart';
// import 'package:course_connect/Admin/View/Screens/Users/UserView.dart';
import 'package:course_connect/Admin/View/Screens/University/AddUniversity.dart';
import 'package:course_connect/Admin/View/Screens/University/EditUniversity.dart';
import 'package:course_connect/Admin/View/Screens/University/Universitymain.dart';

import '../../Landlord/Main/Lanlordmain.dart';
import '../View/Screens/House.dart/ViewHouses.dart';
import '../View/Screens/Payment.dart/Payment_View.dart';
import '../View/Screens/Users.dart/UserView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Connect Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Widget? _selectedPage;
  String? _selectedTile;
  String? _expandedTile;

  @override
  void initState() {
    _selectedPage = Dashboard();
    _selectedTile = "Dashboard";
    super.initState();
  }

  final mainExpansionSelectedColor = Colors.blue;
  final SubExpansionSelectedColor = Colors.pink;
  final selectedBackground = const Color(0xff0A71CB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Sidebar Navigation
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(topRight: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 160,
                    height: 122,
                  ),
                ),
                _buildMainExpansionTile(
                  title: 'Universities',
                  icon: Icons.school_outlined,
                  children: [
                    SubListTile("View University", University_main()),
                    SubListTile("Add University", AddUniversity()),
                    SubListTile("Edit University", EditUniversity()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Courses',
                  icon: Icons.book_outlined,
                  children: [
                    SubListTile("View Courses", Courses_main()),
                    SubListTile("Add Course", Addcourses()),
                    SubListTile("Edit Course", Editcourses()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Landlord',
                  icon: Icons.people_alt_outlined,
                  children: [
                    SubListTile("New Landlords", NewLandlords()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Houses',
                  icon: Icons.maps_home_work_outlined,
                  children: [
                    SubListTile("View Houses", ViewHouses()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Payment',
                  icon: Icons.payments_outlined,
                  children: [
                    SubListTile("View Payment", PaymentView()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Users',
                  icon: Icons.supervised_user_circle_sharp,
                  children: [
                    SubListTile("View Users", Userview()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Feedback',
                  icon: Icons.feedback,
                  children: [
                    SubListTile("View Feedback", FeedbackView()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Knowledge Bank',
                  icon: Icons.my_library_books_rounded,
                  children: [
                    SubListTile("Terms and Conditions", CountryRules()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Account',
                  icon: Icons.person,
                  children: [
                    // SubListTile("Account", FeedbackView()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Settings',
                  icon: Icons.settings,
                  children: [
                    // SubListTile("Account", FeedbackView()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Log Out',
                  icon: Icons.login_outlined,
                  children: [
                    // SubListTile("Account", FeedbackView()),
                  ],
                ),
              ],
            ),
          ),

          // Right side: Display selected page
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: _selectedPage ??
                  const Center(
                    child: Text('Select a management option'),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainExpansionTile({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      textColor: mainExpansionSelectedColor,
      iconColor: mainExpansionSelectedColor,
      leading: Icon(icon),
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      title: Text(title, style: const TextStyle(fontSize: 17)),
      childrenPadding: EdgeInsets.zero,
      initiallyExpanded: _expandedTile == title,
      onExpansionChanged: (isExpanded) {
        setState(() {
          _expandedTile = isExpanded ? title : null;
        });
      },
      children: children,
    );
  }

  Widget SubListTile(String title, Widget page) {
    return ListTile(
      leading: const SizedBox(width: 40),
      title: Text(title,
          style: TextStyle(
              fontSize: 14,
              color: _selectedTile == title ? Colors.blue[400] : Colors.black)),
      onTap: () {
        setState(() {
          _selectedPage = page;
          _selectedTile = title;
        });
      },
    );
  }
}
