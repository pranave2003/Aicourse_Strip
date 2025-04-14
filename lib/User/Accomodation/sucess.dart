import 'dart:async';
import 'package:course_connect/Controller/Bloc/Booking/Booking_model/BookingModel.dart';
import 'package:course_connect/Controller/Bloc/Property/Property/Property_Auth/Property_Model/PropertyModel.dart';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_nav2.dart';
import 'package:flutter/material.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/Widget/Constands/colors.dart';

import '../Sreens/BottomNavigation/Bottom_Nav.dart';
class SuccessScreenwrapper2 extends StatelessWidget {
  const SuccessScreenwrapper2({super.key, required this.Booking});
  final Bookingmodel Booking;

  @override
  Widget build(BuildContext context) {
    return Success(
      // Booking: Booking,
    );
  }
}

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
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
                "Your Booking is Confirmed",
                textAlign: TextAlign.center,
                style: TextStyle(
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
                            builder: (context) => Bottom_nav2())); // R
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
