// import 'package:course_connect/User/Sreens/auth/Splash1.dart';
// import 'package:course_connect/User/Sreens/auth/Splash3.dart';
// import 'package:course_connect/User/Sreens/auth/splash.dart';
// import 'package:flutter/material.dart';
//
// import 'onboarding_screen.dart';
//
// class Splash2 extends StatefulWidget {
//   const Splash2({super.key});
//
//   @override
//   State<Splash2> createState() => _Splash2State();
// }
//
// class _Splash2State extends State<Splash2> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(milliseconds:1000, ),() {
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash3()));
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