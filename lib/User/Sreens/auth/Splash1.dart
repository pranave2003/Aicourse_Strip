import 'package:course_connect/User/Sreens/auth/Splash1.dart';
import 'package:course_connect/User/Sreens/auth/Splash2.dart';
import 'package:course_connect/User/Sreens/auth/splash.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(milliseconds:1000, ),() {
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash2()));
  //   },);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/splash.png",
                width: 413,
                height: 376,
              ),
              SizedBox(height: 50),
              Text(
                "Top Ranked Universities",
                style: TextStyle(
                    color: Color(0xff1D386E),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                "Study global,Get more out \n    of your career",
                style: TextStyle(
                    color: Color(0xff797597),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(height:50),
              Text("skip",style: TextStyle(color: Color(0xff0A71CB),fontSize:16),)
            ],
          ),
        ),
      ),
    );
  }
}
