import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_Nav.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/User/Sreens/auth/LoginUser.dart';
import 'package:course_connect/Widget/Constands/colors.dart';
import 'package:flutter/material.dart';

import '../../../Widget/Constands/CustomTextfield.dart';
import '../../../Widget/Constands/button.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo.png",
            width: 150,
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                CustomTextForm(
                    prefixIcon: Icon(Icons.person), hintText: "Full Name"),
                SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                    prefixIcon: Icon(Icons.phone), hintText: "Mobile Number"),
                SizedBox(height: 15),
                CustomTextForm(
                    prefixIcon: Icon(Icons.place_sharp), hintText: "Country"),
                SizedBox(height: 15),
                CustomTextForm(
                    prefixIcon: Icon(Icons.place), hintText: "State"),
                SizedBox(height: 15),

                CustomTextForm(
                    prefixIcon: Icon(Icons.place_outlined), hintText: "City"),
                SizedBox(height: 15),
                CustomTextForm(
                    prefixIcon: Icon(Icons.password), hintText: "Password"),
                SizedBox(height: 15),
                CustomTextForm(
                    prefixIcon: Icon(Icons.password_sharp), hintText: "Confirm password"),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>Bottom_Nav()
                        ),
                      );
                    },

                  child: Container(
                    height: 51,
                    width: 400,
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("New to Course Connect AI ?"),
                //     TextButton(onPressed: () {}, child: Text("Sign In"))
                //   ],
                // )
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to Course Connect AI ?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginUser()), // Navigate to SignUp page
                        );
                      },
                      child: Text("Sign In"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

}
