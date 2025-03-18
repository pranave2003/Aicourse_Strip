import 'package:course_connect/User/Sreens/Authentication/LoginUser.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds:1000, ),() {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLogin_auth()));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png",width: 413,height: 283,)
          ],
        ),
      ),
    );
  }
}
