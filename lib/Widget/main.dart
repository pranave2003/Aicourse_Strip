import 'package:course_connect/Landlord/Views/Screens/Auth/Login.dart';
import 'package:course_connect/Landlord/Views/Screens/Auth/Signup.dart';
import 'package:course_connect/User/Accomodation/AccomodationDetailScreen.dart';
import 'package:course_connect/User/Accomodation/Accomodation_1.dart';
import 'package:course_connect/User/Accomodation/BookingConfirmationPage.dart';
import 'package:course_connect/User/Accomodation/BookingFormPage.dart';
import 'package:course_connect/User/Accomodation/BookingStatus.dart';
import 'package:course_connect/User/Accomodation/Feedback.dart';
import 'package:course_connect/User/Accomodation/PropertyDetailsPage.dart';
import 'package:course_connect/User/Ai_course_finder/ApplicationStatusPage.dart';
import 'package:course_connect/User/Ai_course_finder/Document_upload.dart';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_Nav.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/User/Sreens/auth/Forgotpswd.dart';
import 'package:course_connect/User/Sreens/auth/Notifications.dart';
import 'package:course_connect/User/Sreens/Profile/Profile.dart';
import 'package:course_connect/User/Sreens/auth/Splash1.dart';
import 'package:course_connect/User/Sreens/auth/Splash2.dart';
import 'package:course_connect/User/Sreens/auth/Splash3.dart';
import 'package:course_connect/User/Sreens/Authentication/UserSignup.dart';
import 'package:course_connect/User/Sreens/auth/onboarding_screen.dart';
import 'package:course_connect/User/Sreens/auth/splash.dart';
import 'package:flutter/material.dart';

void main() {
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
      home:Profile(),
    );
  }
}
