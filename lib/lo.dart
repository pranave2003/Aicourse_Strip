import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: AIGenerationPage());
  }
}

class AIGenerationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for AI effect
      body: Stack(
        children: [
          // Full-screen background animation
          Positioned.fill(
            child: Lottie.asset(
              'assets/bg.json', // Background animation
              fit: BoxFit.cover,
            ),
          ),
          // Centered text and second animation
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // AI Text
                Text(
                  'Generating Courses...',
                  style: GoogleFonts.podkova(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20), // Space between text and Lottie
                // Second Lottie animation below the text
                Row(
                  children: [
                    Container(
                      child: Lottie.asset(
                        'assets/lo.json', // Second animation
                        width: 200, // Adjust size as needed
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
