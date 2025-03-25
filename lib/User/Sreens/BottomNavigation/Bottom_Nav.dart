import 'package:course_connect/Controller/Bloc/User_Authbloc/auth_bloc.dart';
import 'package:course_connect/User/Accomodation/BookingStatus.dart';
import 'package:course_connect/User/Sreens/Application/ApplicationStatusPage.dart';
import 'package:course_connect/User/Sreens/Home/Universities.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
// import 'package:course_connect/User/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Profile/Profile.dart';

class BottomNavWrapper extends StatelessWidget {
  const BottomNavWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(FetchUserDetailsById()),
      child: Bottom_Nav(),
    );
  }
}

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom_Nav(),
    );
  }
}

class Bottom_Nav extends StatefulWidget {
  @override
  _Bottom_NavState createState() => _Bottom_NavState();
}

class _Bottom_NavState extends State<Bottom_Nav> {
  int _currentIndex = 0; // Track the selected page

  final List<Widget> _pages = [
    HomepageWrapper(),
    UniversitiesWrapper(),
    ApplicationStatusPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation Example")),
      body: _pages[_currentIndex], // Display the selected page

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,

        unselectedIconTheme: IconThemeData(color: Colors.black),
        selectedIconTheme: IconThemeData(color: Colors.blue),
        showUnselectedLabels: true,
        selectedFontSize: 20,
        fixedColor: Colors.blue,
        unselectedItemColor:
            Colors.black, // Set unselected label color to black
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update selected page
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Colleges"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Applications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is Page 1', style: TextStyle(fontSize: 24)),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is Page 2', style: TextStyle(fontSize: 24)),
    );
  }
}
