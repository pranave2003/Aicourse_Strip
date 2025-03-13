//
// import 'package:course_connect/Landlord/Views/Screens/Bookings/AllBookings.dart';
// import 'package:course_connect/Landlord/Views/Screens/Payments/ViewPayment.dart';
// import 'package:course_connect/Landlord/Views/Screens/Property/Property.dart';
// import 'package:course_connect/Landlord/Views/Screens/Property/PropertyAdd.dart';
// import 'package:course_connect/Landlord/Views/Screens/Property/PropertyEdit.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const AdminPage(),
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
//   Widget? _selectedPage;
//   String? _selectedTile;
//   String? _expandedTile;
//
//   var mainExpansionSelectedColor = Colors.blue;
//   var SubExpansionSelectedColor = Colors.pink;
//   var selectedBackground = const Color(0xff0A71CB);
//
//   @override
//   void initState() {
//     _selectedPage = const Dashboard();
//     _selectedTile = "Dashboard";
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Row(
//         children: [
//         // Left side: Management options
//         Container(
//         color: Colors.grey[200],
//         width: 300,
//         padding: const EdgeInsets.all(8.0),
//     child: ListView(
//     children: [
//     Container(
//     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(5),
//
//     ),
//     child: Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//     Image.asset(
//     "assets/splash_logo.png",
//     width: 60,
//     height: 80,
//     ),
//     //SizedBox(wid
//     Row(
//         children: [
//           // Left side: Management options
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
//                 const SizedBox(height: 50),
//                 Center(
//                   child: Container(
//                     width: 100,
//                     height: 100,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 _buildMainListTile('Dashboard', const Dashboard(), icon: Icons.dashboard),
//                 _buildMainExpansionTile(
//                   title: 'Property',
//                   icon: Icons.apartment,
//                   children: [
//                     _buildSubListTile("View Property",Property()),
//                     _buildSubListTile("Add Property", PropertyAdd()),
//                     _buildSubListTile("Edit Property", PropertyEdit()),
//                   ],
//                 ),
//                 _buildMainExpansionTile(
//                   title: 'Bookings',
//                   icon: Icons.book_online,
//                   children: [
//                     _buildSubListTile("All Bookings", Allbookings()),
//                     // _buildSubListTile("Accepted Bookings", const Placeholder()),
//                     // _buildSubListTile("Rejected Bookings", const Placeholder()),
//                   ],
//                 ),
//                 _buildMainExpansionTile(
//                   title: 'Payment',
//                   icon: Icons.payments_outlined,
//                   children: [
//                     _buildSubListTile("View Payment", ViewPayment()),
//                   ],
//                 ),
//               ],
//             ),
//           ),
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
//     ))),
//     );
//   }
//
//   Widget _buildMainExpansionTile({
//     required String title,
//     required IconData icon,
//     required List<Widget> children,
//   }) {
//     return ExpansionTile(
//       textColor: mainExpansionSelectedColor,
//       iconColor: mainExpansionSelectedColor,
//       leading: Icon(icon),
//       shape: const RoundedRectangleBorder(side: BorderSide.none),
//       title: Text(
//         title,
//         style: const TextStyle(fontSize: 17),
//       ),
//       initiallyExpanded: _expandedTile == title,
//       onExpansionChanged: (isExpanded) {
//         setState(() {
//           _expandedTile = isExpanded ? title : null;
//         });
//       },
//       children: children,
//     );
//   }
//
//   Widget _buildMainListTile(String title, Widget page, {IconData? icon}) {
//     return ListTile(
//       leading: icon != null
//           ? Icon(icon, color: _selectedTile == title ? mainExpansionSelectedColor : Colors.black)
//           : null,
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 14,
//           color: _selectedTile == title ? mainExpansionSelectedColor : Colors.black,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _selectedPage = page;
//           _selectedTile = title;
//         });
//       },
//     );
//   }
//
//   Widget _buildSubListTile(String title, Widget page) {
//     return ListTile(
//       leading: const SizedBox(width: 40),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 14,
//           color: _selectedTile == title ? Colors.blue[400] : Colors.black,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _selectedPage = page;
//           _selectedTile = title;
//         });
//       },
//     );
//   }
// }
//
// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: const Center(child: Text("Dashboard")),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:course_connect/Landlord/Views/Screens/Bookings/AllBookings.dart';
import 'package:course_connect/Landlord/Views/Screens/Payments/ViewPayment.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/Property.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/PropertyAdd.dart';
import 'package:course_connect/Landlord/Views/Screens/Property/PropertyEdit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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

  final Color mainExpansionSelectedColor = Colors.blue;
  final Color subExpansionSelectedColor = Colors.pink;

  @override
  void initState() {
    _selectedPage = const Dashboard();
    _selectedTile = "Dashboard";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left side: Sidebar Navigation
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
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
                const SizedBox(height: 50,width:30,),
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 160,
                    height: 122,
                  ),
                ),
                const SizedBox(height: 20),
                _buildMainListTile('Dashboard', const Dashboard(), icon: Icons.dashboard),
                _buildMainExpansionTile(
                  title: 'Property',
                  icon: Icons.apartment,
                  children: [
                    _buildSubListTile("View Property",  Property()),
                    _buildSubListTile("Add Property", PropertyAdd()),
                    _buildSubListTile("Edit Property", PropertyEdit()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Bookings',
                  icon: Icons.book_online,
                  children: [
                    _buildSubListTile("All Bookings",  Allbookings()),
                  ],
                ),
                _buildMainExpansionTile(
                  title: 'Payment',
                  icon: Icons.payments_outlined,
                  children: [
                    _buildSubListTile("View Payment",  ViewPayment()),
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
      title: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
      initiallyExpanded: _expandedTile == title,
      onExpansionChanged: (isExpanded) {
        setState(() {
          _expandedTile = isExpanded ? title : null;
        });
      },
      children: children,
    );
  }

  Widget _buildMainListTile(String title, Widget page, {IconData? icon}) {
    return ListTile(
      leading: icon != null
          ? Icon(icon, color: _selectedTile == title ? mainExpansionSelectedColor : Colors.black)
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: _selectedTile == title ? mainExpansionSelectedColor : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedPage = page;
          _selectedTile = title;
        });
      },
    );
  }

  Widget _buildSubListTile(String title, Widget page) {
    return ListTile(
      leading: const SizedBox(width: 40),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: _selectedTile == title ? Colors.blue[400] : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          _selectedPage = page;
          _selectedTile = title;
        });
      },
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: const Center(child: Text("Dashboard")),
    );
  }
}
