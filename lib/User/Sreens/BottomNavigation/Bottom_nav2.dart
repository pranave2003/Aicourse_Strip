import 'package:course_connect/User/Accomodation/AccomodationDetailScreen.dart';
import 'package:course_connect/User/Accomodation/BookingStatus.dart';
import 'package:course_connect/User/Accomodation/Feedback.dart';
import 'package:course_connect/User/Sreens/Home/Universities.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom_nav2(),
    );
  }
}

class Bottom_nav2 extends StatefulWidget {
  @override
  _Bottom_nav2State createState() => _Bottom_nav2State();
}

class _Bottom_nav2State extends State<Bottom_nav2> {
  int _currentIndex = 0; // Track the selected page

  final List<Widget> _pages = [
    AccommodationDetailScreen(),
    BookingStatus(),
    // FeedbackScreen(),
    // Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation Example")),
      body: _pages[_currentIndex], // Display the selected page
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedIconTheme: IconThemeData(color: Colors.black),
      //   selectedIconTheme: IconThemeData(color: Colors.blue),
      //   showUnselectedLabels: true,
      //   selectedFontSize: 20,
      //   fixedColor: Colors.blue,
      //   unselectedLabelStyle: TextStyle(color: Colors.black),
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index; // Update selected page
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: "Colleges"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.chat_outlined), label: "Chatbot"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(color: Colors.black),
        selectedIconTheme: IconThemeData(color: Colors.blue),
        showUnselectedLabels: true,
        selectedFontSize: 20,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.black, // Set unselected label color to black
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update selected page
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_sharp), label: "Bookings"),
          // BottomNavigationBarItem(icon: Icon(Icons.feedback_sharp), label: "Feedback"),

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


