import 'package:course_connect/User/Ai_course_finder/BachelorsDetailsOverall.dart';
import 'package:course_connect/User/Ai_course_finder/BachelorsEducation.dart';
import 'package:course_connect/User/Ai_course_finder/BachelorsCourse.dart';
import 'package:course_connect/User/Ai_course_finder/BachelorsEnglish.dart';
import 'package:course_connect/User/Ai_course_finder/Bachelors_academictest.dart';
import 'package:course_connect/User/Ai_course_finder/Bachelors_activities.dart';
import 'package:course_connect/User/Ai_course_finder/Bachelors_internship.dart';
import 'package:course_connect/User/Ai_course_finder/Bachelors_organization.dart';
import 'package:course_connect/User/Ai_course_finder/ChooseCountry.dart';
import 'package:course_connect/User/Ai_course_finder/Degree.dart';
import 'package:course_connect/User/Ai_course_finder/MBA_Companytype.dart';
import 'package:course_connect/User/Ai_course_finder/MBA_DetailsOverall.dart';
import 'package:course_connect/User/Ai_course_finder/MBA_courses.dart';
import 'package:course_connect/User/Ai_course_finder/MastersReaserch.dart';
import 'package:course_connect/User/Ai_course_finder/Masters_courses.dart';
import 'package:course_connect/User/Ai_course_finder/Masters_education.dart';
import 'package:course_connect/User/Ai_course_finder/Masters_work.dart';
import 'package:course_connect/User/Ai_course_finder/MatersDetailsOverall.dart';
import 'package:course_connect/User/Ai_course_finder/Maters_academic.dart';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_Nav.dart';
import 'package:course_connect/User/Sreens/Home/Universities.dart';
import 'package:course_connect/User/Sreens/auth/Splash1.dart';
import 'package:course_connect/auth/Signup.dart';
import 'package:course_connect/auth/splash.dart';
import 'package:flutter/material.dart';

import '../User/Sreens/Home/homepage.dart';
import '../User/Sreens/auth/splash.dart';
import '../auth/onboarding_screen.dart';

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
      home: Homepage(),
    );
  }
}

