import 'package:course_connect/Admin/View/Screens/Payment.dart/Payment_View.dart';
import 'package:course_connect/Landlord/Views/Screens/Auth/Landloard_Login.dart';
import 'package:course_connect/Landlord/Views/Screens/Auth/Landloard_Signup.dart';
import 'package:course_connect/User/Accomodation/AccomodationDetailScreen.dart';
import 'package:course_connect/User/Accomodation/Accomodation_1.dart';
import 'package:course_connect/User/Accomodation/BookingConfirmationPage.dart';
import 'package:course_connect/User/Accomodation/BookingFormPage.dart';
import 'package:course_connect/User/Accomodation/BookingStatus.dart';
import 'package:course_connect/User/Accomodation/Feedback.dart';
import 'package:course_connect/User/Accomodation/PropertyDetailsPage.dart';
import 'package:course_connect/User/Sreens/Application/ApplicationStatusPage.dart';
import 'package:course_connect/User/Apply/Document_upload.dart';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_Nav.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/User/Profile/Forgotpswd.dart';
import 'package:course_connect/User/Profile/Notifications.dart';
// import 'package:course_connect/User/Profile/Profile.dart';
//
// import 'package:course_connect/User/Sreens/auth/UserSignup.dart';
import 'package:course_connect/User/Profile/onboarding_screen.dart';
import 'package:course_connect/User/Profile/splash.dart';
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
      home:PaymentView(),
    );
  }
}
