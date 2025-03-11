import 'package:flutter/material.dart';

import '../../../Widget/Constands/CustomTextfield.dart';
import '../../../Widget/Constands/button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                CustomButton(onPressed: () {}, label: "Sign Up", text: 'hello', borderColor:Colors.cyan, textColor: Colors.blueGrey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to Course Connect AI ?"),
                    TextButton(onPressed: () {}, child: Text("Sign In"))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  CustomButton({required Null Function() onPressed, required String label, required String text, required MaterialColor borderColor, required MaterialColor textColor}) {}
}
