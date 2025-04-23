// import 'package:flutter/material.dart';
//
// import '../../../Widget/Constands/CustomTextfield.dart';
// import '../../../Widget/Constands/colors.dart';
// import '../../../Widget/Constands/button.dart';
// import '../Constands/custom_widgets.dart';
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 200,
//             ),
//             Image.asset("assets/logo.png", width: 200),
//             SizedBox(height:20,),
//             Text(
//               "Welcome Back!",
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: Column(
//                 children: [
//                   CustomTextForm(
//                     prefixIcon: Icon(Icons.email),
//                     hintText: "Email",
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   CustomTextForm(
//                     prefixIcon: Icon(Icons.lock),
//                     hintText: "Password",
//                     suffixIcon: Icon(Icons.visibility_off_outlined),
//                   ),
//                   Row(
//                     children: [
//                       Checkbox(
//                           activeColor: blueColor,
//                           value: isChecked,
//                           onChanged: (val) {
//                             setState(() {
//                               isChecked = !isChecked;
//                               // if(isChecked == false){
//                               //   isChecked = true;
//                               // }else{
//                               //   isChecked = false;
//                               // }
//                             });
//                           }),
//                       SizedBox(height: 30),
//                       Text("Remember Me?")
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   CustomButton(onPressed: () {}, label: "Login", text: '', textColor:Colors.yellow, borderColor:Colors.blue,)
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "Forgot Password?",
//                       style: TextStyle(color: Colors.black),
//                     ))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("New to Course Connect AI ?"),
//                 TextButton(onPressed: () {}, child: Text("Sign Up"))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   CustomButton({required Null Function() onPressed, required String label, required String text, required MaterialColor textColor, required MaterialColor borderColor}) {}
// }
import 'package:course_connect/User/Sreens/Authentication/UserSignup.dart';
import 'package:course_connect/User/Sreens/BottomNavigation/Bottom_Nav.dart';
import 'package:course_connect/User/Sreens/Home/homepage.dart';
import 'package:course_connect/User/Profile/Forgotpswd.dart';
// import 'package:course_connect/User/Sreens/auth/UserSignup.dart';
import 'package:flutter/material.dart';
// import 'UserSignup.dart'; // Import the SignUp page

import '../../../Widget/Constands/CustomTextfield.dart';
import '../../../Widget/Constands/colors.dart';
import '../../../Widget/Constands/button.dart';
import '../Constands/custom_widgets.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            Image.asset("assets/logo.png", width: 200),
            SizedBox(height: 20),
            Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  CustomTextForm(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                  ),
                  SizedBox(height: 10),
                  CustomTextForm(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.visibility_off_outlined),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: blueColor,
                        value: isChecked,
                        onChanged: (val) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                      ),
                      // SizedBox(height: 30),
                      // Text("Remember Me?")
                    ],
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bottom_Nav(),
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
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Forgotpswd(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.black),
                  ),

                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New to Course Connect AI ?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserSignup()), // Navigate to SignUp page
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
