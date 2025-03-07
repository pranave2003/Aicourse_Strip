import 'package:flutter/material.dart';

import '../View/Screens/University/EditUniversity.dart';
import '../View/Screens/University/Universitymain.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Widget? _selectedPage; // Variable to hold the currently selected page
  String? _selectedTile; // Tracks the selected tile
  String? _expandedTile;

  @override
  void initState() {
    // TODO: implement initState
    _selectedPage = Dashboard();
    _selectedTile = "Dashboard";
    super.initState();
  }

  var mainExpansionSelectedColor = Colors.blue;
  var SubExpansionSelectedColor = Colors.pink;
  var selectedbaground = Color(0xff0A71CB);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left side: Management options
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 2, // Extends the shadow
                  blurRadius: 5, // Softens the shadow
                  offset: Offset(2, 4), // Changes position (x, y)
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // //////////////////////
                _buildMainListTile('Dashboard', const Dashboard(), 16,
                    icon: Icons.dashboard),
                // /////////////////////////

                _buildMainExpansionTile(
                    title: 'University',
                    icon: Icons.add,
                    children: [
                      SubListTile("View University", University_main()),
                      SubListTile("Edit University", EditUniversity()),
                      SubListTile("Edit University", EditUniversity())
                    ]),
              ],
            ),
          ),

          // Right side: Display selected page or add role form
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: _selectedPage ??
                  Center(
                    child: const Text('Select a management option'),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainExpansionTile({
    required String title,
    IconData? icon, // Made optional
    required List<Widget> children,
    e,
  }) {
    return ExpansionTile(
      textColor: mainExpansionSelectedColor,
      iconColor: mainExpansionSelectedColor,
      leading: Icon(
        icon,
      ), // Show icon only if it's provided
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      title: Text(
        title,
        style: TextStyle(fontSize: 17),
      ),
      childrenPadding: EdgeInsets.zero,
      initiallyExpanded: _expandedTile == title,
      onExpansionChanged: (isExpanded) {
        setState(() {
          _expandedTile = isExpanded ? title : null; // Collapse other tiles
        });
      },
      children: children,
    );
  }

  // Widget _buildESubxpansion({
  //   required String title,
  //   required List<Widget> children,
  // }) {
  //   return ExpansionTile(
  //     textColor: SubExpansionSelectedColor,
  //     iconColor: SubExpansionSelectedColor,
  //     leading: Icon(
  //       null,
  //     ), // Show icon only if it's provided
  //     shape: const RoundedRectangleBorder(side: BorderSide.none),
  //     title: Text(
  //       title,
  //       style: TextStyle(fontSize: 14),
  //     ),
  //     childrenPadding: EdgeInsets.zero,
  //     initiallyExpanded: _expandedTile == title,
  //     onExpansionChanged: (isExpanded) {
  //       setState(() {
  //         _expandedTile = isExpanded ? title : null; // Collapse other tiles
  //       });
  //     },
  //     children: children,
  //   );
  // }

  Widget _buildMainListTile(String title, Widget page, double fontSize,
      {IconData? icon}) {
    return Container(
      // decoration: BoxDecoration(
      //   color: _selectedTile == title ? selectedbaground : Colors.transparent,
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: ListTile(
        leading: icon != null
            ? Icon(icon,
                color: _selectedTile == title
                    ? mainExpansionSelectedColor
                    : Colors.black)
            : null,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 14,
              color: _selectedTile == title
                  ? mainExpansionSelectedColor
                  : Colors.black), // Correct fontSize usage
        ),
        onTap: () {
          setState(() {
            _selectedPage = page; // Set the selected page
            _selectedTile = title; // Set the selected tile
          });
        },
      ),
    );
  }
  //
  // Widget _buildSubListTile(
  //   String title,
  //   Widget page,
  // ) {
  //   return Container(
  //     // decoration: BoxDecoration(
  //     //   // color: _selectedTile == title ? Colors.grey[400] : Colors.transparent,
  //     //   // borderRadius: BorderRadius.circular(10),
  //     // ),
  //     child: ListTile(
  //       leading: SizedBox(
  //         width: 40,
  //       ),
  //       title: Text(
  //         title,
  //         style: TextStyle(
  //             fontSize: 10,
  //             color: _selectedTile == title
  //                 ? Colors.blue[400]
  //                 : Colors.black), // Correct fontSize usage
  //       ),
  //       onTap: () {
  //         setState(() {
  //           _selectedPage = page; // Set the selected page
  //           _selectedTile = title; // Set the selected tile
  //         });
  //       },
  //     ),
  //   );
  // }

  Widget SubListTile(
    String title,
    Widget page,
  ) {
    return Container(
      // decoration: BoxDecoration(
      //   // color: _selectedTile == title ? Colors.grey[400] : Colors.transparent,
      //   // borderRadius: BorderRadius.circular(10),
      // ),
      child: ListTile(
        leading: SizedBox(
          width: 40,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 14,
              color: _selectedTile == title
                  ? Colors.blue[400]
                  : Colors.black), // Correct fontSize usage
        ),
        onTap: () {
          setState(() {
            _selectedPage = page; // Set the selected page
            _selectedTile = title; // Set the selected tile
          });
        },
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
    );
  }
}
