// import 'package:course_connect/User/Sreens/auth/LoginUser.dart';
// import 'package:course_connect/User/Sreens/auth/Splash1.dart';
// import 'package:course_connect/User/Sreens/auth/splash.dart';
// import 'package:flutter/material.dart';
//
// import 'onboarding_screen.dart';
//
// class Splash3 extends StatefulWidget {
//   const Splash3({super.key});
//
//   @override
//   State<Splash3> createState() => _Splash3State();
// }
//
// class _Splash3State extends State<Splash3> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(milliseconds:1000, ),() {
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
//     },);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset("assets/splash.png",width: 413,height: 283,)
//           ],
//         ),
//       ),
//     );
//   }
// }