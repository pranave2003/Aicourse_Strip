import 'dart:async';
import 'package:course_connect/Controller/Bloc/University_block/university_bloc.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Controller/Bloc/University_block/University_model/University_model.dart';
import '../../Controller/Bloc/User_Authbloc/auth_bloc.dart';
import '../Sreens/BottomNavigation/Bottom_Nav.dart';
class SuccessScreenwrapper extends StatelessWidget {
  const SuccessScreenwrapper({super.key, required this.university});
  final University_model university;

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      university: university,
    );
  }
}


class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key, required this.university});

  final University_model university;

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}


class _SuccessScreenState extends State<SuccessScreen> {
  int _seconds = 10;
  Timer? _timer;


  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 1) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  BottomNavWrapper()), // Replace with Page1() if needed
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 60,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Your application to ${widget.university.Universityname} is successful. You will get a notification after the confirmation.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: 30),
              Text(
                "Redirecting in $_seconds seconds...",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              SizedBox(height: 180),
              SizedBox(
                width: 350,
                height: 50,
                child: InkWell(
                  onTap: () {
                    _timer?.cancel();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavWrapper())); // R
                  },
                  child: Container(
                    height: 51,
                    width: 231,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Go to Home",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
